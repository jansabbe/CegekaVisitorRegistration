//
//  CGKViewController.m
//  CegekaVisitorRegistration
//
//  Created by Jan Sabbe on 18/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import "CGKInputViewController.h"

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

- (IBAction)printVisitorBadge:(id)sender {
    NSError *error = nil;
    NSLog(@"CGKInputViewController: printVisitorBadge was called...");
    CGKVisitor* visitor = [CGKVisitor insertInManagedObjectContext:self.managedObjectContext];
    visitor.firstName = self.firstNameTextField.text;
    visitor.lastName = self.lastNameTextField.text;
    visitor.visiting = self.visitingTextField.text;
    visitor.licensePlate = self.licensePlateTextField.text;
    visitor.email = self.emailTextField.text;
    [self.managedObjectContext save:&error];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"CGKInputViewController: viewDidLoad was called ...");
    NSLog(@"badgeView: %@", self.badgeView);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
