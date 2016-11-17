//
//  UserInfoTool.m
//  ttkhj
//
//  Created by ning on 16/10/26.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "UserInfoTool.h"
#define XZUserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"User.archive"]
@implementation UserInfoTool
+ (void)saveUserInfo:(XZUserModel *)user
{
    // 自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:user toFile:XZUserPath];
}

+ (XZUserModel *)loadUser {
    
    XZUserModel *user = [NSKeyedUnarchiver unarchiveObjectWithFile:XZUserPath];
    
    
    return user;
    
}
@end
