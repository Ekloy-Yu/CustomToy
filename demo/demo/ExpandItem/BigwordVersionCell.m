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
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.mainImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.mainImageView];
    
    self.titleLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(18) TextAlignment:NSTextAlignmentLeft NumberOfLines:0];
    
    self.subLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(16) TextAlignment:NSTextAlignmentLeft NumberOfLines:0];
    
    self.detailLabel = [UILabel labelWithContent:@"" SuperView:self.contentView TextColor:[UIColor blackColor] Font:kFontSize(16) TextAlignment:NSTextAlignmentLeft NumberOfLines:0];
    
    
    [self setupConstraints];
}


- (void)setupConstraints {
    [self.mainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    
}


@end
