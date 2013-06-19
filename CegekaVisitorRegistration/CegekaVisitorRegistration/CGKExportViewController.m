//
//  CGKExportViewController.m
//  CegekaVisitorRegistration
//
//  Created by Werner Ramaekers on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKExportViewController.h"
#import "CGKVisitor.h"

#import "CGKAppDelegate.h"

@interface CGKExportViewController ()

@end

@implementation CGKExportViewController

@synthesize managedObjectContext = _managedObjectContext;

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

- (NSManagedObjectContext *)managedObjectContext{
    if (!_managedObjectContext) {
        CGKAppDelegate* delegate = (CGKAppDelegate*)[[UIApplication sharedApplication] delegate];
        _managedObjectContext = delegate.managedObjectContext;
    }
    return _managedObjectContext;
}

- (IBAction)sendVisitorList:(id)sender{
    NSData* visitorCsvData = [self visitorCsvAttachmentWithOnlyUnsentVisitors:_sendAllVisitorsSwitch.isOn];
    if (visitorCsvData) {
        //open the MailComposeViewController
        MFMailComposeViewController *mailVC = [[MFMailComposeViewController alloc] init];
        [mailVC setSubject:@"The list of visitors at Cegeka"];
        mailVC.mailComposeDelegate = self;
        [mailVC addAttachmentData:visitorCsvData mimeType:@"text/csv" fileName:@"visitors.csv"];
        [self presentViewController:mailVC animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No visitors" message:@"There were no visitors since the last export" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    NSAssert(!error, @"Error occured: %@", error);

    if (result == MFMailComposeResultSent) {
        NSArray *listOfVisitorsSinceLastExport = [CGKVisitor visitorsSince:_sendAllVisitorsSwitch.isOn inManagedObjectContext:self.managedObjectContext];

        [listOfVisitorsSinceLastExport makeObjectsPerformSelector:@selector(markAsSentToAdmin)];
        
        NSError* saveError;
        [self.managedObjectContext save:&saveError];
        NSAssert(!saveError, @"Error occured: %@", saveError);
    }
}

- (NSData*) visitorCsvAttachmentWithOnlyUnsentVisitors:(BOOL) onlyUnsentVisitors
{
    NSArray *listOfVisitorsSinceLastExport = [CGKVisitor visitorsSince:onlyUnsentVisitors inManagedObjectContext:self.managedObjectContext];
    if ([listOfVisitorsSinceLastExport count] > 0) {
        NSMutableString *visitorList = [[NSMutableString alloc] init];
        for (CGKVisitor *visitor in listOfVisitorsSinceLastExport) {
            [visitorList appendString:[visitor descriptionForCSV]];
            [visitorList appendString:@"\n"];
        }
        return [visitorList dataUsingEncoding:NSUTF8StringEncoding];
    }
    return nil;
}


@end
