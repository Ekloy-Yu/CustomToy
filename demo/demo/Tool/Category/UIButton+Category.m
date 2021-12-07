//
//  UIButton+Category.m
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UIButton+Category.h"
#import <objc/runtime.h>

static NSString *nameKey = @"cellIndexKey"; //那么的key
static NSString *sectionKey = @"sectionIndexKey"; //那么的key
@implementation UIButton (Category)

- (void)setCellIndex:(NSNumber *)cellIndex
{
    objc_setAssociatedObject(self, &nameKey, cellIndex, OBJC_ASSOCIATION_COPY);
}
- (NSNumber *)cellIndex
{
    return objc_getAssociatedObject(self, &nameKey);
}

- (void)setSectionIndex:(NSNumber *)sectionIndex
{
    objc_setAssociatedObject(self, &sectionKey, sectionIndex, OBJC_ASSOCIATION_COPY);
}
- (NSNumber *)sectionIndex
{
    return objc_getAssociatedObject(self, &sectionKey);
}
+ (UIButton *)buttonWithBgImg:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}
//快速创建button, 传图片
+ (UIButton *)buttonWithImg:(NSString *)name SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

//快速创建button, 不传图片名
+ (UIButton *)buttonWithSuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action{
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

//快速创建button, 设置背景图片,添加文字
+ (UIButton *)buttonWithName:(NSString *)name SuperView:(UIView *)superView TitleFont:(UIFont *)Titlefont Title:(NSString *)title Target:(id)target Action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = Titlefont;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:button];
    return button;
}

//快速创建button, 添加字体,设置字体大小,颜色
+ (UIButton *)buttonWithText:(NSString *)text TextColor:(UIColor *)color TextSize:(UIFont *)size SuperView:(UIView *)superView Tag:(NSInteger)tag Target:(id)target Action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font = size;
    button.tag = tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置按钮上字位置,居左显示
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [superView addSubview:button];
    return button;
}

//快速创建button, 设置字体, 导航栏button
+ (UIButton *)buttonWithTexts:(NSString *)text TextColor:(UIColor *)color Target:(id)target Action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

//快速创建button, 设置正常图片和点击后图片
+ (UIButton *)buttonWithSelectName:(NSString *)selectName SuperView:(UIView *)superView Name:(NSString *)name Target:(id)target Action:(SEL)action Tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectName] forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    [superView addSubview:button];
    return button;
}

@end
