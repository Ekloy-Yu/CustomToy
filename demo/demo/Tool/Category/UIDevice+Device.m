//
//  UIDevice+Device.m
//  hbgs
//
//  Created by 塔塔 on 2020/9/1.
//  Copyright © 2020 卢坤. All rights reserved.
//

#import "UIDevice+Device.h"


@implementation UIDevice (Device)

+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        
        NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
        
        [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
        
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
}

@end
