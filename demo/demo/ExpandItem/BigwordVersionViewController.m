//
//  BigwordVersionViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/8.
//

#import "BigwordVersionViewController.h"
#import "BigwordVersionCell.h"

@interface BigwordVersionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CellHeightCache *cellHeightCache;//高度缓存
@end

@implementation BigwordVersionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, ScreenWidth, ScreenHeight - kNavBarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = YES;
        _tableView.showsHorizontalScrollIndicator = NO;
//        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        [_tableView registerClass:[BigwordVersionCell class] forCellReuseIdentifier:@"BigwordVersionCell"];
        
    }
    return _tableView;
}

-(CellHeightCache *)cellHeightCache{
    if (!_cellHeightCache) {
        _cellHeightCache = [CellHeightCache new];
    }
    return _cellHeightCache;
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeightCache getCellHeightForIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BigwordVersionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BigwordVersionCell" forIndexPath:indexPath];
    return cell;
}
    

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

@end
