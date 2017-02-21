//
//  PasswordListTableViewController.h
//  PM
//
//  Created by Apple on 15/12/20.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Password.h"

@interface PasswordListTableViewController : UITableViewController

- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
@property Password *password;
//@property (nonatomic, assign) id<PasswordListTableViewControllerDelegate> delegate;

@end

@protocol PasswordListTableViewControllerDelegate
@optional

- (void)PasswordListTableViewController:

(PasswordListTableViewController *)sender didSelectWithItem:(id)program;

@end