//
//  ImageCell.h
//  demo
//
//  Created by 于.Sir゛ on 2021/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ImageCell;
@protocol ImageCellDelegate <NSObject>

- (void)loadFinishSDWebImage;

@end

@interface ImageCell : UITableViewCell

@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, weak) id<ImageCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
