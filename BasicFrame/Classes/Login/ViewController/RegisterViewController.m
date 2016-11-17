//
//  RegisterViewController.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "RegisterViewController.h"
#import "CommonHeader.h"
#import "InputView.h"

@interface RegisterViewController ()
{
    InputView *userView;
    InputView *codeView;
    InputView *passView;
    InputView *againPassView;
    UIButton *agreeButton;
}
@end

@implementation RegisterViewController

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
    
    passView = [[InputView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(codeView.frame), BMFScreenWidth-40, 50) andLableText:@"设置密码" andPlaceHolder:@"输入6~20位密码" andStatues:0 and:1];
    passView.textField.secureTextEntry = YES;
    againPassView = [[InputView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(passView.frame), BMFScreenWidth-40, 50) andLableText:@"确认密码" andPlaceHolder:@"请确认密码" andStatues:0 and:1];
    againPassView.textField.secureTextEntry = YES;
    [self.view addSubview:userView];
    [self.view addSubview:codeView];
    [self.view addSubview:passView];
    [self.view addSubview:againPassView];
    
    
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [agreeBtn setImage:[UIImage imageNamed:@"choose_11"] forState:UIControlStateNormal];
    [agreeBtn setImage:[UIImage imageNamed:@"choose_07"] forState:UIControlStateSelected];
    [agreeBtn addTarget:self action:@selector(agreeButtonSelected) forControlEvents:UIControlEventTouchUpInside];
    agreeButton = agreeBtn;
    agreeButton.selected = YES;
    [self.view addSubview:agreeBtn];
    
    UILabel *agreeLable = [[UILabel alloc] init];
    agreeLable.font = [UIFont systemFontOfSize:12.0];
    agreeLable.text = @"我已阅读并同意";
    agreeLable.textColor = [UIColor grayColor];
    [self.view addSubview:agreeLable];
    
    UIButton *serverBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [serverBtn setTitle:@"天天看韩剧服务协议" forState:UIControlStateNormal];
    [serverBtn setTitleColor:NAVOrange forState:UIControlStateNormal];
    serverBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [serverBtn addTarget:self action:@selector(serverButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:serverBtn];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = NAVOrange;
    loginBtn.tag = 200;
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(againPassView.mas_bottom).offset(5);
        make.left.equalTo(userView);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    [agreeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(agreeBtn);
        make.left.equalTo(agreeBtn.mas_right).offset(10);
        make.width.equalTo(@90);
        make.height.equalTo(agreeBtn);
    }];
    
    [serverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(agreeBtn);
        make.left.equalTo(agreeLable.mas_right);
        make.width.equalTo(@120);
        make.height.equalTo(agreeBtn);
    }];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(serverBtn.mas_bottom).offset(10);
        make.left.equalTo(userView);
        make.width.equalTo(userView);
        make.height.equalTo(@40);
    }];
    
}



//发送验证码
-(void)sendCode{
    if (!userView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入手机号"];
        return;
    }
    
    [self sendRequestWithUrlStr:[RequestTools sendPhoneCodeWithOp:@"reg" withPhone:userView.textField.text andWithUid:nil] success:^(id  _Nullable json) {
        @try {
            if (RequestSuccess) {
                ShowMsg;
                [codeView changeCodeBtn];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@",exception);
        } @finally {
            
        }
    } failure:^(NSError *error) {
        RequestFailure;
    }];
}
//注册
-(void)loginButtonClick:(UIButton *)sender{
    if (!userView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入手机号"];
        return;
    }
    
    if (!codeView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入验证码"];
        return;
    }
    if (!passView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入密码"];
        return;
    }
    if (!againPassView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入确认密码"];
        return;
    }
    if (![passView.textField.text isEqualToString:againPassView.textField.text]) {
        [XZToastTool showToast:self.view msg:@"两次密码输入不一致"];
        return;
    }
    if (!agreeButton.selected) {
        [XZToastTool showToast:self.view msg:@"请同意服务协议"];
        return;
    }
    [self sendRequestWithUrlStr:[RequestTools registerWithOp:@"phone_reg" withPhone:userView.textField.text withPwd:passView.textField.text withCode:codeView.textField.text withDevice_type:[[UIDevice currentDevice] model]] success:^(id  _Nullable json) {
        @try {
            if (RequestSuccess) {
                NSLog(@"%@",json[@"data"]);
                ShowMsg;
            }
        } @catch (NSException *exception) {
            Exception;
        } @finally {
            
        }
        
    } failure:^(NSError *error) {
        RequestFailure;
    }];
    
    
}
//同意协议
-(void)agreeButtonSelected{
    agreeButton.selected = !agreeButton.selected;
    
}
//服务协议点击
-(void)serverButton{
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [userView.textField resignFirstResponder];
    [passView.textField resignFirstResponder];
    [codeView.textField resignFirstResponder];
    [againPassView.textField resignFirstResponder];
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
