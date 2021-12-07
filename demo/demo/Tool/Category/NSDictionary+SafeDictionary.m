//
//  NSDictionary+SafeDictionary.m
//  radishdict
//
//  Created by 塔塔 on 2020/6/23.
//  Copyright © 2020 卢坤. All rights reserved.
//

#import "NSDictionary+SafeDictionary.h"


@implementation NSDictionary (SafeDictionary)

- (id)safeKey:(NSString*)key {
    id object = [self objectForKey:key];
    // 字典中没key时value为<nil>
    if (![[self allKeys] containsObject:key]) {
        object = nil;
    }
    if ([[object class] isSubclassOfClass:[NSNull class]]) {
        object = nil;
    } else if ([[object class] isSubclassOfClass:[NSNumber class]]) {
        // 判断NSNumber是不是小数
        if (([object doubleValue] - floor([object doubleValue]) < 0.01)) {
            object = [NSString stringWithFormat:@"%ld",(long)[object integerValue]];
        } else {
            object = [NSString stringWithFormat:@"%.2f",[object doubleValue]];
        }
    }
    return object;
}

@end
