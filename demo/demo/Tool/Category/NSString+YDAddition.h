//
//  NSString+YDNSStringAddition.h
//  YoudaoDict
//
//  Created by donggf on 12-11-29.
//  Copyright (c) 2012年 Netease Youdao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YDAddition)

- (BOOL)isEmpty;

/*!
 * 字符串的md5值，和terminal下运行md5 -s <string>是一样的
 */
- (NSString *)stringFromMD5;
- (NSString *)URLEncodedString;
- (NSString *)URLDecodedString;
- (NSString *)trimLeft;
- (NSString *)trimRight;
- (NSString *)trimLastSpace;
- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters;
- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet;
- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters;

@end
