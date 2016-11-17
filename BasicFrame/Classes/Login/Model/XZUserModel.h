//
//  XZUserModel.h
//  大嘴鱼
//
//  Created by DianZhi on 15/8/24.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConmonsTool.h"
//#import <UMSocialCore/UMSocialCore.h>


@interface XZUserModel : NSObject<NSCoding>

NS_ASSUME_NONNULL_BEGIN

BMFSingletonH(UserModel)
/**电话*/
@property (copy, nonatomic) NSString *phone;

@property (copy, nonatomic) NSString *password;
/**登录状态*/
@property (assign, nonatomic) BOOL loginstatus;

/**用户ID*/
@property (copy, nonatomic) NSString *userid;
/**唯一标示符*/
@property (copy, nonatomic) NSString *uid;

@property (copy, nonatomic) NSString *uidTimesTamp;
/**头像地址*/
@property (copy, nonatomic) NSString *avatar;
/**昵称*/
@property (copy, nonatomic) NSString *username;
/**介绍，签名*/
@property (copy, nonatomic) NSString *signature;
/**性别*/
@property (assign, nonatomic) BMFGenderType gender;

/**二维码地址*/
@property (copy, nonatomic) NSString *qrcode;

/**真实姓名*/
@property (copy, nonatomic) NSString *realname;
/**会员状态*/
@property (copy, nonatomic) NSString *state;
/**居住省份*/
@property (copy, nonatomic) NSString *residprovince;
/**电子邮箱*/
@property (copy, nonatomic) NSString *email;
/**积分*/
@property (copy, nonatomic) NSString *points;
/**绩效积分*/
@property (copy, nonatomic) NSString *perpoints;

/**积分*/
@property (copy, nonatomic) NSString *jifen;
/**折扣*/
@property (copy, nonatomic) NSString *discount;
/**详细地址*/
@property (copy, nonatomic) NSString *residesuite;
/**市*/
@property (copy, nonatomic) NSString *residcity;
/**区*/
@property (copy, nonatomic) NSString *residcounty;
/**qq*/
@property (copy, nonatomic) NSString *qq;

/**第三方登录得到的openid*/
@property (copy, nonatomic) NSString *openid;
/**第三方平台*/
//@property (assign, nonatomic) UMSocialPlatformType platform;
/**地区ID*/
@property (copy, nonatomic) NSString *region_id;

/**当前地区名称*/
@property (copy, nonatomic) NSString *region_name;


/**当前版本*/
@property (copy, nonatomic) NSString *currentVersion;

- (NSString *)loginPlatform;

- (BOOL)canLogin;

- (BOOL)isLogin;

- (void)setUpUserModel:(XZUserModel *)model;

@end
NS_ASSUME_NONNULL_END
