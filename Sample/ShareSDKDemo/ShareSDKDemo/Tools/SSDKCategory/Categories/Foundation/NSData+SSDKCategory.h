//
//  NSData+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2019/1/8.
//  Copyright © 2019 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <CommonCrypto/CommonCrypto.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSData (SSDKCategory)

+ (nullable NSData *)dataNamed:(NSString *)name;

@end
@interface NSData (Hash)

- (NSString *)md2String;

- (NSData *)md2Data;

- (NSString *)md4String;

- (NSData *)md4Data;

- (NSString *)md5String;

- (NSData *)md5Data;

- (NSString *)sha1String;

- (NSData *)sha1Data;

- (NSString *)sha224String;

- (NSData *)sha224Data;

- (NSString *)sha256String;

- (NSData *)sha256Data;

- (NSString *)sha384String;

- (NSData *)sha384Data;

- (NSString *)sha512String;

- (NSData *)sha512Data;

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

- (NSData *)hmacMD5DataWithKey:(NSData *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

- (NSData *)hmacSHA1DataWithKey:(NSData *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

- (NSData *)hmacSHA224DataWithKey:(NSData *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

- (NSData *)hmacSHA256DataWithKey:(NSData *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

- (NSData *)hmacSHA384DataWithKey:(NSData *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSData *)hmacSHA512DataWithKey:(NSData *)key;

- (NSString *)crc32String;

- (uint32_t)crc32;

@end


@interface NSData (Code)



- (NSString *)utf8String;

- (nullable NSString *)hexString;

+ (nullable NSData *)dataWithHexString:(NSString *)hexString;

- (nullable NSString *)base64EncodedString;

+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString;

- (nullable id)jsonValueDecoded;

@end

@interface NSData (Encryption)

- (nullable NSData *)encryptDataWithCCALg:(CCAlgorithm)alg key:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)decryptDataWithCCALg:(CCAlgorithm)alg key:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)encryptStringWithCCALg:(CCAlgorithm)alg key:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)keySize;

- (nullable NSData *)decryptStringWithCCALg:(CCAlgorithm)alg key:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)keySize;

@end

@interface NSData (AES)

- (nullable NSData *)aes256EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)aes256DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv;


- (nullable NSData *)aesEncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)size;

- (nullable NSData *)aesDecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)size;

@end

@interface NSData (DES)

- (nullable NSData *)desEncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)desDecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv;


- (nullable NSData *)desEncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv;

- (nullable NSData *)desDecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv;

@end

@interface NSData (DES3)

- (nullable NSData *)des3EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv;

- (nullable NSData *)des3DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv;


- (nullable NSData *)des3EncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv;

- (nullable NSData *)des3DecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv;

@end

NS_ASSUME_NONNULL_END
