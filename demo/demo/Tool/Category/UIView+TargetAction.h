//
// Created by 郭皓楠 on 2020/7/23.
// Copyright (c) 2020 卢华. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

typedef void(^TouchCallBackBlock)(void);

@interface UIView (TargetAction)

@property (nonatomic, copy) TouchCallBackBlock touchCallBackBlock;

- (void)addActionWithblock:(TouchCallBackBlock)block;

- (void)addTarget:(id)target action:(SEL)action;

@end