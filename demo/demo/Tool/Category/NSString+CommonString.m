//
//  NSString+CommonString.m
//  DesciptionHomework
//
//  Created by 卢华 on 2019/1/5.
//  Copyright © 2019年 卢华. All rights reserved.
//

#import "NSString+CommonString.h"

@implementation NSString (CommonString)

- (NSInteger)getStringLenthOfBytes {
    NSInteger length = 0;
    for (int i = 0; i < [self length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
        if ([self validateChineseChar:s]) {
            length += 2;
        } else {
            length += 1;
        }
    }
    return length;
}

+ (NSString *)currentTimeStr {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];//获取当前时间0秒后的时间
    NSTimeInterval time=[date timeIntervalSince1970]*1000;// *1000 是精确到毫秒，不乘就是精确到秒
    NSString *timeString = [NSString stringWithFormat:@"%.0f", time];
    return timeString;
}

//时间戳--->获取英文月份 传入字符串时间戳
+ (NSString *)getMonthEn1:(NSString *)timeStr{
    NSString *date = [NSString transToDate:timeStr setDateFormat:@"yyyy-MM-dd"];
    NSRange subRange= NSMakeRange(5, 2);
    NSString *subString=[date substringWithRange:subRange];
    NSString *month = [NSString stringWithFormat:@"%@",[self monthEn:[subString intValue]]];
    return month;
}

//时间戳--->获取英文月份 传入yyyy-MM-dd格式的时间格式
+ (NSString *)getMonthEn:(NSString *)date{
    NSRange subRange= NSMakeRange(5, 2);
    NSString *subString=[date substringWithRange:subRange];
    NSString *month = [NSString stringWithFormat:@"%@",[self monthEn:[subString intValue]]];
    return month;
}

+ (NSString *)monthEn:(NSInteger)month{
    NSCalendar *caldendar = [NSCalendar currentCalendar];// 获取日历
    NSArray *monthArr = [NSArray arrayWithArray:caldendar.shortMonthSymbols];  // 获取日历月数组
    return monthArr[month - 1];  // 获得数字月份下的对应英文月缩写
}
- (NSString *)subBytesOfstringToIndex:(NSInteger)index {
    NSInteger length = 0;
    
    NSInteger chineseNum = 0;
    NSInteger zifuNum = 0;
    
    for (int i = 0; i < [self length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [self substringWithRange:NSMakeRange(i, 1)];
        if ([self validateChineseChar:s]) {
            if (length + 2 > index) {
                return [self substringToIndex:chineseNum + zifuNum];
            }
            
            length += 2;
            
            chineseNum += 1;
        } else {
            if (length + 1 > index) {
                return [self substringToIndex:chineseNum + zifuNum];
            }
            length += 1;
            
            zifuNum += 1;
        }
    }
    return [self substringToIndex:index];
}

#pragma mark -中文字符处理
//获取一段字符串中的中文字和中文字符
+ (NSArray *)getAStringOfChineseCharacters:(NSString *)string{
    if (string == nil || [string isEqual:@""])
    {
        return nil;
    }
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i=0; i<string.length; i++){
        NSRange range = NSMakeRange(i, 1);
        NSString *subStr = [string substringWithRange:range];
        const char *c = [subStr UTF8String];
        if (strlen(c)==3)
        {
            [arr addObject:subStr];
        }
    }
    return arr;
}


//检测中文或者中文符号
- (BOOL)validateChineseChar:(NSString *)string {
    NSString *nameRegEx = @"[\\u0391-\\uFFE5]";
    if (![string isMatchesRegularExp:nameRegEx]) {
        return NO;
    }
    return YES;
}

//检测中文
- (BOOL)validateChinese:(NSString *)string {
    NSString *nameRegEx = @"[\u4e00-\u9fa5]";
    if (![string isMatchesRegularExp:nameRegEx]) {
        return NO;
    }
    return YES;
}

- (BOOL)isMatchesRegularExp:(NSString *)regex {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

//获取时间戳
+(NSInteger)getNowTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:datenow]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[datenow timeIntervalSince1970]] integerValue];
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
    
}

//获取时间戳
+(NSInteger)getNowTimestamp:(NSDate *)time {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSLog(@"设备当前的时间:%@",[formatter stringFromDate:time]);
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[time timeIntervalSince1970]] integerValue];
    NSLog(@"设备当前的时间戳:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}

//时间戳--->日期
+ (NSString *)transToDate:(NSString *)timeStr{
    
    //    long long time=[timeStr longLongValue];
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    long long time=[timeStr longLongValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *timeString=[formatter stringFromDate:date];
    return timeString;
}

+ (NSString *)transToDate:(NSString *)timeStr setDateFormat:(NSString *)format{
    long long time=[timeStr longLongValue] / 1000;
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];//@"yyyy-MM-dd"
    NSString*timeString=[formatter stringFromDate:date];
    return timeString;
}


//获取N天后日期 (时间戳之后某天）
+ (NSString *)getDate:(NSString *)timeStr day:(NSInteger)day {
    long long time=[timeStr longLongValue] / 1000;
    NSInteger days = day;    // n天后的天数
    time= days * 24 * 60 * 60 + time;
      NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
      NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
      [formatter setDateFormat:@"yyyy-MM-dd "];
      NSString *timeString=[formatter stringFromDate:date];
      return timeString;
}

//2020-07-05 时间转换为2020年07月05日
+ (NSMutableString *)transDate:(NSString *)timeStr{
    NSMutableString *str = [[NSMutableString alloc]initWithString:timeStr];
    [str replaceCharactersInRange:NSMakeRange(4, 1) withString:@"年"];
    [str replaceCharactersInRange:NSMakeRange(7, 1) withString:@"月"];
    [str appendFormat:@"日"];
    
    return str;
}

//将时间戳转换为时间 （以毫秒为单位）
//参数:时间戳
//返回值格式:2019-04-19 10:33:35.886
+ (NSString *)getTimestamp:(NSString*)mStr{
    
    NSTimeInterval interval =[mStr doubleValue] / 1000.0;
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Beijing"]];
    NSString *dateString = [formatter stringFromDate: date];
    NSLog(@"时间戳对应的时间是:%@",dateString);
    return dateString;
}

//时间转小时
+ (NSString *)timeFormattedMinute:(NSInteger)totalSeconds
{

    float minutes =(float) ((float)totalSeconds / (float)(60 * 1000 * 60));
   
    return [NSString stringWithFormat:@"%0.2fh", minutes];
}
//字符串中去除某种字符
+ (NSString *)getRidOfStr:(NSString *)mainStr withStr:(NSString *)subStr{
    
    for (int i = 0; i<[mainStr length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [mainStr substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"string is %@",s);
        if ([s isEqualToString:subStr]) {
            NSRange range = NSMakeRange(i, 1);
            //将字符串中的“tak”转化为“”(空)
            mainStr = [mainStr stringByReplacingCharactersInRange:range withString:@""];
        }
    }
    NSLog(@"%@",mainStr);
    return mainStr;
}

//encodeURL
+ (NSString *)encodeURLString:(NSString *)encodString {
    //先将+处理成%2B,对空格不进行处理
    NSCharacterSet *encode_set= [[NSCharacterSet characterSetWithCharactersInString:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\|\n"] invertedSet];
    NSString * content = [encodString stringByAddingPercentEncodingWithAllowedCharacters:encode_set];
    //再将空格处理成+
    content = [content stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    return content;
}

//base64加密
+ (NSString *)base64EncodeString:(NSString *)str {
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:0];
}
//修改乱码
+ (NSString *)changeErrorCode:(NSString *)name{
    name = [name stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLUserAllowedCharacterSet]];
    return name;
}

//截取中间字符串
+ (NSString *)interceptString:(NSString *)resourceString form:(NSString *)formStr to:(NSString *)toStr {
    NSRange start = [resourceString rangeOfString:formStr];
    NSRange end = [resourceString rangeOfString:toStr];
    NSRange range = NSMakeRange(start.location + start.length, end.location - start.location - start.length);
    NSString *result = [resourceString substringWithRange:range];
    return result;
}

//截取某位字符串之后
+ (NSString *)interceptString:(NSString *)fullStr with:(NSString *)subStr{
    NSString *restStr;
    if ([fullStr containsString:subStr]) {//先做安全判断
        NSRange subStrRange = [fullStr rangeOfString:subStr];//找出指定字符串的range
        NSInteger index = subStrRange.location + subStrRange.length;//获得“指定的字符以后的所有字符”的起始点
        restStr = [fullStr substringFromIndex:index];//获得“指定的字符以后的所有字符”
    }
    return restStr;
}

+ (NSString *)encodeBase64:(NSString *)string
{
    //先将string转换成data
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSData *base64Data = [data base64EncodedDataWithOptions:0];
    NSString *baseString = [[NSString alloc]initWithData:base64Data encoding:NSUTF8StringEncoding];
    return baseString;
}
//直接decode字符串
+ (NSString *)decodeBase64:(NSString *)string
{
    NSData *data = [[NSData alloc]initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}
//将字符串通过utf8转成data再解密
+ (NSString *)decodeBase64UTF:(NSString *)base64String
{
    NSData *base64data = [base64String dataUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [[NSData alloc]initWithBase64EncodedData:base64data options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}


+ (NSString *)timeFormatted:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}

+ (NSString *)getURLFromDic:(NSDictionary *)dict{
    
    //将所有的key放进数组
    NSArray *allKeyArray = [dict allKeys];
    
    //序列化器对数组进行排序的block 返回值为排序后的数组
    NSArray *afterSortKeyArray = [allKeyArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id obj2) {
        //排序操作
        NSComparisonResult resuest = [obj1 compare:obj2];
        return resuest;
    }];
    
    //通过排列的key值获取value
    NSMutableArray *valueArray = [NSMutableArray array];
    for (NSString *sortsing in afterSortKeyArray) {
        NSString *valueString = [dict objectForKey:sortsing];
        [valueArray addObject:valueString];
    }
    
    //将排序好的字典的键值逐个取出并拼接成一个长字符串(为空的参数不参与加密)
    NSMutableArray *signArray = [NSMutableArray array];
    for (int i = 0; i < afterSortKeyArray.count; i++) {
        if (![valueArray[i] isEqualToString:@""]) {
            NSString *keyValueStr = [NSString stringWithFormat:@"%@=%@",afterSortKeyArray[i],valueArray[i]];
            [signArray addObject:keyValueStr];
        }
    }
    NSString *sign = [signArray componentsJoinedByString:@"&"];
    return sign;
}

//保留小数点后两位
+(NSString*)returnFormatter:(NSString*)stringNumber {
    stringNumber =[NSString stringWithFormat:@"%@",stringNumber];
    if([stringNumber rangeOfString:@"."].location==NSNotFound) {
        NSString* string_comp=[NSString stringWithFormat:@"%@.00",stringNumber];
        return string_comp;
    }else {
        NSArray* arrays= [stringNumber componentsSeparatedByString:@"."];
        NSString* s_f= [arrays objectAtIndex:0];
        NSString* s_e = [arrays objectAtIndex:1];
        if(s_e.length>2) {
            s_e=[s_e substringWithRange:NSMakeRange(0,2)];
        }else if(s_e.length == 1){
            s_e=[NSString stringWithFormat:@"%@0",s_e];
        }
        NSString* string_combine=[NSString stringWithFormat:@"%@.%@",s_f,s_e];
        return string_combine;
    }
    return@"";
}

//获取html文本
+ (NSAttributedString *)attributedStringWithHTMLString:(NSString *)htmlString
{
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType,
                               NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
    
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    
    return [[NSAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
}

@end
