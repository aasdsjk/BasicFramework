//
//  XZToastTool.m
//  QianZhuan
//
//  Created by Lay on 16/8/8.
//  Copyright © 2016年 com.dzkj. All rights reserved.
//

#import "XZToastTool.h"
#import "MBProgressHUD.h"

@implementation XZToastTool
+(void)showToast:(UIView *)selfuv msg:(NSString *)msg
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:selfuv animated:YES];
    hud.mode = MBProgressHUDModeText;
//    hud.labelText = msg;
    hud.detailsLabelText = msg;
    hud.margin = 10.f;
    hud.yOffset = 90.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}
+(void)showToastmsg:(NSString *)msg
{
    MBProgressHUD *hud = [MBProgressHUD new];
    [hud show:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.margin = 10.f;
    hud.yOffset = 90.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}



@end
