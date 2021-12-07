//
//  H5TextLabelViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/1.
//

#import "H5TextLabelViewController.h"
#import "H5TextLabelCell.h"
#import "H5TextLabelModel.h"

@interface H5TextLabelViewController ()<UITableViewDelegate, UITableViewDataSource, H5TextLabelCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CellHeightCache *cellHeightCache;//高度缓存
@property (nonatomic, strong) H5TextLabelModel *textModel;


@end

@implementation H5TextLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self requestData];
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
        [_tableView registerClass:[H5TextLabelCell class] forCellReuseIdentifier:@"H5TextLabelCell"];
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeightCache getCellHeightForIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section != 1) {
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
        [self.cellHeightCache cacheCellHeight:200 forIndexPath:indexPath];
        cell.backgroundColor = [UIColor randomColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.section == 1){
        H5TextLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"H5TextLabelCell" forIndexPath:indexPath];
        cell.indexPath = indexPath;
        cell.textContent = self.textModel.htmlString;
        cell.webViewDelegate = self;
        return cell;
    }
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - BBWTeacherDetailLabelCellDelegate
- (void)showWebViewDidFinishWithHeight:(CGFloat)height forIndexPath:(nonnull NSIndexPath *)indexPath{
    
//    [UIView performWithoutAnimation:^{
//        dispatch_async(dispatch_get_main_queue(), ^{
//
//
//        });
//    }];
//
    if (height > 0 && height != [self.cellHeightCache getCellHeightForIndexPath:indexPath]) {
        [self.cellHeightCache cacheCellHeight:height forIndexPath:indexPath];
        [self.tableView reloadData];
    }
}

#pragma mark - 接口数据
- (void)requestData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.textModel = [[H5TextLabelModel alloc] init];
        [self.tableView reloadData];
    });
}


@end
