//
//  NSString+SSDKCategory.h
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SSDKCategory)

- (NSData *)utf8Data;

/**
 json字符串转字典
 */
- (NSDictionary *)jsonDictionary;

- (NSArray *)jsonArray;

- (id)jsonObject;

- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs limitSize:(CGSize)size;

@end


@interface NSString (Contains)

/**
 是不是电话
 */
- (BOOL)isMobileNumber;

/**
 是不是邮箱
 */
- (BOOL)isEmailAddress;

/**
 ip有没有效
 */
- (BOOL)isIPAddress;

/**
 Mac地址有效性
 */
- (BOOL)isMacAddress;

/**
 是否是有效的邮政编码
 */
- (BOOL)isValidPostalcode;
/**
 纯汉字
 */
- (BOOL)isValidChinese;

/**
 网址有效性
 */
- (BOOL)isValidUrl;

/**
 表情
 */
- (BOOL)isContainEmoji;

@end

@interface NSString (Hash)
- (NSString *)md2String;

- (NSString *)md4String;

- (NSString *)md5String;

- (NSString *)sha1String;

- (NSString *)sha224String;

- (NSString *)sha256String;

- (NSString *)sha384String;

- (NSString *)sha512String;

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end

@interface NSString (Code)

- (nullable NSString *)base64EncodedString;

+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString;


/**
 用utf8-编码字符串
 */
- (NSString *)stringByURLEncode;
/**
 解码utf-8中的字符串
 */
- (NSString *)stringByURLDecode;
/**
 将普通HTML转义到实体。
 a > b -> a&gt;b
 */
- (NSString *)stringByEscapingHTML;

@end


@interface NSString (RegularExpression)

/**
 匹配正则
 */
- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options;

- (void)enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block;
- (NSString *)stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement;

@end

@interface NSString (Number)
@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) NSUInteger unsignedIntegerValue;
@end

@interface NSString (PinYin)
///拼音 ->pinyin
- (NSString*)transformToPinyin;

///拼音首字母 -> py
- (NSString *)transformToPinyinFirstLetter;

@end

@interface NSString (Utility)

/**
 返回UUID
 
 */
+ (NSString *)stringWithUUID;

/**
 返回一个字符串，该字符串包含给定UTF32Char中的字符
 */
+ (NSString *)stringWithUTF32Char:(UTF32Char)char32;

/**
 返回一个字符串，该字符串包含给定UTF32Char数组中的字符。
 */
+ (NSString *)stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length;

/**
 去除空字符和换行
 */
- (void)enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block;

- (NSString *)stringByTrim;

- (BOOL)containsString:(NSString *)string;

- (BOOL)containsCharacterSet:(NSCharacterSet *)set;

- (NSNumber *)numberValue;

- (NSData *)dataValue;

- (NSRange)rangeOfAll;

+ (NSString *)stringNamed:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
