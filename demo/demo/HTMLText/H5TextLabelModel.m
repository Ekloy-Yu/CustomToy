//
//  H5TextLabelModel.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/1.
//

#import "H5TextLabelModel.h"

@implementation H5TextLabelModel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.htmlString = [self htmlString];
    }
    return self;
}

- (NSString *)htmlString{
    NSString *string = @"<p><img src=\"https://bbw-teachly-test-1258642429.cos.ap-beijing.myqcloud.com/202111/18/1637229571979285475.jpg\" _src=\"https://bbw-teachly-test-1258642429.cos.ap-beijing.myqcloud.com/202111/18/1637229571979285475.jpg\" style=\"width: 100%; \"/></p>";
    string = [self adaptWebViewForHtml:string];
    return string;
}

- (NSString *)adaptWebViewForHtml:(NSString *) htmlStr {
    NSMutableString *headHtml = [[NSMutableString alloc] initWithCapacity:0];
    [headHtml appendString : @"<html>" ];
    [headHtml appendString : @"<head>" ];
    [headHtml appendString : @"<meta charset=\"utf-8\">" ];
    [headHtml appendString : @"<meta id=\"viewport\" name=\"viewport\" content=\"width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=false\" />" ];
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />" ];
    [headHtml appendString : @"<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />" ];
    [headHtml appendString : @"<meta name=\"black\" name=\"apple-mobile-web-app-status-bar-style\" />" ];
    //适配图片宽度，让图片宽度等于屏幕宽度
    //[headHtml appendString : @"<style>img{width:100%;}</style>" ];
    //[headHtml appendString : @"<style>img{height:auto;}</style>" ];
    //适配图片宽度，让图片宽度最大等于屏幕宽度
//    [headHtml appendString : @"<style>img{max-width:100%;width:auto;height:auto;}</style>"];
    //适配图片宽度，如果图片宽度超过手机屏幕宽度，就让图片宽度等于手机屏幕宽度，高度自适应，如果图片宽度小于屏幕宽度，就显示图片大小
    [headHtml appendString : @"<script type='text/javascript'>"
     "window.onload = function(){\n"
     "var maxwidth=document.body.clientWidth;\n" //屏幕宽度
     "for(i=0;i <document.images.length;i++){\n"
     "var myimg = document.images[i];\n"
     "if(myimg.width > maxwidth){\n"
     "myimg.style.width = '100%';\n"
     "myimg.style.height = 'auto'\n;"
     "}\n"
     "}\n"
     "}\n"
     "</script>\n"];
    [headHtml appendString : @"<style>table{width:100%;}</style>" ];
    [headHtml appendString : @"<title>webview</title>" ];
    NSString *bodyHtml;
    bodyHtml = [NSString stringWithString:headHtml];
    bodyHtml = [bodyHtml stringByAppendingString:htmlStr];
    return bodyHtml;
}

@end
