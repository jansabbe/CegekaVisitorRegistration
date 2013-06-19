//
//  CGKWelcomeViewController.m
//  CegekaVisitorRegistration
//
//  Created by Werner Ramaekers on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKWelcomeViewController.h"
#import "CGKInputViewController.h"
#import "CGKExportViewController.h"

@interface CGKWelcomeViewController ()

@end

@implementation CGKWelcomeViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"inputViewController"]) {
//        CGKInputViewController *inputVC = segue.destinationViewController;
//        [inputVC setManagedObjectContext:self.managedObjectContext];
//    } else if ([segue.identifier isEqualToString:@"exportViewController"]){
//        CGKExportViewController *exportVC = segue.destinationViewController;
//        [exportVC setManagedObjectContext:self.managedObjectContext];
//    }
//}

@end
