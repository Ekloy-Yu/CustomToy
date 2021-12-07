//
//  BaseTableViewCell.h
//  demo
//
//  Created by 于.Sir゛ on 2021/12/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, assign) NSInteger cellHeight;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
