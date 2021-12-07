//
//  H5TextLabelCell.h
//  demo
//
//  Created by 于.Sir゛ on 2021/12/1.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN


@class H5TextLabelCell;
@protocol H5TextLabelCellDelegate <NSObject>

- (void)showWebViewDidFinishWithHeight:(CGFloat)height forIndexPath:(NSIndexPath *)indexPath;

@end

@interface H5TextLabelCell : BaseTableViewCell

@property (nonatomic, strong) NSString *textContent;
@property (nonatomic, weak) id<H5TextLabelCellDelegate> webViewDelegate;

@end

NS_ASSUME_NONNULL_END
