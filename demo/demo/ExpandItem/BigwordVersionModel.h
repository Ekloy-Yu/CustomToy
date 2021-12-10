//
//  BigwordVersionModel.h
//  demo
//
//  Created by 于.Sir゛ on 2021/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BigwordVersionDictionary : NSObject

@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong) NSArray *data;

@end

@interface BigwordVersionModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, assign) int height;

@end


NS_ASSUME_NONNULL_END
