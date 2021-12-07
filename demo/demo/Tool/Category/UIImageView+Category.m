//
//  UIImageView+Category.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UIImageView+Category.h"

@implementation UIImageView (Category)

+ (UIImageView *)imageViewWithName:(NSString *)name SuperView:(UIView *)superView{
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.image = [UIImage imageNamed:name];
    [superView addSubview:imgView];
    return imgView;
}

/**
 创建imageView
 @param bgColor 背景颜色
 */
+ (UIImageView *)imageViewWithSuperView:(UIView *)superView BGColor:(UIColor *)bgColor
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = bgColor;
    [superView addSubview:imageView];
    return imageView;
}

//找到导航栏最下面黑线视图
+ (UIImageView *)getLineViewInNavigationBar:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self getLineViewInNavigationBar:subview];
        if (imageView) {
            return imageView;
        }
    }
    
    return nil;
}

@end
