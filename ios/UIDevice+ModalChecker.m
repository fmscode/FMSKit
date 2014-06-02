//
//  UIDevice+ModalChecker.m
//  FMSKit
//
//  Copyright (c) 2014 Frank Michael Sanchez. All rights reserved.
//

#import "UIDevice+ModalChecker.h"

@implementation UIDevice (ModalChecker)
+ (BOOL)isiPad{
    if([[UIDevice currentDevice].model rangeOfString:@"iPad"].location != NSNotFound){
        return YES;
    }else{
        return NO;
    }
}
+ (BOOL)isiPod{
    if([[UIDevice currentDevice].model rangeOfString:@"iPod"].location != NSNotFound){
        return YES;
    }else{
        return NO;
    }
}

@end
