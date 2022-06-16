//
//  NSString+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/18.
//  Copyright © 2018 mob. All rights reserved.
//

#import "NSString+SSDKCategory.h"
#import "NSData+SSDKCategory.h"
#import "NSNumber+SSDKCategory.h"
@implementation NSString (SSDKCategory)

- (NSData *)utf8Data{
    NSString *string = self;
    return [string dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary *)jsonDictionary{
    id data = [self jsonChange];
    if (data && [data isKindOfClass:[NSDictionary class]]) {
        return data;
    }else{
        return nil;
    }
}

- (id)jsonChange{
    if (self.length == 0) return nil;
    NSString *string = self;
    id data = [NSJSONSerialization JSONObjectWithData:[string utf8Data] options:kNilOptions error:nil];
    return data;
}

- (NSArray *)jsonArray{
    id data = [self jsonChange];
    if (data && [data isKindOfClass:[NSArray class]]) {
        return data;
    }else{
        return nil;
    }
}

- (id)jsonObject{
    return [self jsonChange];
}
- (CGSize)sizeWithAttributes:(NSDictionary<NSAttributedStringKey,id> *)attrs limitSize:(CGSize)size{
    CGRect strRect = [self boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attrs context:nil];
    return strRect.size;
}
@end

@implementation NSString(Contains)

- (BOOL)isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)isMobileNumber{
    if ([self hasPrefix:@"1"]) {
        if (self.length == 11) {
            if ([self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]].length == 0) {
                return YES;
            }
        }
    }
    return NO;
}

- (BOOL)isEmailAddress{
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self isValidateByRegex:emailRegex];
}

- (BOOL)isIPAddress{
    NSString *regex = [NSString stringWithFormat:@"^(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})$"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL rc = [pre evaluateWithObject:self];
    if (rc) {
        NSArray *componds = [self componentsSeparatedByString:@","];
        BOOL v = YES;
        for (NSString *s in componds) {
            if (s.integerValue > 255) {
                v = NO;
                break;
            }
        }
        return v;
    }
    return NO;
}


- (BOOL)isMacAddress{
    NSString * macAddRegex = @"([A-Fa-f\\d]{2}:){5}[A-Fa-f\\d]{2}";
    return  [self isValidateByRegex:macAddRegex];
}

- (BOOL)isValidPostalcode{
    NSString *postalRegex = @"^[0-8]\\d{5}(?!\\d)$";
    return [self isValidateByRegex:postalRegex];
}

- (BOOL)isValidChinese{
    NSString *chineseRegex = @"^[\u4e00-\u9fa5]+$";
    return [self isValidateByRegex:chineseRegex];
}


- (BOOL)isValidUrl{
    NSString *regex = @"^((http)|(https))+:[^\\s]+\\.[^\\s]*$";
    return [self isValidateByRegex:regex];
}


- (BOOL)isContainEmoji{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    return [regex numberOfMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)] > 0;
}

@end

#define SSDKSTRINGHASH(method)\
return [[self utf8Data] method];

#define SSDKSTRINGHASH_KEY(method,key)\
return [[self utf8Data] hmac##method##StringWithKey:key];

@implementation NSString (Hash)
- (NSString *)md2String{
    SSDKSTRINGHASH(md2String)
}

- (NSString *)md4String{
    SSDKSTRINGHASH(md4String)
}

- (NSString *)md5String{
    SSDKSTRINGHASH(md5String)
}

- (NSString *)sha1String{
    SSDKSTRINGHASH(sha1String)
}

- (NSString *)sha224String{
    SSDKSTRINGHASH(sha224String)
}

- (NSString *)sha256String{
    SSDKSTRINGHASH(sha256String)
}

- (NSString *)sha384String{
    SSDKSTRINGHASH(sha384String)
}

- (NSString *)sha512String{
    SSDKSTRINGHASH(sha384String)
}

/**
 加密，加盐
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(MD5,key)
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(SHA1,key)
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(SHA224,key)
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(SHA256,key)
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(SHA384,key)
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key{
    SSDKSTRINGHASH_KEY(SHA512,key)
}
@end

@implementation NSString (Code)

- (nullable NSString *)base64EncodedString{
    return [[self utf8Data] base64EncodedString];
}
+ (nullable NSString *)stringWithBase64EncodedString:(NSString *)base64EncodedString{
    NSData *data = [NSData dataWithBase64EncodedString:base64EncodedString];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/**
 URL encode a string in utf-8.
 @return the encoded string.
 */
- (NSString *)stringByURLEncode{
    if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
        /**
         AFNetworking/AFURLRequestSerialization.m
         
         Returns a percent-escaped string following RFC 3986 for a query string key or value.
         RFC 3986 states that the following characters are "reserved" characters.
         - General Delimiters: ":", "#", "[", "]", "@", "?", "/"
         - Sub-Delimiters: "!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="
         In RFC 3986 - Section 3.4, it states that the "?" and "/" characters should not be escaped to allow
         query strings to include a URL. Therefore, all "reserved" characters with the exception of "?" and "/"
         should be percent-escaped in the query string.
         - parameter string: The string to be percent-escaped.
         - returns: The percent-escaped string.
         */
        static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@"; // does not include "?" or "/" due to RFC 3986 - Section 3.4
        static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
        
        NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
        static NSUInteger const batchSize = 50;
        
        NSUInteger index = 0;
        NSMutableString *escaped = @"".mutableCopy;
        
        while (index < self.length) {
            NSUInteger length = MIN(self.length - index, batchSize);
            NSRange range = NSMakeRange(index, length);
            // To avoid breaking up character sequences such as 👴🏻👮🏽
            range = [self rangeOfComposedCharacterSequencesForRange:range];
            NSString *substring = [self substringWithRange:range];
            NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
            [escaped appendString:encoded];
            
            index += range.length;
        }
        return escaped;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding cfEncoding = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *encoded = (__bridge_transfer NSString *)
        CFURLCreateStringByAddingPercentEscapes(
                                                kCFAllocatorDefault,
                                                (__bridge CFStringRef)self,
                                                NULL,
                                                CFSTR("!#$&'()*+,/:;=?@[]"),
                                                cfEncoding);
        return encoded;
#pragma clang diagnostic pop
    }
}
/**
 URL decode a string in utf-8.
 @return the decoded string.
 */
- (NSString *)stringByURLDecode{
    if ([self respondsToSelector:@selector(stringByRemovingPercentEncoding)]) {
        return [self stringByRemovingPercentEncoding];
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        CFStringEncoding en = CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding);
        NSString *decoded = [self stringByReplacingOccurrencesOfString:@"+"
                                                            withString:@" "];
        decoded = (__bridge_transfer NSString *)
        CFURLCreateStringByReplacingPercentEscapesUsingEncoding(
                                                                NULL,
                                                                (__bridge CFStringRef)decoded,
                                                                CFSTR(""),
                                                                en);
        return decoded;
#pragma clang diagnostic pop
    }
}
/**
 Escape commmon HTML to Entity.
 Example: "a>b" will be escape to "a&gt;b".
 */
- (NSString *)stringByEscapingHTML{
    NSUInteger len = self.length;
    if (!len) return self;
    
    unichar *buf = malloc(sizeof(unichar) * len);
    if (!buf) return self;
    [self getCharacters:buf range:NSMakeRange(0, len)];
    
    NSMutableString *result = [NSMutableString string];
    for (int i = 0; i < len; i++) {
        unichar c = buf[i];
        NSString *esc = nil;
        switch (c) {
            case 34: esc = @"&quot;"; break;
            case 38: esc = @"&amp;"; break;
            case 39: esc = @"&apos;"; break;
            case 60: esc = @"&lt;"; break;
            case 62: esc = @"&gt;"; break;
            default: break;
        }
        if (esc) {
            [result appendString:esc];
        } else {
            CFStringAppendCharacters((CFMutableStringRef)result, &c, 1);
        }
    }
    free(buf);
    return result;
}

@end
@implementation NSString (RegularExpression)
- (BOOL)matchesRegex:(NSString *)regex options:(NSRegularExpressionOptions)options {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:NULL];
    if (!pattern) return NO;
    return ([pattern numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)] > 0);
}

- (void)enumerateRegexMatches:(NSString *)regex
                      options:(NSRegularExpressionOptions)options
                   usingBlock:(void (^)(NSString *match, NSRange matchRange, BOOL *stop))block {
    if (regex.length == 0 || !block) return;
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!regex) return;
    [pattern enumerateMatchesInString:self options:kNilOptions range:NSMakeRange(0, self.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
        block([self substringWithRange:result.range], result.range, stop);
    }];
}

- (NSString *)stringByReplacingRegex:(NSString *)regex
                             options:(NSRegularExpressionOptions)options
                          withString:(NSString *)replacement; {
    NSRegularExpression *pattern = [NSRegularExpression regularExpressionWithPattern:regex options:options error:nil];
    if (!pattern) return self;
    return [pattern stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:replacement];
}
@end
@implementation NSString (Number)

- (char)charValue {
    return self.numberValue.charValue;
}

- (unsigned char) unsignedCharValue {
    return self.numberValue.unsignedCharValue;
}

- (short) shortValue {
    return self.numberValue.shortValue;
}

- (unsigned short) unsignedShortValue {
    return self.numberValue.unsignedShortValue;
}

- (unsigned int) unsignedIntValue {
    return self.numberValue.unsignedIntValue;
}

- (long) longValue {
    return self.numberValue.longValue;
}

- (unsigned long) unsignedLongValue {
    return self.numberValue.unsignedLongValue;
}

- (unsigned long long) unsignedLongLongValue {
    return self.numberValue.unsignedLongLongValue;
}

- (NSUInteger) unsignedIntegerValue {
    return self.numberValue.unsignedIntegerValue;
}

@end
@implementation NSString (PinYin)
///拼音 ->pinyin
- (NSString*)transformToPinyin{
    NSMutableString *mutableString=[NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString,NULL,kCFStringTransformToLatin,false);
    mutableString = (NSMutableString*)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    mutableString = [[mutableString stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
    return mutableString.lowercaseString;
}

///拼音首字母 -> py
- (NSString *)transformToPinyinFirstLetter{
    NSMutableString *stringM = [NSMutableString string];
    NSString *temp  =  nil;
    for(int i =0; i < [self length]; i++){
        temp = [self substringWithRange:NSMakeRange(i, 1)];
        NSMutableString *mutableString=[NSMutableString stringWithString:temp];
        CFStringTransform((CFMutableStringRef)mutableString,NULL,kCFStringTransformToLatin,false);
        mutableString = (NSMutableString*)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
        mutableString =  [[mutableString substringToIndex:1] mutableCopy];
        [stringM appendString:(NSString *)mutableString];
    }
    return stringM.lowercaseString;
}


@end


@implementation NSString (Utility)

/**
 返回UUID
 
 */
+ (NSString *)stringWithUUID{
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

/**
 返回一个字符串，该字符串包含给定UTF32Char中的字符
 */
+ (NSString *)stringWithUTF32Char:(UTF32Char)char32{
    char32 = NSSwapHostIntToLittle(char32);
    return [[NSString alloc] initWithBytes:&char32 length:4 encoding:NSUTF32LittleEndianStringEncoding];
}

/**
 返回一个字符串，该字符串包含给定UTF32Char数组中的字符。
 */
+ (NSString *)stringWithUTF32Chars:(const UTF32Char *)char32 length:(NSUInteger)length{
    return [[NSString alloc] initWithBytes:(const void *)char32
                                    length:length * 4
                                  encoding:NSUTF32LittleEndianStringEncoding];
}

/**
 去除空字符和换行
 */
- (void)enumerateUTF32CharInRange:(NSRange)range usingBlock:(void (^)(UTF32Char char32, NSRange range, BOOL *stop))block{
    NSString *str = self;
    if (range.location != 0 || range.length != self.length) {
        str = [self substringWithRange:range];
    }
    NSUInteger len = [str lengthOfBytesUsingEncoding:NSUTF32StringEncoding] / 4;
    UTF32Char *char32 = (UTF32Char *)[str cStringUsingEncoding:NSUTF32LittleEndianStringEncoding];
    if (len == 0 || char32 == NULL) return;
    
    NSUInteger location = 0;
    BOOL stop = NO;
    NSRange subRange;
    UTF32Char oneChar;
    
    for (NSUInteger i = 0; i < len; i++) {
        oneChar = char32[i];
        subRange = NSMakeRange(location, oneChar > 0xFFFF ? 2 : 1);
        block(oneChar, subRange, &stop);
        if (stop) return;
        location += subRange.length;
    }
}

- (NSString *)stringByTrim{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (BOOL)isNotBlank{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}

- (NSNumber *)numberValue {
    return [NSNumber numberWithString:self];
}

- (NSData *)dataValue {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSRange)rangeOfAll {
    return NSMakeRange(0, self.length);
}


+ (NSString *)stringNamed:(NSString *)name{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@""];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    if (!str) {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
        str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    }
    return str;
}

+ (NSString *)numberTransformWord:(NSUInteger) num
{
    switch (num) {
        case 0:
            return @"零";
            break;
            
        case 1:
            return @"一";
            break;
            
        case 2:
            return @"二";
            break;
            
        case 3:
            return @"三";
            break;
            
        case 4:
            return @"四";
            break;
            
        case 5:
            return @"五";
            break;
            
        case 6:
            return @"六";
            break;
            
        case 7:
            return @"七";
            break;
            
        case 8:
            return @"八";
            break;
            
        case 9:
            return @"九";
            break;
            
        default:
            return nil;
            break;
    }
}

+ (NSString *)covert:(NSUInteger)num{
    NSString *numStr = [NSString stringWithFormat:@"%lu",(unsigned long)num];
    NSString *resultStr = @"";
    for (int i=0; i<[numStr length]; ++i) {
        NSString *tempStr = [numStr substringWithRange:NSMakeRange(i, 1)];
        resultStr  = [resultStr stringByAppendingString:[self numberTransformWord:[tempStr integerValue]]];
    }
    
    if (num/10 == 1) {
        if ([[resultStr substringToIndex:1] isEqualToString:@"一"] ) {
            if ([[resultStr substringToIndex:2] isEqualToString:@"一零"]) {
                resultStr = @"十";
            } else {
                resultStr = [NSString stringWithFormat:@"十%@", [resultStr substringFromIndex:1]];
            }
        }
    }
    
    NSMutableString *resultString = [[NSMutableString alloc] initWithString:resultStr];
    
    if (num/10 > 1) {
        [resultString insertString:@"十" atIndex:1];
    }else if (num/100 != 0) {
        resultString = [NSMutableString stringWithString:resultStr];
        [resultString insertString:@"百" atIndex:1];
        [resultString insertString:@"十" atIndex:3];
    }else if (num/1000 != 0) {
        resultString = [NSMutableString stringWithString:resultStr];
        [resultString insertString:@"千" atIndex:1];
        [resultString insertString:@"百" atIndex:3];
        [resultString insertString:@"十" atIndex:5];
    }
    
    return resultString;
}

@end
