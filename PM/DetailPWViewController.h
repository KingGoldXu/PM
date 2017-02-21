//
//  DetailPWViewController.h
//  PM
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Password.h"

@interface DetailPWViewController : UIViewController

@property (retain,nonatomic)Password *password;

-(id)initWithPW:(Password *)aPassword;

@end
