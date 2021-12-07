//
//  CellHeightCache.m
//  wdbbw_kidsplace_trunk_01
//
//  Created by 王亚涛 on 2019/4/3.
//  Copyright © 2019 sinovatech. All rights reserved.
//  记录 tableView 的动态行高

#import "CellHeightCache.h"

@interface CellHeightCache()
@property(nonatomic,strong) NSMutableDictionary *cellHeightDic;
@end

@implementation CellHeightCache

-(void)cacheCellHeight:(float )height forIndexPath:(NSIndexPath *)indexPath{
    NSString *strKey = [NSString stringWithFormat:@"%ld_%ld",(long)indexPath.row,(long)indexPath.section];
    NSString *h = [NSString stringWithFormat:@"%lf",height];
    [self.cellHeightDic setValue:h forKey:strKey];
}

-(float)getCellHeightForIndexPath:(NSIndexPath *)indexPath{
    NSString *strKey = [NSString stringWithFormat:@"%ld_%ld",(long)indexPath.row,(long)indexPath.section];
    return [[self.cellHeightDic valueForKey:strKey] floatValue];
}

-(NSMutableDictionary *)cellHeightDic{
    if (!_cellHeightDic) {
        _cellHeightDic = [NSMutableDictionary dictionary];
    }
    return _cellHeightDic;
}

@end
