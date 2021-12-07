//
//  NSString+CommonString.h
//  DesciptionHomework
//
//  Created by 卢华 on 2019/1/5.
//  Copyright © 2019年 卢华. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CommonString)

//判断字符长度
- (NSInteger)getStringLenthOfBytes;
- (NSString *)subBytesOfstringToIndex:(NSInteger)index;

+ (NSString *)currentTimeStr;
//获取当前时间戳
+(NSInteger)getNowTimestamp;
//获取时间戳
+(NSInteger)getNowTimestamp:(NSData *)time;
//时间戳--->日期
+ (NSString *)transToDate:(NSString *)timeStr;
+ (NSString *)transToDate:(NSString *)timeStr setDateFormat:(NSString *)format;
+ (NSString *)getTimestamp:(NSString*)mStr;
//时间戳--->获取英文月份
+ (NSString *)getMonthEn1:(NSString *)timeStr;
//将字符串转换为时间
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr;
//获取N天后日期
+ (NSString *)getDate:(NSString *)timeStr day:(NSInteger)day;
+ (NSString *)getMonthEn:(NSString *)date;
+ (NSString *)monthEn:(NSInteger)month;
//时间转小时
+ (NSString *)timeFormattedMinute:(NSInteger)totalSeconds;
//获取一段字符串中的中文字和中文字符
+ (NSArray *)getAStringOfChineseCharacters:(NSString *)string;
//字符串中去除某种字符
+ (NSString *)getRidOfStr:(NSString *)mainStr withStr:(NSString *)subStr;

//截取中间字符串
+ (NSString *)interceptString:(NSString *)resourceString form:(NSString *)formStr to:(NSString *)toStr;

//截取某位字符串之后
+ (NSString *)interceptString:(NSString *)fullStr with:(NSString *)subStr;

//加密传输对空格和加号的处理
+ (NSString *)encodeURLString:(NSString *)str;
+ (NSString *)base64EncodeString:(NSString *)str;
+ (NSString *)encodeBase64:(NSString *)string;
+ (NSString *)decodeBase64:(NSString *)string;
+ (NSString *)decodeBase64UTF:(NSString *)base64String;

+ (NSString *)changeErrorCode:(NSString *)name;

//秒转换成时刻
+ (NSString *)timeFormatted:(int)totalSeconds;

//取字典里的键值并拼接成长字符串
+ (NSString *)getURLFromDic:(NSDictionary *)dict;

//保留小数点后两位
+(NSString*)returnFormatter:(NSString*)stringNumber;


//获取html文本
+ (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString;


@end

NS_ASSUME_NONNULL_END
