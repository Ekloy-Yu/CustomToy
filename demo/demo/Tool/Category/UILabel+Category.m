//
//  UILabel+Category.m
//  党建
//
//  Created by Mac on 2018/10/27.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UILabel+Category.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height


@implementation UILabel (Category)

+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment AdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
    [superView addSubview:label];
    return label;
}

+ (UILabel *)labelWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font TextAlignment:(NSTextAlignment)textAlignment NumberOfLines:(NSInteger)numberOfLines{
    UILabel *label = [[UILabel alloc] init];
    label.text = content;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    [superView addSubview:label];
    return label;
}


/**
 *  content 根据内容设置段落风格
 *  widthSize 侧边文字与边框距离
 *  makes Masonry修饰位置
 *  line 行间距
 *  高度自适应不需要设置
 */
- (CGSize)labelWithAttributedTextContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Font:(UIFont *)font LineSpacing:(NSInteger)line Broadsize:(NSInteger)widthSize{
    UILabel *label = self;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:content];
    //设置段落风格，即行间距
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:line];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [content length])];
    label.attributedText = attributedStr;
    [superView addSubview:label];
    
    /*
     1、自适应尺寸，根据宽度算高度
     2、自适应设置，以矩形区域自适应，以字体字型自适应
     3、文字属性，需要知道字体大小
     4、上下文
     MAXFLOAT 是一个大数,因为高度能高不能低
     */
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake(SCREENWIDTH - widthSize, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName :[UIFont systemFontOfSize:12.0]} context:nil].size;
    //contentSize 去自适应_contentLabel
    CGSize size = [label sizeThatFits:contentSize];
    
    return size;
}

//设置段落
-(NSMutableAttributedString *)gainAttritube:(NSString *)str
{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:str];
    //设置段落风格，即行间距
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:12];
    [attributedStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [str length])];
    return attributedStr;
}


+ (UILabel *)labelWithSuperView:(UIView *)superView Text:(NSString *)text TextColor:(UIColor *)textColor Font:(float)font TextAlignment:(NSTextAlignment)textAlignment UserInteractionEnabled:(BOOL)userInteractionEnabled Tag:(NSInteger)tag
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.font = [UIFont systemFontOfSize:font];
    label.userInteractionEnabled = userInteractionEnabled;
    label.tag = tag;
    [superView addSubview:label];
    return label;
}

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    if (!label.text) {
        return;
    }
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (CGFloat )getStringHeight:(NSString *)str withBoundRectWidth:(CGFloat)width LineSpace:(CGFloat)line LabelFont:(UIFont *)font{
    if (!str) {
        return 0;
    }
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:font}];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:line];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    CGSize size = CGSizeMake(width,0);
    CGSize contentSize = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
    
    return contentSize.height;
}



@end
