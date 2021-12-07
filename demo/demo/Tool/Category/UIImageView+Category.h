//
//  UIImageView+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

//快速创建UIImageView
+ (UIImageView *)imageViewWithName:(NSString *)name SuperView:(UIView *)superView;
//快速创建UIImageView, 只加背景颜色
+ (UIImageView *)imageViewWithSuperView:(UIView *)superView BGColor:(UIColor *)bgColor;
//找到导航栏最下面黑线视图
+ (UIImageView *)getLineViewInNavigationBar:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
