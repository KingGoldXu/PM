//
//  AddViewController.h
//  PM
//
//  Created by Apple on 15/12/1.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"Password.h"

@interface AddViewController : UIViewController

@property Password *newp;

- (IBAction) unwindToList:(UIStoryboardSegue *)segue;
@end
