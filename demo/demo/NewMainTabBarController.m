//
//  NewMainTabBarController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/11/30.
//

#import "NewMainTabBarController.h"
#import "BaseNavigationViewController.h"
#import "IndexViewController.h"
#import "ViewController.h"


@interface NewMainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation NewMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabBarController];
    [self setTabbarBackColor];
    [self setTabBarTitleColor];
    self.delegate = self;
}

-(void)initTabBarController
{
    // 首页模块
    ViewController *homeVC = [[ViewController alloc] init];
    homeVC.tabBarItem.title = @"首页";
    homeVC.view.backgroundColor = [UIColor colorWithHexString:@"F0E68C"];
    [self settingVC:homeVC img:@"tab_1" selectImg:@"tab_1_selected"];
    
    //
    IndexViewController *indexVC = [[IndexViewController alloc] init];
    [self settingVC:indexVC img:@"tab_2" selectImg:@"tab_2_selected"];
    indexVC.tabBarItem.title = @"商城";
    indexVC.view.backgroundColor = [UIColor colorWithHexString:@"90EE90"];
    
    //
    UIViewController *processVC = [[UIViewController alloc] init];
    [self settingVC:processVC img:@"tab_3" selectImg:@"tab_3"];
    processVC.tabBarItem.title = @"视频";
    processVC.view.backgroundColor = [UIColor colorWithHexString:@"E1FFFF"];
    
    //
    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor colorWithHexString:@"6495ED"];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.badgeValue = @"10";
    [self settingVC:mineVC img:@"tab_4" selectImg:@"tab_4_selected"];
   
    
    self.viewControllers = @[homeVC, indexVC, processVC, mineVC];
}

- (void)setTabbarBackColor{
    if (@available(iOS 15.0, *)) {
        //这样的话我们只需要让scrollEdgeAppearance属性不为nil即可。
        UITabBarAppearance * appearance = [UITabBarAppearance new];
        appearance.backgroundImage = [UIImage imageNamed:@"tab_bg_bottom"];
        appearance.backgroundEffect = nil;//高斯模糊背景移除
        appearance.shadowImage = [UIImage new];
        appearance.shadowColor = [UIColor clearColor];
        self.tabBar.standardAppearance = appearance;
        self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance;
    }else{
        UIImageView *backView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, kTabBarHeight)];
        backView.image = [UIImage imageNamed:@"tab_bg_bottom"];
        backView.contentMode = UIViewContentModeScaleToFill;
        [self.tabBar insertSubview:backView atIndex:0];
        [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
        [self.tabBar setBackgroundColor:[UIColor clearColor]];
    }
    
}

- (void)settingVC:(id)vc img:(NSString *)imgStr selectImg:(NSString *)selectImg
{
    UIViewController* currentVC = (UIViewController *)vc;
    [currentVC.tabBarItem setImage:[[UIImage imageNamed:imgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [currentVC.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
}

- (void)setTabBarTitleColor{
    
    UIColor *selected_Color = [UIColor colorWithHexString:@"FF4500"];
    UIColor *normal_Color = [UIColor colorWithHexString:@"696969"];
    
    //tabBarItem title 选中颜色
    NSMutableDictionary<NSAttributedStringKey, id> *selectedAttributes = [NSMutableDictionary dictionary];
    selectedAttributes[NSForegroundColorAttributeName] = selected_Color;
    
    //tabBarItem title 未选中颜色
    NSMutableDictionary<NSAttributedStringKey, id> *normalAttributes = [NSMutableDictionary dictionary];
    normalAttributes[NSForegroundColorAttributeName] = normal_Color;
    
    for (UIViewController *vc in self.viewControllers) {
        [vc.tabBarItem setTitleTextAttributes:normalAttributes.copy forState:UIControlStateNormal];
        [vc.tabBarItem setTitleTextAttributes:selectedAttributes.copy forState:UIControlStateSelected];
        
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 4, 0);
       
    }
    
    if(@available(iOS 13.0, *)) {
        [[UITabBar appearance] setTintColor:selected_Color];
        [[UITabBar appearance] setUnselectedItemTintColor:normal_Color];
    }
    
    //设置 tabbar上边的一条灰线
    [self.tabBar setShadowImage:[UIImage new]];
}


#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        viewController.tabBarItem.badgeValue = nil;
    }
}


@end
