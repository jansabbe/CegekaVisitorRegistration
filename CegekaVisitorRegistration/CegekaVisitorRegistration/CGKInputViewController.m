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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstNameEdited:(id)sender {
    self.firstNameLabel.text = self.firstNameTextField.text;
}

- (IBAction)lastNameEdited:(id)sender {
    self.lastNameLabel.text = self.lastNameTextField.text;
}

- (IBAction)visitingEdited:(id)sender {
    self.visitingLabel.text = self.visitingTextField.text;
}

- (IBAction)emailEdited:(id)sender {
}

- (IBAction)licensePlateEdited:(id)sender {
}

- (IBAction)printVisitorBadge:(id)sender {
    NSLog(@"Printing the badge ...");
}
@end
