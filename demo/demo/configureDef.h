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

//375屏幕适配
#define Height667(w) (kScreenHeight375Ratio*(w))
#define Adapted375Width(x)  ceilf((x) * kScreenWidth375Ratio)
#define Adapted375Height(x) ceilf((x) * kScreenHeight375Ratio)
#define AdaptedFont375Size(R)     [UIFont systemFontOfSize:Adapted375Width(R)]
#define kScreenWidth375Ratio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeight375Ratio  (UIScreen.mainScreen.bounds.size.height / 667.0)
//四舍五入保证结果是整数(如果是小数 在切圆角的时候有出现黑线的风险)
#define Width375(w) ((CGFloat)(int)(kScreenShortSide*(w+0.5)/375))

//字体大小
#define kFontBold(fontSize) [UIFont fontWithName:@"Helvetica-Bold" size:(fontSize)]
#define kFontSize(fontSzie) [UIFont systemFontOfSize: (fontSzie)]


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) printf("function:%s line:%d \n%s\n", __PRETTY_FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...) nil
#endif

#endif /* configureDef_h */
