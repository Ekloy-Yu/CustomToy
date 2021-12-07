//
//  NSDictionary+SafeDictionary.h
//  radishdict
//
//  Created by 塔塔 on 2020/6/23.
//  Copyright © 2020 卢坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (SafeDictionary)

- (id)safeKey:(NSString*)key;

@end

NS_ASSUME_NONNULL_END
