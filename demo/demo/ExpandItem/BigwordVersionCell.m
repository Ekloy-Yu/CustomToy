//
//  BigwordVersionCell.m
//  demo
//
//  Created by 于.Sir゛ on 2021/12/8.
//

#import "BigwordVersionCell.h"

@interface BigwordVersionCell ()

@property (nonatomic, strong) UIImageView *mainImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation BigwordVersionCell

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
    self.mainImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.mainImageView];
    
    self.titleLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(18) TextAlignment:NSTextAlignmentLeft NumberOfLines:0];
    
    self.subLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(16) TextAlignment:NSTextAlignmentLeft NumberOfLines:0];
    
    self.detailLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(16) TextAlignment:NSTextAlignmentLeft NumberOfLines:2];
    
    
    [self setupConstraints];
}


- (void)setupConstraints {
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(120, 100));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(12 + 120 + 12);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.subLabel.mas_bottom).offset(12);
        make.left.equalTo(self.subLabel.mas_left);
        make.right.equalTo(self.contentView).offset(-12);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}

- (void)setModel:(BigwordVersionModel *)model{
    _model = model;
    
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    self.titleLabel.text = model.title;
    self.subLabel.text = model.subTitle;
    self.detailLabel.text = model.detail;
    
    
    if (model.subTitle.length == 0) {
        [self.detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(12);
            make.left.equalTo(self.titleLabel.mas_left);
            make.right.equalTo(self.contentView).offset(-12);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
    }
    
    [self.detailLabel.superview layoutIfNeeded];
    
//    if (CGRectGetMaxY(self.detailLabel.frame) < CGRectGetMaxY(self.mainImageView.frame)) {
//        [self.mainImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
//            make.left.equalTo(self.contentView).offset(12);
//            make.size.mas_equalTo(CGSizeMake(120, 100));
//            make.bottom.equalTo(self.contentView).offset(-10);
//        }];
//    }
    
    CGFloat y1 = CGRectGetMaxY(self.detailLabel.frame);
    CGFloat y2 = CGRectGetMaxY(self.mainImageView.frame);
    if (y1 < y2) {
        CGFloat y = y2 - y1;
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {

            make.bottom.equalTo(self.contentView).offset(-10 - y);
        }];
    }
    
}

@end
