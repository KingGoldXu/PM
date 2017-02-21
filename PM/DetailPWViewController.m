//
//  DetailPWViewController.m
//  PM
//
//  Created by Apple on 16/1/17.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "DetailPWViewController.h"

@interface DetailPWViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *Id;
@property (weak, nonatomic) IBOutlet UILabel *PassWord;
@property (weak, nonatomic) IBOutlet UIButton *CopyP;
@property (weak, nonatomic) IBOutlet UIButton *CopyIDP;

@end

@implementation DetailPWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.Title.text=self.password.title;
    self.Id.text=self.password.pid;
    self.PassWord.text=self.password.password;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithPW:(Password *)aPassword{
    self=[self init];

    self.password=[[Password alloc]initWithPW:aPassword];

    return self;
    
}
- (IBAction)clickBtnCP:(id)sender {
//    NSLog(@"clickBtnCP");
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string=self.PassWord.text;
    
}
- (IBAction)clickBtnCIP:(id)sender {
//    NSLog(@"clickBtnCIP");
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    NSMutableString *ip=[[NSMutableString alloc]initWithString:@"账号："];
    [ip appendString:self.Id.text];
    [ip appendString:@" 密码："];
    [ip appendString:self.PassWord.text];
    pboard.string=ip;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
