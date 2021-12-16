//
//  ImageCell.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/14.
//

#import "ImageCell.h"

@interface ImageCell()

@property (nonatomic, strong) UIImageView *mainImage;

@end

@implementation ImageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor randomColor];
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.mainImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.mainImage];
    
    [self setupConstraints];
}


- (void)setupConstraints {
    
    [self.mainImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    [self.mainImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(loadFinishSDWebImage)]) {
            [self.delegate loadFinishSDWebImage];
        }
//        [self.mainImage mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
//        }];
        
    }];
}

@end
