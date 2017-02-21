//
//  PasswordViewController.m
//  PM
//
//  Created by Apple on 16/1/15.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "PasswordViewController.h"
#import "PasswordListTableViewController.h"
@interface PasswordViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *Id;
@property (weak, nonatomic) IBOutlet UILabel *Password;
@property (weak, nonatomic) IBOutlet UIButton *CopyP;
@property (weak, nonatomic) IBOutlet UIButton *CopyIDP;

@end

@implementation PasswordViewController

- (IBAction) unwindToList:(UIStoryboardSegue *)segue{
    PasswordListTableViewController *source=[segue sourceViewController];
    Password *curp = source.password;
    if(curp!=nil){
        self.Title.text=curp.title;
        self.Id.text=curp.pid;
        self.Password.text=curp.password;
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
