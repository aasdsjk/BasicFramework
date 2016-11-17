//
//  XZDataTool.m
//  QianZhuan
//
//  Created by Lay on 16/7/28.
//  Copyright © 2016年 com.dzkj. All rights reserved.
//

#import "XZDataTool.h"
#import "NSString+MD5.h"
#import "ConmonsTool.h"
#import "XZUserModel.h"
//#import "PublicProductModel.h"
@implementation XZDataTool
//添加存储字符串
+(void)saveValue:(NSString *)value forKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:value forKey:key];
    [user synchronize];
}
+(void)saveArrayValue:(NSArray *)value forKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:value forKey:key];
    [user synchronize];
}
+(void)saveModelValue:(NSArray *)value forKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:value forKey:key];
    [user synchronize];
}
/**
 *  得到存储对象模型数组
 */
+(NSArray *)savedModelValueForKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}
//得到存储的数组
+(NSArray *)savedArrayForKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}

+(NSString *)savedStringForKey:(NSString *)key
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    return [user objectForKey:key];
}
+(void)saveUserId:(NSString *)userid
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:userid forKey:@"userid"];
    [user synchronize];
}
+(NSString *)fetchUserId
{
//    NSUserDefaults *usr = [NSUserDefaults standardUserDefaults];
//    NSString *uid = [usr objectForKey:@"userid"];
    NSString *uid = [XZUserModel sharedUserModel].uid;
    if (uid.length) {
        return uid;
    }
    return @"0";
}

+ (NSString *) sortDicToString:(NSMutableDictionary *)param{
    //排序
    NSMutableString *muString = [NSMutableString string];
    if (param) {
    NSMutableArray *stringArray = [NSMutableArray arrayWithArray:param.allKeys];
//    NSLog(@"%@",stringArray);
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:descriptor];
    
    NSArray *resultArray = [stringArray sortedArrayUsingDescriptors:descriptors];
//    NSLog(@"%@", resultArray);
    //验签
    for (int i = 0; i < [resultArray count]; i++) {
        NSString *key = [resultArray objectAtIndex:i];
        //        NSLog(@"[MCHLoginRequest getParamBySort] key = %@, value = %@", key, [param objectForKey:key]);
        //md5StrPre = [md5StrPre stringByAppendingString:[param objectForKey:key]];
        [muString appendString:[param objectForKey:key]];
//        NSLog(@"%@",muString);
    }
        
    }
    [muString appendString:BMFSINGKEY];
    NSString *md5Str = [muString md5];
    
//    [param setValue:md5Str forKey:@"md5_sign"];
//    
//    NSLog(@"[BaseNetManager] sort param = %@", param);
//    //发送的文本
//    NSData *data=[NSJSONSerialization dataWithJSONObject:param options:NSJSONWritingPrettyPrinted error:nil];
//    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    return [md5Str stringByRemovingPercentEncoding];
}
//+(void)saveAESCrypUserId:(NSString *)userid
//{
//    NSString *crypString = [AESCrypt encrypt:userid password:TTASESignKey];
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    [user setObject:crypString forKey:@"user"];
//    [user synchronize];
//}
//+(NSString *)fetchAESUserId
//{
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *crypString = [user objectForKey:@"user"];
//    NSString *decoString = [AESCrypt decrypt:crypString password:TTASESignKey];
//    return decoString;
//    
//}


@end
