//
//  CGKViewController.h
//  CegekaVisitorRegistration
//
//  Created by Jan Sabbe on 18/06/13.
//  Copyright (c) 2013 Cegeka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGKBadgeView.h"
#import "CGKVisitor.h"

@interface CGKInputViewController : UIViewController /*<UIPrintInteractionControllerDelegate>*/

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//@property (strong, nonatomic) CGKVisitor *visitor;

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *visitingTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *licensePlateTextField;

@property (strong, nonatomic) IBOutlet CGKBadgeView *badgeView;

- (IBAction)firstNameEdited:(id)sender;
- (IBAction)lastNameEdited:(id)sender;
- (IBAction)visitingEdited:(id)sender;
- (IBAction)emailEdited:(id)sender;
- (IBAction)licensePlateEdited:(id)sender;

- (IBAction)printVisitorBadge:(id)sender;



@end
