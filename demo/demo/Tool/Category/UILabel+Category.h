//
//  UILabel+Category.h
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Category)

//快速创建UILabel, lebal一行
+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment AdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth;

//快速创建UILabel, lebal行数自定义
+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment NumberOfLines:(NSInteger)numberOfLines;

/**
 *  content 根据内容设置段落风格
 *  widthSize 侧边文字与边框距离
 *  makes Masonry修饰位置
 *  line 行间距
 *  高度自适应不需要设置
 */
//文字自适应
- (CGSize)labelWithAttributedTextContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font LineSpacing:(NSInteger)line Broadsize:(NSInteger)widthSize;

//快速创建UILabel,label能否交互
+ (UILabel *)labelWithSuperView:(UIView *)superView Text:(NSString *)text TextColor:(UIColor *)textColor Font:(float)font TextAlignment:(NSTextAlignment)textAlignment UserInteractionEnabled:(BOOL)userInteractionEnabled Tag:(NSInteger)tag;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 *  获得Label字的高
 */
+ (CGFloat )getStringHeight:(NSString *)str withBoundRectWidth:(CGFloat)width LineSpace:(CGFloat)line LabelFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
