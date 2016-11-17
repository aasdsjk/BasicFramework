//
//  ConmonsTool.h
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  单例模式
 */
// .h文件
#define BMFSingletonH(name) + (instancetype)shared##name;

// .m文件
#define BMFSingletonM(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

/*
 日志输出
 */
#ifdef DEBUG
#define BMFLog(...) NSLog(__VA_ARGS__)
#else
#define BMFLog(...)
#endif

#define BMFData(...) [NSString stringWithFormat:@"data[%@]",(__VA_ARGS__)]

#define RequestSuccess ([json[@"status"] intValue] == 1 && [json[@"msg"] isEqualToString:@"success"])
#define ShowMsg [XZToastTool showToast:self.view msg:json[@"msg"]]
#define Exception  NSLog(@"%@",exception)
#define RequestFailure [XZToastTool showToast:self.view msg:@"网络异常"]

//#define SingleRefresh [SingleTool shareSingleTool]

#define BMFColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BMFColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define NAVOrange BMFColor(266,120,0)

#define kBMFOrange BMFColor(246,170,0)
#define kBMFGreen BMFColor(101,160,49)
#define kBMFYellow BMFColor(255,220,0)
#define KBMFNavigationBarColor BMFColor(255,231,66)
#define kBMFBackGroundGray BMFColor(238,238,238)
#define kBMFLightWhite BMFColor(204,204,204)
#define kBMFDarkWhite BMFColor(153,153,153)
#define kBMFLightGray BMFColor(102,102,102)
#define kBMFDarkGray BMFColor(51,51,51)
#define KBMFMAINCOLOR BMFColor(96,43,0)
#define KBMFBUTTONORBGCOLOR BMFColor(237,112,49)
#define KBMFBUTTONBLBGCOLOR BMFColor(57,149,249)
#define KBMFBUTTONBLBGCOLOR BMFColor(57,149,249)
#define KBMFBUTTONBORDERCOLOR [UIColor colorWithWhite:0.6 alpha:0.7]
#define KBMFNavigationTintColor BMFColor(121,59,2)

#define kBannerHeight self.isFromGoodDetail ? [UIScreen mainScreen].bounds.size.width : 120
#define kOptionHeight 170

#define BMFScreenHeight [UIScreen mainScreen].bounds.size.height
#define BMFScreenWidth [UIScreen mainScreen].bounds.size.width

// 弱引用
#define WeakSelf __weak typeof(self) weakSelf = self;

#define CS(x) @property (nonatomic,copy)NSString *x



#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iOS9 ([[UIDevice currentDevice].systemVersion floatValue] >= 9.0)



//键盘类型
typedef enum {
    BMFTextFieldKeyboardTypeDefault,
    BMFTextFieldKeyboardTypeNumber,
    BMFTextFieldKeyboardTypePicker,
    BMFTextFieldKeyboardTypeTextView
}BMFTextFieldKeyboardType;

/**
 *  平台类型
 */
typedef NS_ENUM(NSUInteger, XZPlatformType){
    
    /**
     *  未知
     */
    XZPlatformTypeUnknown             = 0,
    /**
     *  新浪微博
     */
    XZPlatformTypeSinaWeibo           = 1,
    /**
     *  腾讯微博
     */
    XZPlatformTypeTencentWeibo        = 2,
    /**
     *  豆瓣
     */
    XZPlatformTypeDouBan              = 5,
    /**
     *  QQ空间
     */
    XZPlatformSubTypeQZone            = 6,
    /**
     *  人人网
     */
    XZPlatformTypeRenren              = 7,
    /**
     *  开心网
     */
    XZPlatformTypeKaixin              = 8,
    /**
     *  Facebook
     */
    XZPlatformTypeFacebook            = 10,
    /**
     *  Twitter
     */
    XZPlatformTypeTwitter             = 11,
    /**
     *  印象笔记
     */
    XZPlatformTypeYinXiang            = 12,
    /**
     *  Google+
     */
    XZPlatformTypeGooglePlus          = 14,
    /**
     *  Instagram
     */
    XZPlatformTypeInstagram           = 15,
    /**
     *  LinkedIn
     */
    XZPlatformTypeLinkedIn            = 16,
    /**
     *  Tumblr
     */
    XZPlatformTypeTumblr              = 17,
    /**
     *  邮件
     */
    XZPlatformTypeMail                = 18,
    /**
     *  短信
     */
    XZPlatformTypeSMS                 = 19,
    /**
     *  打印
     */
    XZPlatformTypePrint               = 20,
    /**
     *  拷贝
     */
    XZPlatformTypeCopy                = 21,
    /**
     *  微信好友
     */
    XZPlatformSubTypeWechatSession    = 22,
    /**
     *  微信朋友圈
     */
    XZPlatformSubTypeWechatTimeline   = 23,
    /**
     *  QQ好友
     */
    XZPlatformSubTypeQQFriend         = 24,
    /**
     *  Instapaper
     */
    XZPlatformTypeInstapaper          = 25,
    /**
     *  Pocket
     */
    XZPlatformTypePocket              = 26,
    /**
     *  有道云笔记
     */
    XZPlatformTypeYouDaoNote          = 27,
    /**
     *  Pinterest
     */
    XZPlatformTypePinterest           = 30,
    /**
     *  Flickr
     */
    XZPlatformTypeFlickr              = 34,
    /**
     *  Dropbox
     */
    XZPlatformTypeDropbox             = 35,
    /**
     *  VKontakte
     */
    XZPlatformTypeVKontakte           = 36,
    /**
     *  微信收藏
     */
    XZPlatformSubTypeWechatFav        = 37,
    /**
     *  易信好友
     */
    XZPlatformSubTypeYiXinSession     = 38,
    /**
     *  易信朋友圈
     */
    XZPlatformSubTypeYiXinTimeline    = 39,
    /**
     *  易信收藏
     */
    XZPlatformSubTypeYiXinFav         = 40,
    /**
     *  明道
     */
    XZPlatformTypeMingDao             = 41,
    /**
     *  Line
     */
    XZPlatformTypeLine                = 42,
    /**
     *  WhatsApp
     */
    XZPlatformTypeWhatsApp            = 43,
    /**
     *  KaKao Talk
     */
    XZPlatformSubTypeKakaoTalk        = 44,
    /**
     *  KaKao Story
     */
    XZPlatformSubTypeKakaoStory       = 45,
    /**
     *  Facebook Messenger
     */
    XZPlatformTypeFacebookMessenger   = 46,
    /**
     *  支付宝好友
     */
    XZPlatformTypeAliPaySocial        = 50,
    /**
     *  易信
     */
    XZPlatformTypeYiXin               = 994,
    /**
     *  KaKao
     */
    XZPlatformTypeKakao               = 995,
    /**
     *  印象笔记国际版
     */
    XZPlatformTypeEvernote            = 996,
    /**
     *  微信平台,
     */
    XZPlatformTypeWechat              = 997,
    /**
     *  QQ平台
     */
    XZPlatformTypeQQ                  = 998,
    /**
     *  任意平台
     */
    XZPlatformTypeAny                 = 999
};


/**
 *  授权类型
 */
typedef NS_ENUM(NSUInteger, XZCredentialType){
    /**
     *  未知
     */
    XZCredentialTypeUnknown = 0,
    /**
     *  OAuth 1.x
     */
    XZCredentialTypeOAuth1x = 1,
    /**
     *  OAuth 2
     */
    XZCredentialTypeOAuth2  = 2,
};

//性别
typedef enum {
    BMFGenderTypeMale = 1, //男
    BMFGenderTypeFemale = 2 //女
}BMFGenderType;


//支付类型
typedef enum {
    BMFMyOrderPayMentWeChat = 0,
    BMFMyOrderPayMentYuE = 1,
    BMFMyOrderPayMentAliPay = 2,
    BMFMyOrderPayMentGiftCard = 3
}BMFMyOrderPayMent;

//退款状态
typedef NS_ENUM(NSInteger, XZBackMoneyStatus) {
    XZBackMoneyCancel = -1, //
    XZBackMoneyApplying = 0, //
    XZBackMoneyRefuse = 2,
    XZBackMoneyWaitForSendOut = 3,
    XZBackMoneyWaitForGet = 4,
    XZBackMoneyFinish = 5
};


UIKIT_EXTERN CGFloat const BMFNavigationHeight;
UIKIT_EXTERN CGFloat const BMFMargin;
UIKIT_EXTERN CGFloat const  BMFGoodImgwhScare;
UIKIT_EXTERN CGFloat const  BMFCellDefaultHeight;
UIKIT_EXTERN CGFloat const BMFStatusBarHeight;
UIKIT_EXTERN CGFloat const BMFTabbarHeight;

/**
 *  价格显示的小数位数
 */
UIKIT_EXTERN short const BMFPriceDigit;

UIKIT_EXTERN NSString *const BMFPayKey;
UIKIT_EXTERN NSString *const BMFDidChangeFruitNumberNotification;
UIKIT_EXTERN NSString *const BMFDidChangeFruitNumber;
UIKIT_EXTERN NSString *const BMFDidChangeFruitModel;
UIKIT_EXTERN NSString *const BMFServerUrlStr;
UIKIT_EXTERN NSString *const BMFGoodDetailUrl;
UIKIT_EXTERN NSString *const BMFSociUrl;
UIKIT_EXTERN NSString *const BMFServiceUrl;
UIKIT_EXTERN NSString *const BMFAboutUsUrl;
UIKIT_EXTERN NSString *const BMFApplyUrl;
UIKIT_EXTERN NSString *const BMFUserFaceServer;
UIKIT_EXTERN NSString *const BMFAliPayPartner;
UIKIT_EXTERN NSString *const BMFAliPayOpenKey;
UIKIT_EXTERN NSString *const BMFAliPayprivateKey;
UIKIT_EXTERN NSString *const BMFAliPaySeller;
UIKIT_EXTERN NSString *const BMFAlipayNotiUrl;
UIKIT_EXTERN NSString *const BMFPayResultUrl;
UIKIT_EXTERN NSString *const BMFShareGoodsDetailUrl;
UIKIT_EXTERN NSString *const BMFGroupBuyShareUrl;
UIKIT_EXTERN NSString *const BMFActivityDetailUrl;

UIKIT_EXTERN NSString *const BMFDidClickTextFieldButton;
UIKIT_EXTERN NSString *const BMFTextFieldButtonTitle;

UIKIT_EXTERN NSString *const BMFGoodDetailDidChangePackNotification;
UIKIT_EXTERN NSString *const BMFGoodDetailChangePack;

UIKIT_EXTERN NSString *const BMFMinePurseButtonClickNotification;
UIKIT_EXTERN NSString *const BMFMinePurseButtonModel;



UIKIT_EXTERN NSString *const BMFPaySuccessNotification;
UIKIT_EXTERN NSString *const BMFBalanceBtnClickNotification;
UIKIT_EXTERN NSString *const BMFGiftCardBtnClickNotification;

UIKIT_EXTERN NSString *const XZMineOrderButtonClickNotification;
UIKIT_EXTERN NSString *const XZMineOrderButtonModel;

UIKIT_EXTERN NSString *const XZConfirmPayBtnClickNotification;
UIKIT_EXTERN NSString *const XZConfirmPayBtnModel;

UIKIT_EXTERN NSString *const XZCancelOrderBtnClickNotification;
UIKIT_EXTERN NSString *const XZCancelOrderBtnModel;

UIKIT_EXTERN NSString *const BMFMethod;
UIKIT_EXTERN NSString *const BMFUserid;

UIKIT_EXTERN NSString *const BMFNetError;

UIKIT_EXTERN NSString *const BMFTicket;
UIKIT_EXTERN NSString *const BMFAPPID;
UIKIT_EXTERN NSString *const BMFPT;
UIKIT_EXTERN NSString *const BMFSINGKEY;
UIKIT_EXTERN NSString *const BMFBASEURL;
UIKIT_EXTERN NSString *const BMFRECENTSEARCH;

