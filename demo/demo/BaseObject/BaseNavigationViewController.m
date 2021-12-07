//
//  BaseNavigationViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/11/29.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条上标题的颜色
    self.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    
    // 设置导航栏的颜色
    self.navigationBar.barTintColor = [UIColor whiteColor];
    
    //侧滑返回手势的代理
    self.interactivePopGestureRecognizer.delegate = self;
    
    //iOS15新增
    self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    
    if (self.viewControllers.count > 1)
    {
        // 隐藏底部选项卡,显示顶部导航栏
        viewController.navigationController.navigationBarHidden = NO;
        viewController.tabBarController.tabBar.hidden = YES;
        
        // 添加导航栏左边返回按钮
//        UIButton *leftBtn = [[UIButton alloc] init];
//        [leftBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateNormal];
//        [leftBtn setImage:[UIImage imageNamed:@"jiantou"] forState:UIControlStateHighlighted];
//        leftBtn.frame = CGRectMake(0, 9, 26, 26);
//        [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
    }
}


- (void)leftBtnClick
{
    [self popViewControllerAnimated:YES];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    [super popViewControllerAnimated:animated];
    
    if (self.viewControllers.count == 1)
    {
        self.navigationController.navigationBarHidden = YES;
        self.tabBarController.tabBar.hidden = NO;
    }

    return self;
}


#pragma mark侧滑返回的手势代理实现

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    
    //如果是跟控制器就不支持侧滑返回
    if (self.viewControllers.count <= 1){
        return NO;
    }
    return YES;
}


@end
