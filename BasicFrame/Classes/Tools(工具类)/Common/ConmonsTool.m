//
//  ConmonsTool.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "ConmonsTool.h"



CGFloat const BMFNavigationHeight = 64;
CGFloat const BMFMargin = 10;
CGFloat const BMFStatusBarHeight = 20.0;
CGFloat const BMFCellDefaultHeight = 44.0;
CGFloat const BMFGoodImgwhScare = 300.0/710.0;
short const BMFPriceDigit = 2;
CGFloat const BMFTabbarHeight = 50;

NSString *const BMFPayKey = @"9216148725112dca5df86c3fa682fdzy";
NSString *const BMFDebugUrl = @"http://testapi.dzy.cn/index.php";
NSString *const BMFProductUrl = @"http://api.dzy.cn/index.php";
NSString *const BMFServerUrlStr = @"http://testapi.dzy.cn/index.php";
NSString *const BMFGoodDetailUrl = @"http://m.dzy.cn/index.php/Open/getDetails/goods_id/";
NSString *const BMFUserFaceServer = @"http://api.dzy.cn/index.php/Uploads/getImages.html";
NSString *const BMFSociUrl = @"http://buluo.qq.com/share/index.html?url=http%3A%2F%2Fbuluo.qq.com%2Fmobile%2Fbarindex.html%3F_bid%3D128%26_wv%3D1027%26bid%3D235271";
NSString *const BMFApplyUrl = @"http://m.dzy.cn/index.php/public/shoperdzy.html";
NSString *const BMFServiceUrl = @"http://m.dzy.cn/index.php/public/seversdzy.html";
NSString *const BMFAboutUsUrl = @"http://m.dzy.cn/index.php/public/about.html";
NSString *const BMFAlipayNotiUrl = @"http://m.dzy.cn/index.php/Pays/getalipay";
NSString *const BMFPayResultUrl = @"http://m.dzy.cn/index.php/Pays/getresult";
NSString *const BMFShareGoodsDetailUrl = @"http://m.dzy.cn/index.php/item/index/goods_id/";
NSString *const BMFActivityDetailUrl = @"http://m.dzy.cn/index.php/Open/getDetailImg/goods_id/";

NSString *const BMFAliPayPartner = @"2088911146284754";
NSString *const BMFAliPayOpenKey = @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDrE8pIwfCDruDoydDpUIUDM+LB ZXOLg8Zh+qqZySkgcJFKtmDjSG6ZCU0USICfFfrFbXeUuCJrle+Buug36dpIGX90 Y0KGLsiKxbjirHAbmuq/gJv+4x4jsoe/OWnIS+3v+rg2Vld7ztIYwp01BcMwm618 Ra7+e7CChZhMGNWvvwIDAQAB";
NSString *const BMFAliPayprivateKey = @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBANb7NuvlICsQc4RW2kuxYBlYE7aEENNHUR0AMtStyajaOBed+Nc8MHjdDt3lxbdDgbmG/tUjwZfxH1mKw2JLlglMHDEwzR6JfZkzTcJ4ciYGGLa+Y3fqOKILNkDj6bAVzG7siOvuAZ4MFNCJbC/zVhs+AApWkwOXq0SCWLWMIkqxAgMBAAECgYATI/zI1faePvG6B62Z7an7t67RokKJPSFIrrrX2r1Irl0uJR+Bslcye6QWN5356iXDqfRIb82NxKcg5szslIRAF+GVtuvO2yfDBZQBkQn04iQ3Pj41wpHgqsfCpXIlvUKZU9kLnT6GA4Gmychcb5BGS5znMbEFIqV9iXlCxl00fQJBAO74jm+nFOJJ/Kr1CK+Cx4C08iekgmSt0EDJM5jXr+ezCpqn+5e7HTR8fcUzhzpY0vARUrwcbfnTrexgagY0IFMCQQDmTQahqyihE30PhMSenkuFCM1Mqwpe/l79WA/ULtxzDZBvyKgb6wQyeJcO19JGGSXprG7sXXPkicsEDnvjSxhrAkBe7doXPHYtVlrKxsAGiJsb48V2PgGWYP2jXsniY3v7PMJvoV9ubOQzH2kO12NWqEZTG26UT27YmWAz0DEN+dMFAkA7eNCplyWa0wmMpGCSBZbC+A7sKY84EMA+9CrCRIexPmN6OnsPGpWu4u0/bARlDcF4oorShx+SePLwTT046P+ZAkEAkZ7U4s6vagyZXYopBTyT4osclFhZfAWfX9WrqQ2jtUwn9BtEEVRhlorZJ6eZze05mfu8fdrRd0ZzdpfOf+t1kA==";

NSString *const BMFAliPaySeller = @"love1053346786@126.com";

NSString *const BMFDidClickTextFieldButton = @"BMFDidClickTextFieldButton";
NSString *const BMFTextFieldButtonTitle = @"BMFTextFieldButtonTitle";

NSString *const BMFGroupBuyShareUrl = @"http://testm.dzy.cn/index.php/pack/details/bindid/";

NSString *const BMFGoodDetailDidChangePackNotification = @"BMFGoodDetailDidChangePackNotification";
NSString *const BMFGoodDetailChangePack = @"BMFGoodDetailChangePack";

NSString *const BMFMinePurseButtonClickNotification = @"BMFMinePurseButtonClickNotification";
NSString *const BMFMinePurseButtonModel = @"BMFMinePurseButtonModel";



NSString *const BMFPaySuccessNotification = @"BMFPaySuccessNotification";

NSString *const BMFBalanceBtnClickNotification = @"BMFBalanceBtnClickNotification";
NSString *const BMFGiftCardBtnClickNotification = @"BMFGiftCardBtnClickNotification";

NSString *const XZMineOrderButtonClickNotification = @"XZMineOrderButtonClickNotification";
NSString *const XZMineOrderButtonModel = @"XZMineOrderButtonModel";

NSString *const XZConfirmPayBtnClickNotification = @"XZConfirmPayBtnClickNotification";
NSString *const XZConfirmPayBtnModel = @"XZConfirmPayBtnModel";

NSString *const XZCancelOrderBtnClickNotification = @"XZCancelOrderBtnClickNotification";
NSString *const XZCancelOrderBtnModel = @"XZConfirmPayBtnModel";

NSString *const BMFMethod = @"method";
NSString *const BMFUserid = @"data[userid]";

NSString *const BMFNetError = @"网络繁忙，请稍后再试";
NSString *const BMFAPPID = @"0";
NSString *const BMFPT = @"2";
NSString *const BMFSINGKEY = @"!xz9hr#)(*&^&)@ZCVF3gv";
NSString *const BMFBASEURL = @"http://a.ttkhj.3z.cc/";

NSString *const BMFRECENTSEARCH = @"XZ_RecentSearch";

//发布单图上传
NSString *const XZUploadSinglePic = @"http://img.xz.3z.cc/app/upic.php?";

//三张以上图片上传
NSString *const XZUploadThreeMorePic = @"http://img.xz.3z.cc/app/ugoods.php?";

