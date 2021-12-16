//
//  BigwordVersionViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/8.
//

#import "BigwordVersionViewController.h"
#import "BigwordVersionCell.h"
#import "BigwordVersionModel.h"

@interface BigwordVersionViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CellHeightCache *cellHeightCache;//高度缓存

@property (nonatomic, strong) NSArray *listArray;
@end

@implementation BigwordVersionViewController

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
    return self.listArray.count;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cellHeightCache getCellHeightForIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BigwordVersionModel *model = [self.listArray safeObjectIndex:indexPath.row];
    BigwordVersionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BigwordVersionCell" forIndexPath:indexPath];
    cell.model = model;
    CGFloat height = UITableViewAutomaticDimension;
    [self.cellHeightCache cacheCellHeight:height forIndexPath:indexPath];
    return cell;
}
    

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

#pragma mark - Data
- (void)defaultData{
    NSDictionary *dict = @{
        @"data":@[
            @{@"imageUrl":@"http://prod-member-1258642429.cos.ap-beijing.myqcloud.com/dir/FftFKc8Jtr2bQXpa.jpg",
              @"title":@"游乐课",
              @"subTitle":@"999元=2000币+科学探索课30节 ",
              @"detail":@"其他方面，整机体积只有12L，定制低噪音散热器，搭载16GB DDR4内存、512GB固态硬盘，支持一个3.5寸硬盘、三个2.5寸硬盘，还有双频Wi-Fi 5、蓝牙4.2、有线键鼠，但不带显示器，提供三年整机上门服务。"
            },
            @{@"imageUrl":@"http://prod-member-1258642429.cos.ap-beijing.myqcloud.com/dir/KScmZBBbQ8E5RsJJ.jpg",
              @"title":@"游玩课",
              @"subTitle":@"Plus会员权益",
              @"detail":@"在各国纷纷表态北京冬奥会之后，日本记者询问汪文斌，目前中国驻加拿大使馆已经向加方提出了严正交涉，中国下一步会不会向英国提出交涉。对于这个问题，汪文斌不需要具体回复，他表示，我们驻英国使馆已经发布了相关的消息稿，你可以查阅"
            },
            @{@"imageUrl":@"https://prod-member-1258642429.cos.ap-beijing.myqcloud.com/dir/yeXzbn3NadpT4jJ6.jpg",
              @"title":@"游乐课",
              @"subTitle":@"2680元成长课程年卡激活版,2021年成长年卡旗舰类+科学探索30节",
              @"detail":@"在美英澳加新“五眼联盟”都宣布将对北京冬奥会实行所谓“外交抵制”后，日本政府在纠结很久之后，做了一个“折中”的选择，即不派遣阁僚级官员出席北京冬奥会，但却没有明确“抵制”。但日本，这一选择对中美两国来说都不讨好。"
            },
        ],
        @"code":@"200"
    };
    
    BigwordVersionDictionary *model = [BigwordVersionDictionary mj_objectWithKeyValues:dict];
    self.listArray = model.data;
    
    [self.tableView reloadData];
}

@end
