//
//  XZDataTool.h
//  QianZhuan
//
//  Created by Lay on 16/7/28.
//  Copyright © 2016年 com.dzkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZDataTool : NSObject
+(void)saveUserId:(NSString *)userid;
+(NSString *)fetchUserId;
/**
 *  存储字符串
 */
+(void)saveValue:(NSString *)value forKey:(NSString *)key;
/**
 *  读取字符串
 */
+(NSString *)savedStringForKey:(NSString *)key;
/**
 *  存储对象模型数组
 */
+(void)saveModelValue:(NSArray *)value forKey:(NSString *)key;
/**
 *  得到存储对象模型数组
 */
+(NSArray *)savedModelValueForKey:(NSString *)key;
/**
 *  存储数组
 */
+(void)saveArrayValue:(NSArray *)value forKey:(NSString *)key;
/**
 *  得到存储的数组
 */

+(NSArray *)savedArrayForKey:(NSString *)key;
+ (NSString *) sortDicToString:(NSMutableDictionary *)param;
@end
