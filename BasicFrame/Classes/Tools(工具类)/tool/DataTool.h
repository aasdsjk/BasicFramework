//
//  DataTool.h
//  FFDemo
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTool : NSObject
+(void)saveValue:(NSString *)value for:(NSString *)key;
+(void)saveArray:(NSArray *)arr for:(NSString *)key;
+(NSString *)savedValueWithKey:(NSString *)key;
+(NSArray *)savedArrayWithKey:(NSString *)key;
@end
