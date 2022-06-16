//
//  NSData+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2019/1/8.
//  Copyright © 2019 mob. All rights reserved.
//

#import "NSData+SSDKCategory.h"
#import "NSString+SSDKCategory.h"

#include <zlib.h>
@implementation NSData (SSDKCategory)
+ (NSData *)dataNamed:(NSString *)name {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    if (!path) return nil;
    NSData *data = [NSData dataWithContentsOfFile:path];
    return data;
}
@end
#define SSDKDATA_ENCRYTION(encryptionType, clas)\
\
NSUInteger number =  CC_##encryptionType##_DIGEST_LENGTH;\
unsigned char result[number];\
CC_##encryptionType(self.bytes, (CC_LONG)self.length, result);\
id data;\
if (clas == 0) {\
data = [NSData dataWithBytes:result length:number];\
}else{\
NSMutableString *hash = [NSMutableString stringWithCapacity:number * 2];\
for (int i = 0; i < number; i++) {\
[hash appendFormat:@"%02x",result[i]];\
}\
data = hash.copy;\
}\
return data;


#define SSDKDATA_WITH_KEY(alg, key)\
\
size_t size = CC_##alg##_DIGEST_LENGTH;\
unsigned char result[size];\
id data;\
if ([key isKindOfClass:[NSData class]]) {\
NSData *da = (NSData *)key;\
CCHmac(kCCHmacAlg##alg, [da bytes], da.length, self.bytes, (CC_LONG)self.length, result);\
data = [NSData dataWithBytes:result length:size];\
}else{\
NSString *da = (NSString *)key;\
const char *cKey = [da cStringUsingEncoding:NSUTF8StringEncoding];\
CCHmac(kCCHmacAlg##alg, cKey, strlen(cKey), self.bytes, (CC_LONG)self.length, result);\
NSMutableString *hash = [NSMutableString stringWithCapacity:size * 2];\
for (int i = 0; i < size; i++) {\
[hash appendFormat:@"%02x", result[i]];\
}\
data = hash.copy;\
}\
return data;

@implementation NSData (Hash)

- (NSData *)md2Data{
    
    SSDKDATA_ENCRYTION(MD2, 0)
    
}

- (NSString *)md2String{
    SSDKDATA_ENCRYTION(MD2, 1)
}
- (NSString *)md4String{
    SSDKDATA_ENCRYTION(MD4, 1)
}

- (NSData *)md4Data{
    SSDKDATA_ENCRYTION(MD4, 0)
}

- (NSString *)md5String{
    SSDKDATA_ENCRYTION(MD5, 1)
}

- (NSData *)md5Data{
    SSDKDATA_ENCRYTION(MD5, 0)
}

- (NSString *)sha1String{
    SSDKDATA_ENCRYTION(SHA1, 1)
}

- (NSData *)sha1Data{
    SSDKDATA_ENCRYTION(SHA1, 0)
}

- (NSString *)sha224String{
    SSDKDATA_ENCRYTION(SHA224, 1)
}

- (NSData *)sha224Data{
    SSDKDATA_ENCRYTION(SHA224, 0);
}

- (NSString *)sha256String{
    SSDKDATA_ENCRYTION(SHA256, 1);
}

- (NSData *)sha256Data{
    SSDKDATA_ENCRYTION(SHA256, 0);
}

- (NSString *)sha384String{
    SSDKDATA_ENCRYTION(SHA384, 1);
}

- (NSData *)sha384Data{
    SSDKDATA_ENCRYTION(SHA384, 0);
}

- (NSString *)sha512String{
    SSDKDATA_ENCRYTION(SHA512, 1);
}

- (NSData *)sha512Data{
    SSDKDATA_ENCRYTION(SHA512, 0);
}


- (NSString *)hmacMD5StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(MD5, key)
}

- (NSData *)hmacMD5DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(MD5, key)
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(SHA1, key)
}

- (NSData *)hmacSHA1DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(SHA1, key)
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(SHA224, key)
}

- (NSData *)hmacSHA224DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(SHA224, key)
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(SHA256, key)
}

- (NSData *)hmacSHA256DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(SHA256, key)
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(SHA384, key)
}

- (NSData *)hmacSHA384DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(SHA384, key)
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key{
    SSDKDATA_WITH_KEY(SHA512, key)
}

- (NSData *)hmacSHA512DataWithKey:(NSData *)key{
    SSDKDATA_WITH_KEY(SHA512, key)
}

- (NSString *)crc32String {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return [NSString stringWithFormat:@"%08x", (uint32_t)result];
}

- (uint32_t)crc32 {
    uLong result = crc32(0, self.bytes, (uInt)self.length);
    return (uint32_t)result;
}

@end
@implementation NSData (Code)



- (NSString *)utf8String{
    if (self.length > 0) {
        return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
    }
    return @"";
}

- (nullable NSString *)hexString{
    NSUInteger length = self.length;
    NSMutableString *result = [NSMutableString stringWithCapacity:length * 2];
    const unsigned char *byte = self.bytes;
    for (int i = 0; i < length; i++, byte++) {
        [result appendFormat:@"%02X", *byte];
    }
    return result;
}

+ (nullable NSData *)dataWithHexString:(NSString *)hexStr{
    hexStr = [hexStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    hexStr = [hexStr lowercaseString];
    NSUInteger len = hexStr.length;
    if (!len) return nil;
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return nil;
    [hexStr getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableData *result = [NSMutableData data];
    unsigned char bytes;
    char str[3] = { '\0', '\0', '\0' };
    int i;
    for (i = 0; i < len / 2; i++) {
        str[0] = buf[i * 2];
        str[1] = buf[i * 2 + 1];
        bytes = strtol(str, NULL, 16);
        [result appendBytes:&bytes length:1];
    }
    free(buf);
    return result;
}
static const char base64EncodingTable[64]
= "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
static const short base64DecodingTable[256] = {
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2,  -1,  -1, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62,  -2,  -2, -2, 63,
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2,  -2,  -2, -2, -2,
    -2, 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12, 13, 14,
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2,  -2,  -2, -2, -2,
    -2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,  37,  38, 39, 40,
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2,
    -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,  -2,  -2, -2, -2
};
- (nullable NSString *)base64EncodedString{
    NSUInteger length = self.length;
    if (length == 0)
        return @"";
    
    NSUInteger out_length = ((length + 2) / 3) * 4;
    uint8_t *output = malloc(((out_length + 2) / 3) * 4);
    if (output == NULL)
        return nil;
    
    const char *input = self.bytes;
    NSInteger i, value;
    for (i = 0; i < length; i += 3) {
        value = 0;
        for (NSInteger j = i; j < i + 3; j++) {
            value <<= 8;
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
        NSInteger index = (i / 3) * 4;
        output[index + 0] = base64EncodingTable[(value >> 18) & 0x3F];
        output[index + 1] = base64EncodingTable[(value >> 12) & 0x3F];
        output[index + 2] = ((i + 1) < length)
        ? base64EncodingTable[(value >> 6) & 0x3F]
        : '=';
        output[index + 3] = ((i + 2) < length)
        ? base64EncodingTable[(value >> 0) & 0x3F]
        : '=';
    }
    
    NSString *base64 = [[NSString alloc] initWithBytes:output
                                                length:out_length
                                              encoding:NSASCIIStringEncoding];
    free(output);
    return base64;
}

+ (nullable NSData *)dataWithBase64EncodedString:(NSString *)base64EncodedString{
    NSInteger length = base64EncodedString.length;
    const char *string = [base64EncodedString cStringUsingEncoding:NSASCIIStringEncoding];
    if (string  == NULL)
        return nil;
    
    while (length > 0 && string[length - 1] == '=')
        length--;
    
    NSInteger outputLength = length * 3 / 4;
    NSMutableData *data = [NSMutableData dataWithLength:outputLength];
    if (data == nil)
        return nil;
    if (length == 0)
        return data;
    
    uint8_t *output = data.mutableBytes;
    NSInteger inputPoint = 0;
    NSInteger outputPoint = 0;
    while (inputPoint < length) {
        char i0 = string[inputPoint++];
        char i1 = string[inputPoint++];
        char i2 = inputPoint < length ? string[inputPoint++] : 'A';
        char i3 = inputPoint < length ? string[inputPoint++] : 'A';
        
        output[outputPoint++] = (base64DecodingTable[i0] << 2)
        | (base64DecodingTable[i1] >> 4);
        if (outputPoint < outputLength) {
            output[outputPoint++] = ((base64DecodingTable[i1] & 0xf) << 4)
            | (base64DecodingTable[i2] >> 2);
        }
        if (outputPoint < outputLength) {
            output[outputPoint++] = ((base64DecodingTable[i2] & 0x3) << 6)
            | base64DecodingTable[i3];
        }
    }
    
    return data;
}

- (nullable id)jsonValueDecoded{
    NSError *error = nil;
    id value = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:&error];
    if (error) {
        NSLog(@"jsonValueDecoded error:%@", error);
    }
    return value;
}

@end
/**
 判断s数据是否有效
 
 @param alg 加密模式
 @param keySize key的大小
 @param ivSize vi大小
 */
static inline void encryptBlockSize(CCAlgorithm alg, size_t keySize,size_t ivSize, size_t *blockSize,BOOL *isValid){
    switch (alg) {
        case kCCAlgorithmAES:{
            *isValid = YES;
            *blockSize = kCCBlockSizeAES128;
        }
            break;
        case kCCAlgorithmDES:{
            *isValid = keySize == 8;
            *blockSize = kCCBlockSizeDES;
        }
            break;
        case kCCAlgorithmCAST:{
            *isValid = keySize == 5 || keySize == 16;
            *blockSize = kCCBlockSizeCAST;
        }
            break;
        case kCCAlgorithm3DES:{
            *isValid = keySize == 24;
            *blockSize = kCCBlockSize3DES;
        }
            break;
        case kCCAlgorithmRC4:{
            *isValid = keySize == 512;
            *blockSize = 0;
        }
            break;
        default:
            *isValid = YES;
            *blockSize = 0;
            break;
    }
    if (*isValid) {
        *isValid = *blockSize == ivSize || ivSize == 0;
    }
}
@implementation NSData (Encryption)

- (nullable NSData *)encryptOriWithCCALg:(CCAlgorithm)alg key:(void *)key size:(size_t)keySize iv:( void *)iv size:(size_t)ivSize isEncyrpt:(BOOL)isEncyrpt size:(size_t)blockSize{
    NSData *result = nil;
    size_t bufferSize = self.length + blockSize;
    void *buffer = malloc(bufferSize);
    if (!buffer) return nil;
    size_t encryptedSize = 0;
    
    CCOperation op = isEncyrpt?kCCEncrypt:kCCDecrypt;
    CCCryptorStatus cryptStatus = CCCrypt(op,
                                          alg,
                                          ivSize == 0?kCCOptionPKCS7Padding | kCCOptionECBMode:kCCOptionPKCS7Padding,
                                          key,
                                          keySize,
                                          iv,
                                          self.bytes,
                                          self.length,
                                          buffer,
                                          bufferSize,
                                          &encryptedSize);
    if (cryptStatus == kCCSuccess) {
        result = [[NSData alloc]initWithBytes:buffer length:encryptedSize];
        free(buffer);
        return result;
    } else {
        free(buffer);
        return nil;
    }
}

- (nullable NSData *)encryptDataWithCCALg:(CCAlgorithm)alg key:(NSData *)key iv:(nullable NSData *)iv{
    BOOL isValid = NO;
    size_t blockSize = 0;
    encryptBlockSize(alg, key.length, iv.length, &blockSize, &isValid);
    if (!isValid) return nil;
    return [self encryptOriWithCCALg:alg key:(void *)key.bytes size:key.length iv:(void *)iv.bytes size:iv.length isEncyrpt:YES size:blockSize];
}

- (nullable NSData *)decryptDataWithCCALg:(CCAlgorithm)alg key:(NSData *)key iv:(nullable NSData *)iv{
    BOOL isValid = NO;
    size_t blockSize = 0;
    encryptBlockSize(alg, key.length, iv.length, &blockSize, &isValid);
    if (!isValid) return nil;
    return [self encryptOriWithCCALg:alg key:(void *)key.bytes size:key.length iv:(void *)iv.bytes size:iv.length isEncyrpt:NO size:blockSize];
}

- (nullable NSData *)encryptStringWithCCALg:(CCAlgorithm)alg key:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)keySi{
    if (key.length == 0)return nil;
    
    char keyData[keySi + 1];
    size_t keySize = sizeof(keyData);
    bzero(keyData, keySize);
    
    [key getCString:keyData maxLength:sizeof(keyData) encoding:NSUTF8StringEncoding];
    size_t ivSize = 0;
    keySize --;
    BOOL isValid = NO;
    size_t blockSize = 0;
    encryptBlockSize(alg, keySize, 0, &blockSize, &isValid);
    ivSize = blockSize + 1;
    char ivData[ivSize];
    if (iv.length > 0) {
        ivSize = sizeof(ivData);
        bzero(ivData, ivSize);
        [iv getCString:ivData maxLength:sizeof(ivData) encoding:NSUTF8StringEncoding];
        ivSize --;
    }else{
        ivSize = 0;
    }
    if (!isValid) return nil;
    return [self encryptOriWithCCALg:alg key:keyData size:keySize iv:ivData size:ivSize isEncyrpt:YES size:blockSize];
}

- (nullable NSData *)decryptStringWithCCALg:(CCAlgorithm)alg key:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)keySi{
    if (key.length == 0)return nil;
    
    char keyData[keySi + 1];
    size_t keySize = sizeof(keyData);
    memset(keyData, 0, keySize);
    
    [key getCString:keyData maxLength:keySize encoding:NSUTF8StringEncoding];
    size_t ivSize = 0;
    void * ivVoid = NULL;
    keySize --;
    BOOL isValid = NO;
    size_t blockSize = 0;
    encryptBlockSize(alg, keySize, 0, &blockSize, &isValid);
    
    if (iv.length > 0) {
        ivSize = blockSize + 1;
        char ivData[ivSize];
        ivSize = sizeof(ivData);
        memset(ivData, 0, ivSize);
        [key getCString:ivData maxLength:ivSize encoding:NSUTF8StringEncoding];
        ivSize --;
        ivVoid = ivData;
    }
    if (!isValid) return nil;
    return [self encryptOriWithCCALg:alg key:keyData size:keySize iv:ivVoid size:ivSize isEncyrpt:NO size:blockSize];
}

@end
@implementation NSData (AES)

- (nullable NSData *)aes256EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv{
    return [self encryptDataWithCCALg:kCCAlgorithmAES key:key iv:iv];
}

- (nullable NSData *)aes256DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv{
    return [self decryptDataWithCCALg:kCCAlgorithmAES key:key iv:iv];
}

- (nullable NSData *)aesEncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)size{
    return [self encryptStringWithCCALg:kCCAlgorithmAES key:key iv:iv keySize:size];
}

- (nullable NSData *)aesDecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv keySize:(size_t)size{
    return [self decryptStringWithCCALg:kCCAlgorithmAES key:key iv:iv keySize:size];
}

@end

@implementation NSData (DES)

- (nullable NSData *)desEncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv{
    return [self encryptDataWithCCALg:kCCAlgorithmDES key:key iv:iv];
}

- (nullable NSData *)desDecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv{
    return [self decryptDataWithCCALg:kCCAlgorithmDES key:key iv:iv];
}


- (nullable NSData *)desEncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv{
    return [self encryptStringWithCCALg:kCCAlgorithmDES key:key iv:iv keySize:kCCKeySizeDES];
}

- (nullable NSData *)desDecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv{
    return [self decryptStringWithCCALg:kCCAlgorithmDES key:key iv:iv keySize:kCCKeySizeDES];
}
@end

@implementation NSData (DES3)
- (nullable NSData *)des3EncryptDataWithKey:(NSData *)key iv:(nullable NSData *)iv{
    return [self encryptDataWithCCALg:kCCAlgorithm3DES key:key iv:iv];
}

- (nullable NSData *)des3DecryptDataWithkey:(NSData *)key iv:(nullable NSData *)iv{
    return [self decryptDataWithCCALg:kCCAlgorithm3DES key:key iv:iv];
}


- (nullable NSData *)des3EncryptStringWithKey:(NSString *)key iv:(nullable NSString *)iv{
    return [self encryptStringWithCCALg:kCCAlgorithm3DES key:key iv:iv keySize:kCCKeySize3DES];
}

- (nullable NSData *)des3DecryptStringWithkey:(NSString *)key iv:(nullable NSString *)iv{
    return [self decryptStringWithCCALg:kCCAlgorithm3DES key:key iv:iv keySize:kCCKeySize3DES];
}
@end

