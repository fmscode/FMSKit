//
//  ViewController.m
//  FMSKit
//
//  Created by Frank Michael on 6/3/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import "ViewController.h"
#import <ReuseWebView.h>
#import <TextEditorView.h>

@interface ViewController () <TextEditorDelegate>

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Examples
#pragma mark Reuse WebView
- (void)showReuseWebView{
    ReuseWebView *webView = [[ReuseWebView alloc] initWithURL:[NSURL URLWithString:@"http://github.com/fmscode"]];
    webView.webTitle = @"FMSCode";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:webView];
    [self presentViewController:navController animated:YES completion:nil];
}
#pragma mark Text Editor
- (void)showTextEditor{
    TextEditorView *textEditor = [[TextEditorView alloc] initWithTitle:@"Text Editor" andDelegate:self];
    textEditor.textContent = @"Here is some existing content";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:textEditor];
    [self presentViewController:nav animated:YES completion:nil];
}
- (void)editorDidComplete:(NSString *)text{
    NSLog(@"%@",text);
}
- (void)editorDidCancel{
    NSLog(@"Editor Cancel");
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    if (indexPath.row == 0){
        cell.textLabel.text = @"Reusable WebView";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"Text Editor";
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0){
        [self showReuseWebView];
    }else if (indexPath.row == 1){
        [self showTextEditor];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
