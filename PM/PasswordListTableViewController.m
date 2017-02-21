//
//  PasswordListTableViewController.m
//  PM
//
//  Created by Apple on 15/12/20.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "PasswordListTableViewController.h"
#import "PasswordViewController.h"
#import "Password.h"
#import "AddViewController.h"
#import "DetailPWViewController.h"
#import "GesturePasswordController.h"

@interface PasswordListTableViewController ()

@property NSMutableArray *passwords;

@end

@implementation PasswordListTableViewController

- (IBAction) unwindToList:(UIStoryboardSegue *)segue{
    AddViewController *source=[segue sourceViewController];
    Password *newp = source.newp;
    if(newp!=nil){
        [self.passwords addObject:newp];
        NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *path=[docPath stringByAppendingPathComponent:@"passwords.list"];
        [NSKeyedArchiver archiveRootObject:self.passwords toFile:path];
    }
    [self.tableView reloadData];
    
}

- (void)loadInitialData {
    /*Group *group1=[[Group alloc] init];
     group1.groupName=@"pay";
     [self.groups addObject:group1];*/
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GesturePasswordController *GPC=[[GesturePasswordController alloc]init];
    [self presentViewController:GPC animated:YES completion:nil];
    
    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *path=[docPath stringByAppendingPathComponent:@"passwords.list"];
    NSMutableArray *pass=[NSKeyedUnarchiver unarchiveObjectWithFile:path];
    self.passwords=[[NSMutableArray alloc] initWithArray:pass];
//    self.passwords = [[NSMutableArray alloc] init];
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.passwords count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Password *password  = [self.passwords objectAtIndex:indexPath.row];
    cell.textLabel.text = password.title;
    //NSLog(cell.textLabel.text);
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.password = [self.passwords objectAtIndex:indexPath.row];

    Password *pw=[[Password alloc]initWithPW:self.password];
//    DetailPWViewController *detailView = [[DetailPWViewController alloc]initWithNibName:@"DetailPWViewController" bundle:nil];
    DetailPWViewController *detailView=[[DetailPWViewController alloc] initWithPW:pw];
//    detailView.password=pw;
//    NSLog(detailView.password.title);
//    NSLog(detailView.password.pid);
//    NSLog(detailView.password.password);
    [self.navigationController pushViewController: detailView animated:NO];
    
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.passwords removeObjectAtIndex:indexPath.row];
        NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        NSString *path=[docPath stringByAppendingPathComponent:@"passwords.list"];
        [NSKeyedArchiver archiveRootObject:self.passwords toFile:path];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
