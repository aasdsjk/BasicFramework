//
//  LoginViewController.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "LoginViewController.h"
#import "CommonHeader.h"
#import "InputView.h"
#import "RegisterViewController.h"
#import "forgetPwdViewController.h"
#import "XZUserModel.h"
#import "UserInfoTool.h"
#import "BasicFrame-Swift.h"
@interface LoginViewController ()
{
    
    InputView *userView;
    InputView *passView;
}

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    [self createUI];
    
    
    
}
-(void)createUI{
    self.title = @"登录";
    WeakSelf
    userView = [[InputView alloc] initWithFrame:CGRectMake(20, BMFNavigationHeight+10, BMFScreenWidth-40, 50) andLableText:@"账号" andPlaceHolder:@"请输入手机号" andStatues:0 and:0];
    passView = [[InputView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(userView.frame), BMFScreenWidth-40, 50) andLableText:@"密码" andPlaceHolder:@"请输入密码" andStatues:1 and:0];
    passView.textField.secureTextEntry = YES;
    passView.ForgetPassButtonOrSendCode = ^(){
        [weakSelf forgetPassWord];
    };
    [self.view addSubview:userView];
    [self.view addSubview:passView];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.backgroundColor = NAVOrange;
    loginBtn.tag = 200;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.backgroundColor = NAVOrange;
    registerBtn.tag = 201;
    [registerBtn setTitle:@"手机号注册" forState:UIControlStateNormal];
    [registerBtn addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [registerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:registerBtn];
    
    //分割线
    UILabel *leftCarve = [[UILabel alloc] init];
    leftCarve.backgroundColor = [UIColor grayColor];
    
    UILabel *rightCarve = [[UILabel alloc] init];
    rightCarve.backgroundColor = [UIColor grayColor];
    
    //三方登录
    UILabel *thirdLable = [[UILabel alloc] init];
    thirdLable.text = @"或通过以下方式登录";
    thirdLable.font = [UIFont systemFontOfSize:11.0];
    thirdLable.textColor = [UIColor grayColor];
    thirdLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:thirdLable];
    [self.view addSubview:leftCarve];
    [self.view addSubview:rightCarve];
    
    
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passView.mas_bottom).offset(10);
        make.left.equalTo(userView);
        make.width.equalTo(userView);
        make.height.equalTo(@40);
    }];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
        make.left.equalTo(userView);
        make.width.equalTo(userView);
        make.height.equalTo(loginBtn);
    }];
    
    [thirdLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(registerBtn.mas_bottom).offset(30);
        make.height.equalTo(@20);
        make.width.equalTo(@120);
    }];
    
    [leftCarve mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(thirdLable);
        make.left.equalTo(registerBtn);
        make.right.equalTo(thirdLable.mas_left).offset(-5);
        make.height.equalTo(@0.5);
    }];
    [rightCarve mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(thirdLable);
        make.left.equalTo(thirdLable.mas_right).offset(5);
        make.right.equalTo(registerBtn);
        make.height.equalTo(@0.5);
    }];
    //上方登录按钮
    NSArray *imageArr = @[@"log02_09",@"log02_07",@"log02_11"];
    NSArray *titles = @[@"QQ登录",@"微信登录",@"微博登录"];
    for (int i=0; i<3; i++) {
        BtnView *thirdBtn = [BtnView buttonWithType:UIButtonTypeCustom];
//        thirdBtn.frame = CGRectMake(50+i*(BMFScreenWidth-140/3+20), CGRectGetMaxY(thirdLable.frame)+30, (BMFScreenWidth-140/3), 80);
        [thirdBtn imageRectForContentRect:thirdBtn.frame];
        [thirdBtn titleRectForContentRect:thirdBtn.frame];
        [thirdBtn setTitle:titles[i] forState:UIControlStateNormal];
        [thirdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [thirdBtn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
        thirdBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        thirdBtn.tag = 100+i;
        [thirdBtn addTarget:self action:@selector(thirdPartyLogin:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:thirdBtn];
    }
    
    UIButton *qqBtn = [self.view viewWithTag:100];
    UIButton *weChatBtn = [self.view viewWithTag:101];
    UIButton *weiboBtn = [self.view viewWithTag:102];
    [weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(thirdLable.mas_bottom).offset(30);
        make.width.equalTo(@90);
        make.height.equalTo(@100);
    }];
    
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weChatBtn);
        make.right.equalTo(weChatBtn.mas_left).offset(-20);
        make.width.equalTo(weChatBtn);
        make.height.equalTo(weChatBtn);
    }];
    [weiboBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weChatBtn);
        make.left.equalTo(weChatBtn.mas_right).offset(20);
        make.width.equalTo(weChatBtn);
        make.height.equalTo(weChatBtn);
    }];
}
-(void)loginButtonClick:(UIButton*)btn{
    if (btn.tag==200) {
        //登录
        [self loginRequest];
    }else{
        //注册
        RegisterViewController *registerVC = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:registerVC animated:YES];
    }
    
}
-(void)forgetPassWord{
    forgetPwdViewController *fpvc = [[forgetPwdViewController alloc]init];
    [self.navigationController pushViewController:fpvc animated:YES];
}


-(void)thirdPartyLogin:(UIButton*)sender{
    switch (sender.tag) {
        case 100:
            //qq登录
            break;
        case 101:
            //微信登录
            break;
        case 102:
            //微博登录
            break;
        default:
            break;
    }
}

-(void)loginRequest{
    if (!userView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入手机号"];
        return;
    }
    if (!passView.textField.text.length) {
        [XZToastTool showToast:self.view msg:@"请输入密码"];
        return;
    }
    
    [self sendRequestWithUrlStr:[RequestTools loginWithOp:@"login" withPhone:userView.textField.text withPwd:passView.textField.text] success:^(id  _Nullable json) {
        @try {
            if (RequestSuccess) {
                
                NSLog(@"%@",json[@"data"]);
                XZUserModel *model = [XZUserModel mj_objectWithKeyValues:json[@"data"]];
                model.phone = userView.textField.text;
                model.password = passView.textField.text;
                model.uid = [json[@"data"] objectForKey:@"uid"];
                model.loginstatus = YES;
                
                [[XZUserModel sharedUserModel] setUpUserModel:model];
                
                [UserInfoTool saveUserInfo:model];
            }
        } @catch (NSException *exception) {
            Exception;
        } @finally {
            
        }
        
    } failure:^(NSError *error) {
        RequestFailure;
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [userView.textField resignFirstResponder];
    [passView.textField resignFirstResponder];
    
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
