//
//  NetworkImageViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/14.
//

#import "NetworkImageViewController.h"
#import "ImageCell.h"

@interface NetworkImageViewController ()<UITableViewDelegate, UITableViewDataSource, ImageCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CellHeightCache *cellHeightCache;//高度缓存

@property (nonatomic, strong) NSArray *listArray;

@end

@implementation NetworkImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    [self defaultData];
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
        [_tableView registerClass:[ImageCell class] forCellReuseIdentifier:@"ImageCell"];
        
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
    return self.listArray.count;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeightCache getCellHeightForIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell" forIndexPath:indexPath];
    cell.imageUrl = [self.listArray safeObjectIndex:indexPath.row];
    cell.delegate = self;
    CGFloat height = UITableViewAutomaticDimension;
    [self.cellHeightCache cacheCellHeight:height forIndexPath:indexPath];
    return cell;
}
    

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)loadFinishSDWebImage{
    [self.tableView reloadData];
}

#pragma mark - Data
- (void)defaultData{
    
    self.listArray = @[@"https://scpic.chinaz.net/files/pic/pic9/202108/apic34586.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202008/hpic2832.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/201701/fpic10221.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202011/apic29242.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202112/apic37000.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202109/apic35008.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202112/hpic4796.jpg",
                       @"https://scpic.chinaz.net/files/pic/pic9/202111/bpic24729.jpg"];
    
    [self.tableView reloadData];
}

@end
