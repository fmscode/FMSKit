//
//  ReuseWebView.h
//  ReuseWebView
//
//  Created by Frank Michael on 4/25/14.
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReuseWebView : UIViewController

- (id)initWithURL:(NSURL *)url;

@property (nonatomic,assign)NSURL *webURL;
@property (nonatomic,assign)NSString *webTitle;

@end
