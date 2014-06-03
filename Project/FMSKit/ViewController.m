//
//  ViewController.m
//  FMSKit
//
//  Created by Frank Michael on 5/25/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import "ViewController.h"
#import <TextEditorView.h>

@interface ViewController () <TextEditorDelegate>

- (IBAction)showEditor:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)showEditor:(id)sender{
    TextEditorView *editorView = [[TextEditorView alloc] initWithTitle:@"This" andDelegate:self];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:editorView];
    [self presentViewController:nav animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)editorDidCancel{
    
}
- (void)editorDidComplete:(NSString *)text{
    NSLog(@"%@",text);
}
@end
