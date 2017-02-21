//
//  GesturePasswordController.m
//  PM
//
//  Created by 徐圣斌 on 16/1/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <Security/Security.h>
#import <CoreFoundation/CoreFoundation.h>

#import "GesturePasswordController.h"
#import "PasswordListTableViewController.h"
#import "ViewController.h"

//#import "KeychainItemWrapper.h"

@interface GesturePasswordController ()

@property (nonatomic,strong) GesturePasswordView * gesturePasswordView;

@end

@implementation GesturePasswordController {
    NSString * previousString;
    NSString * password;
}

@synthesize gesturePasswordView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    previousString = [NSString string];
//    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture" accessGroup:nil];
//    password = [keychin objectForKey:(__bridge id)kSecValueData];
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"GP"];
    password=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    self.is_reset=NO;
    if ([password isEqualToString:@""]||password==nil) {
        
        [self reset];
    }
    else {
//        NSLog(@"password");
//        NSLog(password);
        [self verify];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 验证手势密码
- (void)verify{
    gesturePasswordView = [[GesturePasswordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [gesturePasswordView.tentacleView setRerificationDelegate:self];
    [gesturePasswordView.tentacleView setStyle:1];
    [gesturePasswordView setGesturePasswordDelegate:self];
    [self.view addSubview:gesturePasswordView];
}

#pragma mark - 重置手势密码
- (void)reset{
    gesturePasswordView = [[GesturePasswordView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [gesturePasswordView.tentacleView setResetDelegate:self];
    [gesturePasswordView.tentacleView setStyle:2];
    //    [gesturePasswordView.imgView setHidden:YES];
    [gesturePasswordView.forgetButton setHidden:YES];
    [gesturePasswordView.changeButton setHidden:YES];
    [self.view addSubview:gesturePasswordView];
}

#pragma mark - 判断是否已存在手势密码
- (BOOL)exist{
//    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture" accessGroup:nil];
//    password = [keychin objectForKey:(__bridge id)kSecValueData];

    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"GP"];
    password=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if ([password isEqualToString:@""]||password==nil)return NO;
    return YES;
}

#pragma mark - 清空记录
- (void)clear{
//    KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture" accessGroup:nil];
//    [keychin resetKeychainItem];
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"GP"];
    [NSKeyedArchiver archiveRootObject:@"" toFile:path];
}

#pragma mark - 改变手势密码
- (void)change{
    NSLog(@"change");
    self.is_reset=YES;
    [self verify];
}

#pragma mark - 忘记手势密码
- (void)forget{
    NSLog(@"forget");

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定重置" message:@"此操作会清除手势密码和已保存的密码列表，确定清除？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:nil];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:resetAction];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (BOOL)verification:(NSString *)result{
    if ([result isEqualToString:password]) {
        [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [gesturePasswordView.state setText:@"输入正确"];
        
//        PasswordListTableViewController *pwView=[[PasswordListTableViewController alloc] init];
//        [self.navigationController pushViewController: pwView animated:NO];
//        ViewController *view=[[ViewController alloc]init];
//        UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
//        PasswordListTableViewController *pwView = [mainStoryboard instantiateViewControllerWithIdentifier:@"passwordlistn"];
//        [self presentViewController:pwView animated:YES completion:nil];
        if (self.is_reset) {
            [self clear];
            [self reset];
        }
        else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }
        return YES;
    }
    [gesturePasswordView.state setTextColor:[UIColor redColor]];
    [gesturePasswordView.state setText:@"手势密码错误"];
    return NO;
}

- (BOOL)resetPassword:(NSString *)result{
    if ([previousString isEqualToString:@""]||previousString==nil) {
        previousString=result;
        [gesturePasswordView.tentacleView enterArgin];
        [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [gesturePasswordView.state setText:@"请验证输入密码"];
        return YES;
    }
    else {
        if ([result isEqualToString:previousString]) {
//            KeychainItemWrapper * keychin = [[KeychainItemWrapper alloc]initWithIdentifier:@"Gesture" accessGroup:nil];
//            [keychin setObject:@"<帐号>" forKey:(__bridge id)kSecAttrAccount];
//            [keychin setObject:result forKey:(__bridge id)kSecValueData];
            NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
            NSString *path=[docPath stringByAppendingPathComponent:@"GP"];
            [NSKeyedArchiver archiveRootObject:result toFile:path];
            
            //[self presentViewController:(UIViewController) animated:YES completion:nil];
            [gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
            [gesturePasswordView.state setText:@"已保存手势密码"];
            [self dismissViewControllerAnimated:YES completion:nil];
            return YES;
        }
        else{
            previousString =@"";
            [gesturePasswordView.state setTextColor:[UIColor redColor]];
            [gesturePasswordView.state setText:@"两次密码不一致，请重新输入"];
            return NO;
        }
    }
}




/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
