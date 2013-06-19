//
//  CGKExportViewController.h
//  CegekaVisitorRegistration
//
//  Created by Werner Ramaekers on 19/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGKExportViewController : UIViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UIButton *sendButton;
@property (nonatomic, strong) IBOutlet UISwitch *sendAllVisitorsSwitch;

- (IBAction)sendVisitorList:(id)sender;


@end
