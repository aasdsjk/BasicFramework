//
//  BasicViewController.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "BasicViewController.h"
#import "SingleTool.h"
@interface BasicViewController ()
{
    UIScrollView *headScroll;
    UIScrollView *footerScroll;
    NSInteger _page;
}
@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _page = 0;

}

- (void)keyBoardListen {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow:(NSNotification *)noti {

}

- (void)keyboardWillHide:(NSNotification *)noti {

}
//// 是否支持自动转屏
//- (BOOL)shouldAutorotate
//{
//    // 调用ZFPlayerSingleton单例记录播放状态是否锁定屏幕方向
//    return NO;
//}



- (void)setHeader:(BOOL)header
{
    _header = header;
    if (header == YES) {
        if (self.scrol != nil) {
            [self mainHeader:self.scrol];
        }
        
    }
    
}

//- (NSMutableArray *)shopArray
//{
//    if (_shopArray == nil) {
//        _shopArray = [NSMutableArray array];
//    }
//    return _shopArray;
//}
- (void)setFooter:(BOOL)footer
{
    _footer = footer;
    if (_footer == YES) {
        if (self.scrol != nil) {
            
            [self mainFooter:self.scrol];
        }
    }
    
}
//网页刷新
- (void)mainHeader:(UIScrollView *)scroller headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)block
{
    scroller.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
// 设置表头
- (void)mainHeader:(UIScrollView *)scroller success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure block:(NSString *(^)())block
{
    headScroll = scroller;
    if (scroller) {
        scroller.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            //_page = 1;
            NSString *str = block();
            //            [self.scrol.mj_footer resetNoMoreData];
            [self sendRequestHeader:YES urlStr:str success:success failure:failure];//发送此控制器的请求
        }];
    }
}
// 设置表尾
- (void)mainFooter:(UIScrollView *)scroller success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure block:(NSString *(^)())block
{
    footerScroll = scroller;
    if (scroller) {
        scroller.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            //改变后的URl
            NSString *str = block();
            [self sendRequestHeader:NO urlStr:str success:success failure:failure];
            
        }];
    }
}

- (NSString *)urlString:(NSString *)url page:(NSInteger)page
{
    return [NSString stringWithFormat:@"%@&p=%ld",url,page];
}
// 发送get请求
- (void)sendRequestWithUrlStr:(NSString *)urlStr success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [self sendneedHud:NO WithRequestWithUrlStr:urlStr success:success failure:failure];
    
}

- (void)sendneedHud:(BOOL)hud WithRequestWithUrlStr:(NSString *)urlStr success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    if (hud == YES) {
        [LCProgressHUD showLoading:@"正在加载"];
    }
    
    [HttpTool get:urlStr params:nil success:^(id  _Nullable json) {
        if (success) {
            success(json);
            [LCProgressHUD hide];
        }
    } failure:^(NSError * _Nonnull error) {
        failure(error);
        [LCProgressHUD hide];
    }];
    
}
- (void)sendPostRequestWithUrl:(NSString *)urlStr withParameter:(NSDictionary *)paramater success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [HttpTool post:urlStr params:paramater success:^(id  _Nullable json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
//上传图片post请求
- (void)sendImagePostRequestWithUrlStr:(NSString *)urlStr withDomainName:(NSString *)domain fileName:(NSString *)filename withParameter:(NSDictionary *)dict WithImageArray:(NSArray *)imageArray success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [HttpTool post:urlStr params:dict constructingBodyWithBlock:^(id<BMFMultipartFormData>  _Nonnull formData) {
        @try {
            for (UIImage *img in imageArray) {
                NSData *data = UIImageJPEGRepresentation(img, 0.1);
                
                //拼接参数
                [formData appendPartWithFileData:data name:domain fileName:filename mimeType:@"image/jpeg"];
            }
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
    }
              success:^(id  _Nullable json) {
                  if (success) {
                      success(json);
                  }
                  
              } failure:^(NSError * _Nonnull error) {
                  if (failure) {
                      failure(error);
                  }
              }];
}

- (void)sendImagePostRequestWithUrlStr:(NSString *)urlStr withDomainName:(NSString *)domain fileName:(NSString *)filename withParameter:(NSDictionary *)dict progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress WithImageArray:(NSArray *)imageArray success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [HttpTool post:urlStr params:dict constructingBodyWithBlock:^(id<BMFMultipartFormData>  _Nonnull formData) {
        @try {
            for (UIImage *img in imageArray) {
                NSData *data = UIImageJPEGRepresentation(img, 0.5);
                //拼接参数
                [formData appendPartWithFileData:data name:domain fileName:filename mimeType:@"image/jpeg"];
            }
            
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    } progress:^(NSProgress * _Nonnull progress) {
        if (uploadProgress) {
            uploadProgress(progress);
        }
    } success:^(id  _Nullable json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    } ];
}

- (void)sendRequestHeader:(BOOL)header urlStr:(NSString *)url success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [HttpTool get:url params:nil success:^(id  _Nullable json) {
        success(json);
        if (header) {
            [self endHeaderRefresh];
        }else
        {
            [self endFooterRefresh];
        }
        
    } failure:^(NSError * _Nonnull error) {
        failure(error);
        if (header) {
            [self endHeaderRefresh];
        }else
        {
            [self endFooterRefresh];
        }
    }];
}
- (void)endHeaderRefresh
{
    
    [self endHeaderRefresh:headScroll];
    
}
- (void)endFooterRefresh
{
    [self endFooterRefresh:footerScroll];
}

- (void)endHeaderRefresh:(UIScrollView *)scroller
{
    [scroller.mj_header endRefreshing];
    
}
- (void)endFooterRefresh:(UIScrollView *)scroller
{
    [scroller.mj_footer endRefreshing];
}

- (BOOL)isLogin {
    
//    if ([XZUserModel sharedUserModel].uid.length) {
//        
//        return YES;
//    }
    
    return NO;
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
