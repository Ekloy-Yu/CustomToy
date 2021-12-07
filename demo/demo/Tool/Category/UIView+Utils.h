//
//  UIView+Utils.h
//  edushu
//
//  Created by 卢华 on 2019/3/11.
//  Copyright © 2019年 卢坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utils)

- (UIView*)subViewOfClassName:(NSString*)className;
+ (UIView *)viewshadowColor:(UIColor *)color shadowOffset:(CGSize)size shadowOpacity:(float)opacity cornerRadius:(CGFloat)corner backgroundColor:(UIColor *)bgColor superView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
