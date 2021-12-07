//
//  UIImage+Category.h
//  edushu
//
//  Created by 于.Sir゛ on 2020/4/9.
//  Copyright © 2020 卢坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)
//给图片加高斯模糊
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
//给图片加高斯模糊
+ (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

+ (UIImage *)imageWithView:(UIView *)view;

//用颜色创建一张图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
