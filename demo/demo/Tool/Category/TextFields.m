//
//  TextFields.m
//  DesciptionHomework
//
//  Created by 卢华 on 2019/1/10.
//  Copyright © 2019年 卢华. All rights reserved.
//

#import "TextFields.h"

@implementation TextFields

-(id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(textFiledDidChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}

- (void)textFiledDidChanged:(UITextField *)textField {
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
