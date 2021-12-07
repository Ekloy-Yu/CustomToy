//
//  UIButton+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Category)

@property (nonatomic, strong) NSNumber * sectionIndex;

@property (nonatomic, strong) NSNumber * cellIndex;

///快速创建button, 设置背景图
+ (UIButton *)buttonWithBgImg:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;

//快速创建button, 传图片
+ (UIButton *)buttonWithImg:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;

//快速创建button, 不传图片名
+ (UIButton *)buttonWithSuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;

//快速创建button, 设置背景图片,添加文字
+ (UIButton *)buttonWithName:(NSString *)name SuperView:(UIView *)superView TitleFont:(UIFont *)Titlefont Title:(NSString *)title Target:(id)target Action:(SEL)action;

//快速创建button, 添加字体,设置字体大小，颜色（设置居左显示）
+ (UIButton *)buttonWithText:(NSString *)text TextColor:(UIColor *)color TextSize:(UIFont *)size SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action;

//快速创建button, 设置字体, 导航栏button
+ (UIButton *)buttonWithTexts:(NSString *)text TextColor:(UIColor *)color Target:(id)target Action:(SEL)action;

//快速创建button, 设置正常图片和点击后图片
+ (UIButton *)buttonWithSelectName:(NSString *)selectName SuperView:(UIView *)superView Name:(NSString *)name Target:(id)target Action:(SEL)action Tag:(NSInteger)tag;
@end

NS_ASSUME_NONNULL_END
