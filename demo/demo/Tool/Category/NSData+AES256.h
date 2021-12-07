//
//  NSData+AES256.h
//  QLYSDK
//
//  Created by 姜婷婷 on 2018/3/23.
//  Copyright © 2018年 QLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSData (AES256)
/**
 *  encrypt是加密，decrypt是解密
 *  密钥key16字节的用128方法，32字节用256方法
 */
- (NSData *)aes128_encrypt:(NSData *)key iv:(NSData *)iv;
- (NSData *)aes128_decrypt:(NSData *)key iv:(NSData *)iv;

- (NSData *)aes256_encrypt:(NSString *)key iv:(NSString *)iv;
- (NSData *)aes256_decrypt:(NSString *)key iv:(NSString *)iv;

- (NSData *)AES128Operation:(CCOperation)operation key:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128EncryptWithKey:(NSString *)key iv:(NSString *)iv;
- (NSData *)AES128DecryptWithKey:(NSString *)key iv:(NSString *)iv;

- (NSString *)utf8String;
@end
