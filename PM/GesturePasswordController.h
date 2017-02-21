//
//  GesturePasswordController.h
//  PM
//
//  Created by 徐圣斌 on 16/1/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TentacleView.h"
#import "GesturePasswordView.h"

@interface GesturePasswordController : UIViewController <VerificationDelegate,ResetDelegate,GesturePasswordDelegate>

@property (nonatomic,assign) BOOL is_reset;//for reset

- (void)clear;

- (BOOL)exist;

@end