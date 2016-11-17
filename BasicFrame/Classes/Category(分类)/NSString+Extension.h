//
//  NSString+Extension.h
//  大嘴鱼
//
//  Created by DianZhi on 15/8/13.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (Extension)

/**
 *  根据字体计算大小
 *
 *  @param font 字体
 *
 *
 */
- (CGSize)sizeWithFont:(UIFont *)font;

/**
 *  根据字体计算大小
 *
 *  @param font 字体
 *  @param maxSize 最大宽高
 *
 *
 */
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  判断是否为电话号码
 */
- (BOOL)isPhoneNumber;

/**
 * 判断是否为email
 */
- (BOOL)isEmail;

/**
 *判断是否为邮箱
 */
- (BOOL)isPostCode;
/**
 *  生成验证码
 */
+ (NSString *)capNumberStr;


/**
 * 去除末尾的0
 */
- (NSString *)deleteTailZero;
/**
 *  末尾补0
 */
- (NSString *)addTailZero;
/**
 *  md5
 *
 *  @return md5的字符串
 */
- (NSString *)md5;
/**
 * 判断是否为整数
 */
- (BOOL)isNumber;

- (BOOL)isFloatNumber;

/**
 *时间戳转字符串
 */
- (NSString *)timeStrWithFormart:(NSString *)formart;

/**
 *距离现在的时分秒
 */
- (NSString *)leftTimeScinceNow;

- (NSString *)leftDays;

- (NSString *)addSecWithPhoneNum;

- (NSString *)pingjieStrWithDict:(NSMutableArray *)array;

- (NSString *)pingjieStrWithArray:(NSMutableArray *)array;

//- (NSString *)pingjieStrWithModelArray:(NSMutableArray *)array;
//
//- (NSString *)pingjieStrWithImageModelArray:(NSMutableArray *)array;
/**
 *  获得文字的高度
 *
 *  @param weidth 总宽度
 *  @param font   字体大小
 *
 *  @return 高度加偏差
 */
- (CGFloat)stringHeightWithMaxW:(CGFloat)weidth withFont:(CGFloat)font;

+(BOOL)isBlankString:(NSString *)string;

+(NSString *)getAlipayScheme;

+(NSMutableAttributedString *)changeStringColor:(NSString *)str;

//手机剩余空间
+(NSString *) freeDiskSpaceInBytes;
//手机总空间
+(NSString *) totalDiskSpaceInBytes;
//计算文件大小
+(NSString *)humanReadableStringFromBytes:(unsigned long long)byteCount;
@end
