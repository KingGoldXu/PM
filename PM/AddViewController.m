//
//  AddViewController.m
//  PM
//
//  Created by Apple on 15/12/1.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "AddViewController.h"
#import "ONEViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UIButton *OKBtn;
@property (weak, nonatomic) IBOutlet UIButton *CancelBtn;
@property (weak, nonatomic) IBOutlet UITextField *Title;
@property (weak, nonatomic) IBOutlet UITextField *ID;
@property (weak, nonatomic) IBOutlet UITextField *Password;
@property (weak, nonatomic) IBOutlet UITextField *Classify;
@property (weak, nonatomic) IBOutlet UIButton *ONEBtn;

@end

@implementation AddViewController

-(IBAction) unwindToList:(UIStoryboardSegue *)segue{
    ONEViewController *one=[segue sourceViewController];
    NSString *password = one.password;
    self.Password.text=password;
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.OKBtn){
        
    }
    else if(sender == self.ONEBtn){
        
    }
    else if (sender == self.CancelBtn) {
        return;
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
