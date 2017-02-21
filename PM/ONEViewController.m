//
//  ONEViewController.m
//  PM
//
//  Created by Apple on 15/12/1.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "ONEViewController.h"

@interface ONEViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *SC2;
@property (weak, nonatomic) IBOutlet UITextField *NumOfPassword;
@property (weak, nonatomic) IBOutlet UIButton *FinishBtn;

@end

@implementation ONEViewController

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == self.FinishBtn){
        //        self.password=@"88888888";
        int i=(int)self.SC2.selectedSegmentIndex;
        int j=8;
        NSString *temp=self.NumOfPassword.text;
        j=[temp intValue];
        if(j<6){
            j=6;
        }
        Boolean has_1=NO;
        Boolean has_a=NO;
        Boolean has_A=NO;
        char pw[j+1];
        switch (i) {
            case 0:
                for(int k=0;k<j;k++){
                    pw[k]='0'+(arc4random() % 10);
                }
                pw[j]='\0';
                
                break;
            case 1:
                do{
                    for(int k=0;k<j;k++){
                        int t=arc4random()%36;
                        if(t>9){
                            pw[k]='a'+t-10;
                            has_a=YES;
                        }
                        else{
                            pw[k]='0'+t;
                            has_1=YES;
                        }
                    }
                    pw[j]='\0';
                }while (!(has_1&&has_a));
                break;
            case 2:
                do{
                    for(int k=0;k<j;k++){
                        int t=arc4random()%62;
                        if(t<10){
                            pw[k]='0'+t;
                            has_1=YES;
                        }
                        else if(t<36){
                            pw[k]='a'+t-10;
                            has_a=YES;
                        }
                        else{
                            pw[k]='A'+t-36;
                            has_A=YES;
                        }
                    }
                    pw[j]='\0';
                }while(!(has_1&&has_A&&has_a));
                break;
            case 3:
                for(int k=0;k<j;k++){
                    pw[k]='!'+(arc4random() % 92);
                }
                pw[j]='\0';
                break;
            default:
                self.password=@"888888";
                break;
        }
        self.password=[[NSString alloc] initWithCString:pw encoding:0];
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
