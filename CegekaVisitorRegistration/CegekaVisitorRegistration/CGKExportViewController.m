//
//  CGKExportViewController.m
//  CegekaVisitorRegistration
//
//  Created by Werner Ramaekers on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKExportViewController.h"
#import "CGKVisitor.h"
#import <MessageUI/MessageUI.h>

@interface CGKExportViewController ()

@end

@implementation CGKExportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //TODO : add the date of the last unsent visitor
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendVisitorList:(id)sender{
    //get the list of visitors from CoreData

    NSArray *listOfVisitorsSinceLastExport = [CGKVisitor visitorsSince:_sendAllVisitorsSwitch.isOn inManagedObjectContext:_managedObjectContext];
    if ([listOfVisitorsSinceLastExport count] > 0) {
        NSMutableString *visitorList = nil;
        for (CGKVisitor *visitor in listOfVisitorsSinceLastExport) {
            [visitorList appendString:[visitor descriptionForCSV]];
            [visitorList appendString:@"\n"];
        }
        //open the MailComposeViewController

        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        [mailVC setSubject:@"The list of visitors at Cegeka"];
        [mailVC addAttachmentData:[visitorList dataUsingEncoding:NSUTF8StringEncoding] mimeType:@"text/csv" fileName:@"visitors.csv"];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No visitors" message:@"There were no visitors since the last export" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
@end
