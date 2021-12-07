//
//  H5TextLabelCell.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/1.
//

#import "H5TextLabelCell.h"
#import <WebKit/WebKit.h>

@interface H5TextLabelCell ()<WKUIDelegate, WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIView *scrollView;

@end

@implementation H5TextLabelCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self showLabelView];
    }
    return self;
}


- (void)showLabelView{
    
    self.scrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0)];
    [self.contentView addSubview:self.scrollView];
    
    
    //创建网页配置对象
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    // 创建设置对象
    WKPreferences *preference = [[WKPreferences alloc]init];
    //最小字体大小 当将javaScriptEnabled属性设置为NO时，可以看到明显的效果
    preference.minimumFontSize = 0;
    //设置是否支持javaScript 默认是支持的
    preference.javaScriptEnabled = YES;
    // 在iOS上默认为NO，表示是否允许不经过用户交互由javaScript自动打开窗口
    preference.javaScriptCanOpenWindowsAutomatically = YES;
    config.preferences = preference;
    // 是使用h5的视频播放器在线播放, 还是使用原生播放器全屏播放
    config.allowsInlineMediaPlayback = YES;
    //设置视频是否需要用户手动播放  设置为NO则会允许自动播放
    config.mediaTypesRequiringUserActionForPlayback = YES;
    //设置是否允许画中画技术 在特定设备上有效
    config.allowsPictureInPictureMediaPlayback = YES;
    //设置请求的User-Agent信息中应用程序名称 iOS9后可用
    config.applicationNameForUserAgent = @"ChinaDailyForiPad";
    //这个类主要用来做native与JavaScript的交互管理
    WKUserContentController * wkUController = [[WKUserContentController alloc] init];
    config.userContentController = wkUController;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.scrollView.frame configuration:config];
    // UI代理
    self.webView.UIDelegate = self;
    self.webView.scrollView.scrollEnabled = NO;
    // 导航代理
    self.webView.navigationDelegate = self;
    
    [self.scrollView addSubview:self.webView];
    
    
}

- (void)setTextContent:(NSString *)textContent{
    if (![_textContent isEqualToString:textContent] && textContent.length != 0) {
        _textContent = textContent;
        [self.webView loadHTMLString:textContent baseURL:nil];
        [self.webView reload];
    }
}


- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [webView evaluateJavaScript:@"document.body.scrollHeight" completionHandler:^(id _Nullable finishHeight, NSError * _Nullable error) {
        if (error) {
            return;
        }
        CGFloat newHeight = [finishHeight floatValue];

        self.cellHeight = newHeight;
        self.scrollView.frame = CGRectMake(0, 0, ScreenWidth, newHeight);
        self.webView.frame = self.scrollView.frame;
        if (self.webViewDelegate && [self.webViewDelegate respondsToSelector:@selector(showWebViewDidFinishWithHeight:forIndexPath:)]) {
            [self.webViewDelegate showWebViewDidFinishWithHeight:newHeight forIndexPath:self.indexPath];
        }
        
    }];
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
