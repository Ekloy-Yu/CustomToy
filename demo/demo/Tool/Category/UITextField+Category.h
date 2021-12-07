//
//  UITextField+Category.h
//  党建
//
//  Created by Mac on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Category)
//快速创建textField
+ (UITextField *)textFieldWithSuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor;
//快速创建textField, 加上tag值 此方法以后得删除
+ (UITextField *)textFieldWithTag:(NSInteger)tag Font:(UIFont *)size SuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor TextAlignment:(NSTextAlignment)textAlignment;
//快速创建textField,加字
+ (UITextField *)textFieldWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Tag:(NSInteger)tag TextAlignment:(NSTextAlignment)textAlignment;
//快速创建textField, 加占位符
+ (UITextField *)textFieldWithPlacehold:(NSString *)placehold Font:(UIFont *)size SuperView:(UIView *)superView PlaceholdColor:(UIColor *)placeholdColor TextAlignment:(NSTextAlignment)textAlignment;

//限制输入字符长度(tag设置)
+ (UITextField *)textFieldWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Tag:(NSInteger)tag TextAlignment:(NSTextAlignment)textAlignment textField:(id)ids;

//视图左对齐缩进
+(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth;


@end

NS_ASSUME_NONNULL_END
