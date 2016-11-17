//
//  XZBaseUrlTool.m
//  QianZhuan
//
//  Created by Lay on 16/7/28.
//  Copyright © 2016年 com.dzkj. All rights reserved.
//

#import "XZBaseUrlTool.h"
#import "XZDataTool.h"
#import <AdSupport/AdSupport.h>
#import "ConmonsTool.h"
#import "NSString+Extension.h"

#define UIDKEY @"uid"
#define APPIDKEY @"appid"
#define IMEIKEY @"imei"
#define VERKEY @"ver"
#define TKEY @"t"
#define PTKEY @"pt"
@interface XZBaseUrlTool()

@end

@implementation XZBaseUrlTool



+ (NSString *)publicCapictyAndSignDict:(NSMutableDictionary *)dict
{
    NSString *uid   = [XZDataTool fetchUserId];
    NSString *appid = BMFAPPID;
    NSString *imei  = [self imei];
    NSString *pt    = BMFPT;
    NSString *ver   = [self appver];
    NSString *t     = [self nowtime];
    
    NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mudict setObject:uid forKey:UIDKEY];
    [mudict setObject:appid forKey:APPIDKEY];
    [mudict setObject:imei forKey:IMEIKEY];
    [mudict setObject:ver forKey:VERKEY];
    [mudict setObject:t forKey:TKEY];
    [mudict setObject:pt forKey:PTKEY];
    NSString *singstr = [XZDataTool sortDicToString:mudict];
    
    NSString *currentstr = [NSString stringWithFormat:@"uid=%@&appid=%@&imei=%@&pt=%@&ver=%@&t=%@&sign=%@",uid,appid,imei,pt,ver,t,singstr];
    return [currentstr stringByRemovingPercentEncoding];
}


+ (NSString *)nowtime
{
    NSDate *datenow = [NSDate date];
    NSString *time = [NSString stringWithFormat:@"%ld",(long)[datenow timeIntervalSince1970]];
    return time;
}

+ (NSString*)appver
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)imei
{
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

@end
