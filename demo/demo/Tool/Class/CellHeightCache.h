//
//  CellHeightCache.h
//  wdbbw_kidsplace_trunk_01
//
//  Created by 王亚涛 on 2019/4/3.
//  Copyright © 2019 sinovatech. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellHeightCache : NSObject
// 将cell的行高按照其indexPath为key值缓存起来
-(void)cacheCellHeight:(float )height forIndexPath:(NSIndexPath *)indexPath;
// 按照indexPath获取缓存的cell行高
-(float)getCellHeightForIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
