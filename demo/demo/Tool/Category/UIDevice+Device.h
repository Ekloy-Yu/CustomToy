//
//  UIDevice+Device.h
//  hbgs
//
//  Created by 塔塔 on 2020/9/1.
//  Copyright © 2020 卢坤. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Device)

/**
 * @interfaceOrientation 输入要强制转屏的方向
 */
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;

@end

NS_ASSUME_NONNULL_END
