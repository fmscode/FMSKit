//
//  NSString+MD5.h
//
//  Created by Frank Michael Sanchez on 5/30/13.
//  Copyright (c) 2013 Frank Michael Sanchez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface NSString (MD5)
- (NSString *)md5;
@end
