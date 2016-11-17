//
//  UserInfoTool.h
//  ttkhj
//
//  Created by ning on 16/10/26.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class XZUserModel;
@interface UserInfoTool : NSObject
+ (void)saveUserInfo:(XZUserModel *)user;

+ (XZUserModel *)loadUser;

@end
