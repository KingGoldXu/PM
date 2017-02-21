//
//  GesturePasswordView.h
//  PM
//
//  Created by 徐圣斌 on 16/1/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

@protocol GesturePasswordDelegate

- (void)forget;
- (void)change;

@end

#import <UIKit/UIKit.h>
#import "TentacleView.h"

@interface GesturePasswordView : UIView<TouchBeginDelegate>

@property (nonatomic,strong) TentacleView * tentacleView;

@property (nonatomic,strong) UILabel * state;

@property (nonatomic,assign) id<GesturePasswordDelegate> gesturePasswordDelegate;

@property (nonatomic,strong) UIImageView * imgView;
@property (nonatomic,strong) UIButton * forgetButton;
@property (nonatomic,strong) UIButton * changeButton;

@end

