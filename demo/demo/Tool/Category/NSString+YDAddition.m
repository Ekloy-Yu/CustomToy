//
//  NSString+YDNSStringAddition.m
//  YoudaoDict
//
//  Created by donggf on 12-11-29.
//  Copyright (c) 2012年 Netease Youdao. All rights reserved.
//

#import "NSString+YDAddition.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YDAddition)

// isEmpty当对象是nil时不执行。需要加判断条件，消息接收对象不为nil。
- (BOOL)isEmpty
{
    if (((NSNull *) self == [NSNull null]) || (self == nil) ) {
        return YES;
    }
    
    // if self is nil, self.length is still 0.
    if ([self length] == 0 ||
        [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)stringFromMD5
{
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

- (NSString *)URLEncodedString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                           (CFStringRef)self,
                                                                           NULL,
																		   CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                           kCFStringEncodingUTF8));
    //[result autorelease];
	return result;
}

- (NSString*)URLDecodedString
{
	NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
																						   (CFStringRef)self,
																						   CFSTR(""),
																						   kCFStringEncodingUTF8));
    //[result autorelease];
	return result;
}

- (NSString *)trimLeft
{
    NSInteger i = 0;
    
    while ((i < [self length])
           && [[NSCharacterSet whitespaceCharacterSet] characterIsMember:[self characterAtIndex:i]]) {
        i++;
    }
    return [self substringFromIndex:i];
}


- (NSString *)trimLastSpace
{
    if ([self length] < 2) {
        return self;
    }
    
    int index = [self length] - 1;
    unichar ch = [self characterAtIndex:index];
    unichar ch2 = [self characterAtIndex:index - 1];
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    if ([set characterIsMember:ch] && [set characterIsMember:ch2]) {
        return [self substringToIndex:index];
    } else {
        return self;
    }
}

- (NSString *)stringByTrimmingLeadingCharactersInSet:(NSCharacterSet *)characterSet {
    NSRange rangeOfFirstWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]];
    if (rangeOfFirstWantedCharacter.location == NSNotFound) {
        return @"";
    }
    return [self substringFromIndex:rangeOfFirstWantedCharacter.location];
}

- (NSString *)stringByTrimmingLeadingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingLeadingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimmingTrailingCharactersInSet:(NSCharacterSet *)characterSet {
    NSRange rangeOfLastWantedCharacter = [self rangeOfCharacterFromSet:[characterSet invertedSet]
                                                               options:NSBackwardsSearch];
    if (rangeOfLastWantedCharacter.location == NSNotFound) {
        return @"";
    }
    return [self substringToIndex:rangeOfLastWantedCharacter.location+1]; // non-inclusive
}

- (NSString *)stringByTrimmingTrailingWhitespaceAndNewlineCharacters {
    return [self stringByTrimmingTrailingCharactersInSet:
            [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end

