//
//  XZUserModel.m
//  大嘴鱼
//
//  Created by DianZhi on 15/8/24.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import "XZUserModel.h"
#import "MJExtension.h"
@implementation XZUserModel

BMFSingletonM(UserModel)


+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"userid": @"id"};
}

- (void)encodeWithCoder:(NSCoder *)enCoder {
    [enCoder encodeObject:self.phone forKey:@"phone"];
    [enCoder encodeObject:self.password forKey:@"password"];
    [enCoder encodeBool:self.loginstatus forKey:@"loginstatus"];
    [enCoder encodeObject:self.openid forKey:@"openid"];
//    [enCoder encodeInt:self.platform forKey:@"platfrom"];
    [enCoder encodeObject:self.uid forKey:@"uid"];
    [enCoder encodeObject:self.uidTimesTamp forKey:@"uidTimesTamp"];
    [enCoder encodeObject:self.currentVersion forKey:@"version"];
    [enCoder encodeObject:self.region_id forKey:@"region_id"];
    [enCoder encodeObject:self.region_name forKey:@"region_name"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.phone          = [decoder decodeObjectForKey:@"phone"];
        self.password       = [decoder decodeObjectForKey:@"password"];
        self.loginstatus    = [decoder decodeBoolForKey:@"loginstatus"];
        self.openid         = [decoder decodeObjectForKey:@"openid"];
//        self.platform       = [decoder decodeIntForKey:@"platfrom"];
        self.uid            = [decoder decodeObjectForKey:@"uid"];
        self.uidTimesTamp   = [decoder decodeObjectForKey:@"uidTimesTamp"];
        self.currentVersion = [decoder decodeObjectForKey:@"version"];
        self.region_id      = [decoder decodeObjectForKey:@"region_id"];
        self.region_name    = [decoder decodeObjectForKey:@"region_name"];
    }
    return self;
}

- (NSString *)loginPlatform {
   
       /* switch (self.platform) {
            case UMSocialPlatformType_WechatTimeLine:
            case UMSocialPlatformType_WechatSession:
                return @"wx";
                break;
            case UMSocialPlatformType_Sina :
                return @"wb";
                break;
            case UMSocialPlatformType_QQ:
            case UMSocialPlatformType_Qzone:
                return @"qq";
                break;
            default:
                return nil;
                break;
        }
        return nil;*/
    return nil;
    
}
 

- (BOOL)canLogin {
    return ((self.password.length ||self.openid.length ) && self.phone.length && self.loginstatus);
}

- (BOOL)isLogin {
    return self.userid.length && self.loginstatus;
}

- (void)setUpUserModel:(XZUserModel *)model{
    XZUserModel *standModel = [XZUserModel sharedUserModel];
    standModel.phone = model.phone;
    standModel.password = model.password;
    standModel.userid = [NSString stringWithFormat:@"%@",model.uid];
    standModel.loginstatus = model.loginstatus;
}

@end
