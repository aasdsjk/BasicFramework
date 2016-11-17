//
//  NSString+StrCategory.h
//  FFDemo
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (StrCategory)

+(NSMutableAttributedString*)changeSameString:(NSString *)str andSearchStr:(NSString *)searchStr WithColor:(UIColor*)color;

+ (NSString *)getCacheRootDirectory;

@end
