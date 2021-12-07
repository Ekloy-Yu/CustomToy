//
//  MainTabBarViewController.m
//  demo
//
//  Created by 于.Sir゛ on 2021/11/29.
//

#import "MainTabBarViewController.h"
#import "BaseNavigationViewController.h"
#import "IndexViewController.h"
#import "ViewController.h"

@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTabBarController];
    [self setTabbarBackColor];
    [self setTabBarTitleColor];
}

-(void)initTabBarController
{
    // 首页模块
    ViewController *homeVC = [[ViewController alloc] init];
    BaseNavigationViewController *homeNag = [self settingTabbarItemWithRootVC:homeVC img:@"tab_1" selectImg:@"tab_1_selected"];
    homeNag.tabBarItem.title = @"首页";
    homeNag.view.backgroundColor = [UIColor randomColor];
    
    //
    IndexViewController *indexVC = [[IndexViewController alloc] init];
    indexVC.view.backgroundColor = [UIColor randomColor];
    BaseNavigationViewController *indexNag = [self settingTabbarItemWithRootVC:indexVC img:@"tab_2" selectImg:@"tab_2_selected"];
    indexNag.tabBarItem.title = @"商城";
    
    //
    UIViewController *processVC = [[UIViewController alloc] init];
    processVC.view.backgroundColor = [UIColor randomColor];
    BaseNavigationViewController *processNag = [self settingTabbarItemWithRootVC:processVC img:@"tab_3" selectImg:@"tab_3"];
    processNag.tabBarItem.title = @"更多";
    
    //
    UIViewController *mineVC = [[UIViewController alloc] init];
    mineVC.view.backgroundColor = [UIColor randomColor];
    BaseNavigationViewController *mineNag = [self settingTabbarItemWithRootVC:mineVC img:@"tab_4" selectImg:@"tab_4_selected"];
    mineNag.tabBarItem.title = @"我的";
   
    self.viewControllers = @[homeNag, indexNag, processNag, mineNag];
     
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

- (BaseNavigationViewController *)settingTabbarItemWithRootVC:(id)VC img:(NSString *)imgStr selectImg:(NSString *)selectImg
{
    BaseNavigationViewController *nag = [[BaseNavigationViewController alloc] initWithRootViewController:VC];
    [nag.tabBarItem setImage:[[UIImage imageNamed:imgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [nag.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    return nag;
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
       
    }
    
    if(@available(iOS 13.0, *)) {
        [[UITabBar appearance] setTintColor:selected_Color];
        [[UITabBar appearance] setUnselectedItemTintColor:normal_Color];
    }
    
    //设置 tabbar上边的一条灰线
    [self.tabBar setShadowImage:[UIImage new]];
}



@end
