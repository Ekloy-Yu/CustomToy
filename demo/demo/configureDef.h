//
//  configureDef.h
//  demo
//
//  Created by 于.Sir゛ on 2021/11/29.
//

#ifndef configureDef_h
#define configureDef_h

/**
 * MARK:-屏幕尺寸宏定义
 * 导航栏高度 状态栏高度 底部tabbar高度 苹果X底部安全区高度
 */

#define OriginalW CGRectGetWidth([[UIScreen mainScreen] bounds])
#define OriginalH CGRectGetHeight([[UIScreen mainScreen] bounds])

#define kScreenShortSide (OriginalH<OriginalW?OriginalH:OriginalW)
#define kScreenLongSide (OriginalH<OriginalW?OriginalW:OriginalH)

#define ScreenWidth   kScreenShortSide
#define ScreenHeight  kScreenLongSide

//是否全面屏 isFullScreen
#define isiPhoneXSeries ((kScreenLongSide)/(kScreenShortSide) > 2.1 ? YES : NO)
// 状态栏高度
#define kStatusBarHeight (isiPhoneXSeries ? 44.f : 20.f)
// 导航栏高度
#define kNavBarHeight (44.f + kStatusBarHeight)
// 底部标签栏高度
#define kTabBarHeight (isiPhoneXSeries ? (49.f + 34.f) : 49.f)
// 安全区域高度
#define kTabbarSafeBottomMargin     (isiPhoneXSeries ? 34.f : 0.f)


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) printf("function:%s line:%d \n%s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* configureDef_h */
