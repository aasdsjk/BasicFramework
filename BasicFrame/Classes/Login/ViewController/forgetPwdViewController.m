//
//  forgetPwdViewController.m
//  ttkhj-ios
//
//  Created by 古旺 on 16/11/14.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "forgetPwdViewController.h"
#import "CommonHeader.h"
#import "InputView.h"

@interface forgetPwdViewController ()
{
    InputView *userView;
    InputView *codeView;
    InputView *passView;
}
@end

@implementation forgetPwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
}

-(void)createUI{
    self.title = @"注册";
    WeakSelf;
    userView = [[InputView alloc] initWithFrame:CGRectMake(20, BMFNavigationHeight+10, BMFScreenWidth-40, 50) andLableText:@"账号" andPlaceHolder:@"请输入手机号" andStatues:0 and:1];
    codeView = [[InputView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(userView.frame), BMFScreenWidth-40, 50) andLableText:@"验证码" andPlaceHolder:@"验证码" andStatues:2 and:1];
    codeView.ForgetPassButtonOrSendCode = ^(){
        //发送验证码
        [weakSelf sendCode];
    };
    
    passView = [[InputView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(codeView.frame), BMFScreenWidth-40, 50) andLableText:@"新密码" andPlaceHolder:@"输入6~20位密码" andStatues:0 and:1];
    passView.textField.secureTextEntry = YES;

    [self.view addSubview:userView];
    [self.view addSubview:codeView];
    [self.view addSubview:passView];
    
    UIButton *findPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    findPwdBtn.backgroundColor = NAVOrange;
    findPwdBtn.tag = 200;
    [findPwdBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [findPwdBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [findPwdBtn addTarget:self action:@selector(findPwdButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:findPwdBtn];
    
    [findPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passView.mas_bottom).offset(10);
        make.left.equalTo(passView);
        make.width.equalTo(passView);
        make.height.equalTo(@40);
    }];
}

//发送验证码
-(void)sendCode{
    if (!userView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入手机号"];
        return;
    }
    
    [self sendRequestWithUrlStr:[RequestTools sendPhoneCodeWithOp:@"findpwd" withPhone:userView.textField.text andWithUid:nil] success:^(id  _Nullable json) {
        @try {
            if (RequestSuccess) {
                [XZToastTool showToast:self.view msg:json[@"msg"]];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
        } @finally {
            
        }
    } failure:^(NSError *error) {
        RequestFailure;
    }];
}

- (void)findPwdButtonClick:(UIButton *)btn {
    if (!userView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入手机号"];
        return;
    }
    
    if (!codeView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入验证码"];
        return;
    }
    if (!passView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入新密码"];
        return;
    }
    //找回密码
//    [self sendRequestWithUrlStr:[RequestTools ] success:^(id  _Nullable json) {
//    
//} failure:^(NSError *error) {
//    
//}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
