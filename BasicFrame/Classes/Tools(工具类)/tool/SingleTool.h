//
//  SingleTool.h
//  ttkhj-ios
//
//  Created by ning on 16/11/11.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleTool : NSObject

@property (nonatomic,assign) NSInteger page;
@property (nonatomic,copy) NSString *url;

@property (nonatomic,copy) NSString *headerUrl;
+(instancetype)shareSingleTool;
@end
