//
//  InputView.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "InputView.h"

#import "CommonHeader.h"
@interface InputView ()
{
    UILabel *userLable;
    UILabel *passwordLable;
    NSInteger count;
    UIButton *forgetBtn;
    NSInteger vcIndex;
    NSTimer *timer;
}
@end

@implementation InputView

- (instancetype)initWithFrame:(CGRect)frame andLableText:(NSString *)text andPlaceHolder:(NSString*)holder andStatues:(NSInteger)status and:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.cornerRadius = 2;
        self.layer.masksToBounds = YES;
        vcIndex = index;
        userLable = [[UILabel alloc] init];
        userLable.textAlignment = NSTextAlignmentRight;
        userLable.text = text;
        userLable.font = [UIFont systemFontOfSize:14.0];
        
        _textField  = [[UITextField alloc] init];
        _textField.placeholder = holder;
        _textField.font = [UIFont systemFontOfSize:14.0];
        _textField.clearsOnBeginEditing = NO;
        //创建右边按钮
        if (status==1||status==2) {
            forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            forgetBtn.frame = CGRectMake(self.frame.size.width-90, 10, 80, 30);
            [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
            
            forgetBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            [forgetBtn setTitleColor:NAVOrange forState:UIControlStateNormal];
            [forgetBtn addTarget:self action:@selector(forgetPassword:) forControlEvents:UIControlEventTouchUpInside];
            if (status==2) {
                [forgetBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [forgetBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                forgetBtn.backgroundColor = NAVOrange;
            }
            
            [self addSubview:forgetBtn];
        }
        [self addSubview:userLable];
        [self addSubview:_textField];
        [self contentUI];
        
    }
    return self;
}

-(void)contentUI{
    
    
    CGSize size = CGSizeMake(30, 0);
//    CGRect rect = [userLable.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 30.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15.0]} context:nil];
    if ((int)vcIndex==1) {
        size = CGSizeMake(60, 0);
    }
    
    [userLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@5);
        make.width.equalTo(@(size.width));
        make.height.equalTo(@30);
    }];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userLable);
        make.left.equalTo(userLable.mas_right).offset(5);
        make.right.equalTo(self.mas_right).offset(-100);
        make.height.equalTo(@30);
    }];
}
-(void)forgetPassword:(UIButton*)sender{
    if (self.ForgetPassButtonOrSendCode) {
        self.ForgetPassButtonOrSendCode();
    }
    
}

-(void)changeCodeBtn{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerMove) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    }
    
    
    
}

-(void)timerMove{
    NSInteger num = 60;
    count++;
    num = num - count;
    [forgetBtn setTitle:[NSString stringWithFormat:@"%lds",num] forState:UIControlStateNormal];
    if (count==60) {
        count = 0;
        [timer invalidate];
        timer = nil;
        forgetBtn.userInteractionEnabled = YES;
        [forgetBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        
    }

}

@end
