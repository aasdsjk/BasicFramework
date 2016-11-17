//
//  NSString+StrCategory.m
//  FFDemo
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "NSString+StrCategory.h"

@implementation NSString (StrCategory)

+(NSMutableAttributedString*)changeSameString:(NSString *)str andSearchStr:(NSString *)searchStr WithColor:(UIColor*)color{
    
    NSRange range = [searchStr rangeOfString:str];
    
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:str];
    [mStr setAttributes:@{NSForegroundColorAttributeName:color} range:range];
    
    return mStr;
    
}

+ (NSString *)getCacheRootDirectory
{
    NSString *cache = [NSString stringWithFormat:@"%@/Library/Caches/MediasCaches", NSHomeDirectory()];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cache]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:cache
                                  withIntermediateDirectories:YES
                                                   attributes:nil
                                                        error:NULL];
    }
    return cache;
}
@end
