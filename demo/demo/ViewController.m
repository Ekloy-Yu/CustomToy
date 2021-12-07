//
//  ViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/11/24.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "H5TextLabelViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listArray;

@end

@implementation ViewController

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
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 100, 0);
    }
    return _tableView;
}

- (NSArray *)listArray{
    if (!_listArray) {
        _listArray = @[@"H5TextView", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"",];
    }
    return _listArray;
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
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"index"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"index"];
    }
    cell.backgroundColor = [UIColor randomColor];
    cell.textLabel.text = [self.listArray safeObjectIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    switch (indexPath.row) {
        case 0:{
            H5TextLabelViewController *vc = [[H5TextLabelViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
            
        default:{
            SecondViewController *vc = [[SecondViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }break;
    }
    
}


@end
