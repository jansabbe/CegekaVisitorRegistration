//
//  CGKViewController.m
//  CegekaVisitorRegistration
//
//  Created by Jan Sabbe on 18/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKInputViewController.h"
#import "CGKAppDelegate.h"
@interface CGKInputViewController ()

@end

@implementation CGKInputViewController 

- (IBAction)firstNameEdited:(id)sender {
    self.badgeView.firstName = self.firstNameTextField.text;
    [self.badgeView setNeedsDisplay];
}

- (IBAction)lastNameEdited:(id)sender {
    self.badgeView.lastName = self.lastNameTextField.text;
    [self.badgeView setNeedsDisplay];
}

- (IBAction)visitingEdited:(id)sender {
    self.badgeView.visiting = self.visitingTextField.text;
    [self.badgeView setNeedsDisplay];
}

- (IBAction)emailEdited:(id)sender {
}

- (IBAction)licensePlateEdited:(id)sender {
}

- (IBAction)handleVisitorInput:(id)sender {
    [self storeVisitorInput];
    [self printVisitorBadge];
}

- (NSManagedObjectContext *)managedObjectContext{
    CGKAppDelegate *delegate = (CGKAppDelegate*)[[UIApplication sharedApplication] delegate];
    return delegate.managedObjectContext;
}

- (void) storeVisitorInput {
    NSLog(@"CGKInputViewController: printVisitorBadge was called...");
    NSError *error = nil;
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.managedObjectContext];
    
    visitor.firstName = self.firstNameTextField.text;
    visitor.lastName = self.lastNameTextField.text;
    visitor.visiting = self.visitingTextField.text;
    visitor.licensePlate = self.licensePlateTextField.text;
    visitor.email = self.emailTextField.text;
    
    [self.managedObjectContext save:&error];
}

- (void) printVisitorBadge {

    UIImage *image = [self.badgeView getBadgeImage];
    
    UIPrintInteractionController *printController = [UIPrintInteractionController sharedPrintController];
    
    if (printController && [UIPrintInteractionController canPrintData:UIImagePNGRepresentation(image)]) {
        
        printController.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [self printJobName];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        printController.printInfo = printInfo;
        printController.showsPageRange = YES;
        printController.printingItem = image;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
            if (!completed && error) {
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }
        };
        
        [printController presentAnimated:YES completionHandler:completionHandler];  
    }
}

- (id) printJobName {
    return [NSString stringWithFormat: @"%@_%@", self.firstNameTextField.text, self.lastNameTextField.text];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
