//
//  UIView+Utils.m
//  edushu
//
//  Created by 卢华 on 2019/3/11.
//  Copyright © 2019年 卢坤. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (Utils)

- (UIView*)subViewOfClassName:(NSString*)className {
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}
//快速创建一个阴影内容
+ (UIView *)viewshadowColor:(UIColor *)color shadowOffset:(CGSize)size shadowOpacity:(float)opacity cornerRadius:(CGFloat)corner backgroundColor:(UIColor *)bgColor superView:(UIView *)superView{
    UIView *view = [[UIView alloc]init];
    view.layer.shadowColor = color.CGColor;
    view.layer.shadowOffset = size;
    view.layer.shadowOpacity = opacity;
    view.layer.cornerRadius = corner;
    view.backgroundColor = bgColor;
    [superView addSubview:view];
    return view;
}

@end
