//
// Created by 郭皓楠 on 2020/7/23.
// Copyright (c) 2020 卢华. All rights reserved.
//

#import "UIView+TargetAction.h"


NSString const *BlockTapKey = @"BlockTapKey";

NSString const *BlockKey = @"BlockKey";

@implementation UIView (TargetAction)

- (void)addActionWithblock:(TouchCallBackBlock)block
{
    self.touchCallBackBlock = block;

    self.userInteractionEnabled = YES;

    /**
     *  添加相同事件方法，，先将原来的事件移除，避免重复调用
     */
    NSMutableArray *taps = [self allUIViewBlockTaps];
    [taps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)obj;
        [self removeGestureRecognizer:tap];
    }];
    [taps removeAllObjects];


    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invoke:)];
    [self addGestureRecognizer:tap];
    [taps addObject:tap];
}

- (void)invoke:(id)sender
{
    if(self.touchCallBackBlock) {
        self.touchCallBackBlock();
    }
}

- (void)setTouchCallBackBlock:(TouchCallBackBlock)touchCallBackBlock
{
    objc_setAssociatedObject(self, &BlockKey, touchCallBackBlock, OBJC_ASSOCIATION_COPY);
}

- (TouchCallBackBlock)touchCallBackBlock
{
    return objc_getAssociatedObject(self, &BlockKey);
}

- (void)addTarget:(id)target action:(SEL)action
{
    self.userInteractionEnabled = YES;

    /**
     *  添加相同事件方法，，先将原来的事件移除，避免重复调用
     */
    NSMutableArray *taps = [self allUIViewBlockTaps];
    [taps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UITapGestureRecognizer *tap = (UITapGestureRecognizer *)obj;
        [self removeGestureRecognizer:tap];
    }];
    [taps removeAllObjects];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:tap];
    [taps addObject:tap];
}

- (NSMutableArray *)allUIViewBlockTaps
{
    NSMutableArray *taps = objc_getAssociatedObject(self, &BlockTapKey);
    if (!taps) {
        taps = [NSMutableArray array];
        objc_setAssociatedObject(self, &BlockTapKey, taps, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return taps;
}



@end