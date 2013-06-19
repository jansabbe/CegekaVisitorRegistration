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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Default" ofType:@"png"];
    NSData *dataFromPath = [NSData dataWithContentsOfFile:path];
    
    UIPrintInteractionController *printController = [UIPrintInteractionController sharedPrintController];
    
    if(printController && [UIPrintInteractionController canPrintData:dataFromPath]) {
        
        printController.delegate = self;
        
        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
        printInfo.outputType = UIPrintInfoOutputGeneral;
        printInfo.jobName = [path lastPathComponent];
        printInfo.duplex = UIPrintInfoDuplexLongEdge;
        printController.printInfo = printInfo;
        printController.showsPageRange = YES;
        printController.printingItem = dataFromPath;
        
        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
            if (!completed && error) {
                NSLog(@"FAILED! due to error in domain %@ with error code %u", error.domain, error.code);
            }
        };
        
        [printController presentAnimated:YES completionHandler:completionHandler];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn addTarget:self action:@selector(printItem) forControlEvents:UIControlEventTouchDown];
//    [btn setTitle:@"PRINT" forState:UIControlStateNormal];
//    btn.frame = CGRectMake(0, 100, 320, 50);
//    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
