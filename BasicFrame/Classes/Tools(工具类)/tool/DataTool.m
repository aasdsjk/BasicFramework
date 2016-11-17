//
//  DataTool.m
//  FFDemo
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "DataTool.h"

@implementation DataTool

+(void)saveValue:(NSString *)value for:(NSString *)key{
    [[self getUserDefaults] setObject:value forKey:key];
    [[self getUserDefaults]synchronize];
}

+(void)saveArray:(NSArray *)arr for:(NSString *)key{
    [[self getUserDefaults] setObject:arr forKey:key];
    [[self getUserDefaults]synchronize];
}

+(NSString *)savedValueWithKey:(NSString *)key{
    return [[self getUserDefaults] objectForKey:key];
}

+(NSArray *)savedArrayWithKey:(NSString *)key{
    return [[self getUserDefaults] objectForKey:key];
}

+(NSUserDefaults *)getUserDefaults{
    return  [NSUserDefaults standardUserDefaults];
}



@end
