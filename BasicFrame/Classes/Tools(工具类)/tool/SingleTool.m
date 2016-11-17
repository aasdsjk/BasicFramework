//
//  SingleTool.m
//  ttkhj-ios
//
//  Created by ning on 16/11/11.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "SingleTool.h"

@implementation SingleTool
+(instancetype)shareSingleTool{
    static SingleTool * single = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        single = [[SingleTool alloc] init];
    });
    return single;
}
@end
