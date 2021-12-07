//
//  UITextField+Category.m
//  党建
//
//  Created by Mac on 2018/10/30.
//  Copyright © 2018年 wx. All rights reserved.
//

#import "UITextField+Category.h"
#import "TextFields.h"

@implementation UITextField (Category)

+ (UITextField *)textFieldWithSuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor
{
    UITextField *textField = [[UITextField alloc] init];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placehold attributes:[NSDictionary dictionaryWithObjectsAndKeys:placeholdColor, NSForegroundColorAttributeName,nil]];
    [superView addSubview:textField];
    return textField;
}

+ (UITextField *)textFieldWithTag:(NSInteger)tag Font:(UIFont *)size SuperView:(UIView *)superView Placehold:(NSString *)placehold PlaceholdColor:(UIColor *)placeholdColor TextAlignment:(NSTextAlignment)textAlignment
{
    UITextField *textField = [[TextFields alloc] init];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placehold attributes:[NSDictionary dictionaryWithObjectsAndKeys:placeholdColor, NSForegroundColorAttributeName,nil]];
    textField.tag = tag;
    textField.textAlignment = textAlignment;
    textField.font = size;
    [superView addSubview:textField];
    return textField;
}

+ (UITextField *)textFieldWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Tag:(NSInteger)tag TextAlignment:(NSTextAlignment)textAlignment
{
    UITextField *textField = [[TextFields alloc] init];
    textField.text = content;
    textField.textColor = textColor;
    textField.tag = tag;
    textField.textAlignment = textAlignment;
    [superView addSubview:textField];
    return textField;
}

//快速创建textField, 加占位符
+ (UITextField *)textFieldWithPlacehold:(NSString *)placehold Font:(UIFont *)size SuperView:(UIView *)superView PlaceholdColor:(UIColor *)placeholdColor TextAlignment:(NSTextAlignment)textAlignment
{
    UITextField *textField = [[UITextField alloc] init];
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placehold attributes:[NSDictionary dictionaryWithObjectsAndKeys:placeholdColor, NSForegroundColorAttributeName,nil]];
    textField.textAlignment = textAlignment;
    textField.font = size;
    [superView addSubview:textField];
    return textField;
}

//视图左对齐缩进
+(void)setTextFieldLeftPadding:(UITextField *)textField forWidth:(CGFloat)leftWidth
{
    CGRect frame = textField.frame;
    frame.size.width = leftWidth;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.leftView = leftview;
}


//限制输入字符长度(tag设置)
+ (UITextField *)textFieldWithContent:(NSString *)content SuperView:(UIView *)superView TextColor:(UIColor *)textColor Tag:(NSInteger)tag TextAlignment:(NSTextAlignment)textAlignment textField:(id)ids
{
    UITextField *textField = [[UITextField alloc] init];
    textField.text = content;
    textField.textColor = textColor;
    textField.tag = tag;
    textField.textAlignment = textAlignment;
    [textField addTarget:ids action:@selector(textFiledDidChangeds:) forControlEvents:UIControlEventEditingChanged];
    [superView addSubview:textField];
    return textField;
}

//输入最大字节
- (void)textFiledDidChangeds:(UITextField *)textField {
    //textField的tag值作为最大限制字节
    if (textField.tag == 0)
        return;
    
    NSString *toBeString = textField.text;
    NSString *lang = [[textField textInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) {                      // 简体中文输入，包括简体拼音，健体五笔，简体手写
        
        //判断markedTextRange是不是为Nil，如果为Nil的话就说明你现在没有未选中的字符，
        //可以计算文字长度。否则此时计算出来的字符长度可能不正确
        
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分(感觉输入中文的时候才有)
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            //中文和字符一起检测  中文是两个字符
            if ([toBeString getStringLenthOfBytes] > textField.tag) {
                textField.text = [toBeString subBytesOfstringToIndex:textField.tag];
            }
        }
    } else {
        if ([toBeString getStringLenthOfBytes] > textField.tag) {
            textField.text = [toBeString subBytesOfstringToIndex:textField.tag];
        }
    }
}

@end
