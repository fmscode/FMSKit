//
//  UIApplication+Version.h
//  FMSKit
//
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Version)

// Pulls the current version of the application using the info.plist file.
+ (NSString *)version;
// Pulls current version of build of the application using the info.plist file.
+ (NSString *)build;

@end
