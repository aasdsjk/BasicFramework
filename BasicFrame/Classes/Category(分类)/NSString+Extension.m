//
//  NSString+Extension.m
//  大嘴鱼
//
//  Created by DianZhi on 15/8/13.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import "NSString+Extension.h"
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonCrypto.h>
#import "ConmonsTool.h"
#include <sys/param.h>
#include <sys/mount.h>
//#import "XZProductParmeterCategareModel.h"
//#import "XZNeedUpdateImageModel.h"
@implementation NSString (Extension)

- (CGSize)sizeWithFont:(UIFont *)font {

    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    
    
    
    return [self sizeWithFont:font maxSize:maxSize];
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
 
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (NSString *)capNumberStr {
    NSUInteger random = arc4random() % 8999 + 1000;
    
    return [NSString stringWithFormat:@"%lu",(unsigned long)random];
}

- (BOOL)isPhoneNumber {
    NSString *regex = @"^[1][34578][0-9]{9}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isNumber {
    NSString *regex = @"^\\d+$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isFloatNumber {
    NSString *regex = @"^\\d+(\\.\\d+)?$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
    
}

- (BOOL)isEmail {
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (BOOL)isPostCode {
    NSString *regex = @"^[43][0-9]{4}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    BOOL isMatch = [pred evaluateWithObject:self];
    
    return isMatch;
}

- (NSString *)deleteTailZero {
    if ([self hasSuffix:@".00"]) {
        return [self substringToIndex:self.length - 3];
    }
    
    if ([self hasSuffix:@"0"]&&[self containsString:@"."]) {
        return [self substringToIndex:self.length - 1];
    }
    
    return self;
}

- (NSString *)addTailZero {
    float f = [self floatValue];
    
    return [NSString stringWithFormat:@"%.*f",BMFPriceDigit,f];
}

/**
 *  MD5加密
 */
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)timeStrWithFormart:(NSString *)formart {
    NSTimeInterval time = [self doubleValue];
    NSDate *timeDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = formart;
    
    return [fmt stringFromDate:timeDate];
}

- (NSString *)leftTimeScinceNow {
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval endTime = [self doubleValue];
    long long delta =  (long long)(endTime - now);
    if (delta < 0) {
        return nil;
    }
    NSInteger hour = (NSInteger)delta / 3600;
    NSInteger min = (delta % 3600) / 60;
    NSInteger sec = delta % 60;
    
    return [NSString stringWithFormat:@"%zd:%02zd:%02zd",hour,min,sec];
}

- (NSString *)leftDays{
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval timeTamp = [self longLongValue];
    NSInteger delta = timeTamp - now;
    if (delta < 0) {
        NSString *timeLimt = @"已截止";
        return timeLimt;
        
    }
    NSUInteger day = delta / (3600 *24);
    NSUInteger h = (delta % (3600 * 24)) / 3600 ;
    NSUInteger min = (delta % 3600) / 60;
    NSUInteger second = delta % 60;
    
    if (day) {
        NSString *timeLimit = [NSString stringWithFormat:@"还剩%zd天%02zd小时%02zd分%02zd秒",day,h,min,second];
        return timeLimit;
    }
    
    NSString *timeLimit = [NSString stringWithFormat:@"还剩%02zd小时%02zd分%02zd秒",h,min,second];
    return timeLimit;
}

- (NSString *)addSecWithPhoneNum {
    if (self.length < 11) {
        return nil;
    }
    return [NSString stringWithFormat:@"%@****%@", [self substringToIndex:3],[self substringFromIndex:8]];
}
- (NSString *)pingjieStrWithDict:(NSMutableArray *)array
{
    NSMutableString *mustr = nil;
    if (array.count) {
        mustr = [NSMutableString string];
        [array enumerateObjectsUsingBlock:^(NSMutableDictionary *dic, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0) {
                [mustr appendString:[NSString stringWithFormat:@"%@:%@",dic[@"ID"], dic[@"param"]]];
            }else {
                [mustr appendString:[NSString stringWithFormat:@"#%@:%@",dic[@"ID"], dic[@"param"]]];
            }
        }];
    }
    return mustr;
}

- (NSString *)pingjieStrWithArray:(NSMutableArray *)array {
    
    NSMutableString *mustr = nil;
    if (array.count) {
        mustr = [NSMutableString string];
        [array enumerateObjectsUsingBlock:^(NSString * sign, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0) {
                [mustr appendString:sign];
            }else{
                [mustr appendString:[NSString stringWithFormat:@"#%@",sign]];
            }
        }];
    }
    return mustr;
}

//- (NSString *)pingjieStrWithModelArray:(NSMutableArray *)array {
//    NSMutableString *mustr = [NSMutableString string];
//    if (array.count) {
//        [array enumerateObjectsUsingBlock:^(XZProductParmeterCategareModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSString *str = [NSString stringWithFormat:@"%@:%@",obj.parameterID,obj.desTX];
//            if (idx <= 0) {
//                [mustr appendString:str];
//            }else{
//                [mustr appendString:[NSString stringWithFormat:@"#%@",str]];
//            }
//        }];
//    }
//    return mustr;
//}
+(NSMutableAttributedString *)changeStringColor:(NSString *)str{
    
    NSDictionary *dic = @{NSForegroundColorAttributeName:BMFColorFromRGB(0xff8420)};
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    return muStr;
}
//- (NSString *)pingjieStrWithImageModelArray:(NSMutableArray *)array {
//    NSMutableString *mustr = nil;
//    if (array.count) {
//        mustr = [NSMutableString string];
//        [array enumerateObjectsUsingBlock:^(XZNeedUpdateImageModel * model, NSUInteger idx, BOOL * _Nonnull stop) {
//                if (idx == 0) {
//                    [mustr appendString:model.path];
//                }else{
//                    [mustr appendString:[NSString stringWithFormat:@"#%@",model.path]];
//                }
//            
//            }];
//        
//    }
//    return mustr;
//
//}
- (CGFloat)stringHeightWithMaxW:(CGFloat)weidth withFont:(CGFloat)font
{
    CGRect rect = [self boundingRectWithSize:CGSizeMake(weidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:font]} context:nil];
    return rect.size.height + 5;
}

+(BOOL)isBlankString:(NSString *)string{
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
    
}
+(NSString *)getAlipayScheme{
    return @"xianzAppAlipay";
}

//手机剩余空间
+(NSString *) freeDiskSpaceInBytes{
    struct statfs buf;
    long long freespace = -1;
    if(statfs("/var", &buf) >= 0){
        freespace = (long long)(buf.f_bsize * buf.f_bfree);
    }
    return [self humanReadableStringFromBytes:freespace];
    
}
//手机总空间
+(NSString *) totalDiskSpaceInBytes
{
    struct statfs buf;
    long long freespace = 0;
    if (statfs("/", &buf) >= 0) {
        freespace = (long long)buf.f_bsize * buf.f_blocks;
    }
    if (statfs("/private/var", &buf) >= 0) {
        freespace += (long long)buf.f_bsize * buf.f_blocks;
    }
    printf("%lld\n",freespace);
    return [self humanReadableStringFromBytes:freespace];
}
//单个文件的大小
+(long long) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

//计算文件大小
+(NSString *)humanReadableStringFromBytes:(unsigned long long)byteCount
{
    float numberOfBytes = byteCount;
    int multiplyFactor = 0;
    
    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB",@"EB",@"ZB",@"YB",nil];
    
    while (numberOfBytes > 1024) {
        numberOfBytes /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%4.2f %@",numberOfBytes, [tokens objectAtIndex:multiplyFactor]];
}
@end
