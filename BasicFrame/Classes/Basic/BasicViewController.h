//
//  BasicViewController.h
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonHeader.h"
@interface BasicViewController : UIViewController
@property(nonatomic, getter=isHeader)BOOL header;
@property(nonatomic, getter=isFooter)BOOL footer;
@property(nonatomic, strong)UIScrollView *scrol;

- (void)keyBoardListen;
/**
 *  功能待定
 *
 *  @param scroller scro
 */
- (void)mainHeader:(UIScrollView *)scroller;
- (void)mainFooter:(UIScrollView *)scroller;
- (void)endHeaderRefresh:(UIScrollView *)scroller;
- (void)endFooterRefresh:(UIScrollView *)scroller;
/**
 *  网页的刷新头部
 *
 *  @param scroller 网页
 *  @param block    刷新逻辑
 */
- (void)mainHeader:(UIScrollView *)scroller headerWithRefreshingBlock:(MJRefreshComponentRefreshingBlock)block;
/**
 *  设置滚动视图的头部
 *
 *  @param scroller 滚动视图
 *  @param url      请求的url
 *  @param block    完成的block
 */
// 设置表头
- (void)mainHeader:(UIScrollView *)scroller success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure block:(NSString *(^)())block;
/**
 *  设置滚动视图的尾部
 *
 *  @param scroller 滚动视图
 *  @param url      请求的url
 *  @param block    完成的block
 */
- (void)mainFooter:(UIScrollView *)scroller  success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure block:(NSString *(^)())block;
/**
 *  发送get请求
 *
 *  @param urlStr 请求的url
 *  @param block  请求完成的block
 */
- (void)sendRequestWithUrlStr:(NSString *)urlStr success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure;
/**
 *  发送带菊花get请求
 *
 *  @param hud     是否带菊花
 *  @param urlStr  url
 *  @param success 成功
 *  @param failure 失败
 */
- (void)sendneedHud:(BOOL)hud WithRequestWithUrlStr:(NSString *)urlStr success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure;
/**
 *  发送上传图片的请求
 *
 *  @param urlStr     请求的Url
 *  @param domain     文件地址
 *  @param filename   文件名
 *  @param dict       参数
 *  @param imageArray 图片数组（image）
 *  @param block      完成的block
 */
- (void)sendImagePostRequestWithUrlStr:(NSString *)urlStr withDomainName:(NSString *)domain fileName:(NSString *)filename withParameter:(NSDictionary *)dict WithImageArray:(NSArray *)imageArray success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure;
- (void)sendImagePostRequestWithUrlStr:(NSString *)urlStr withDomainName:(NSString *)domain fileName:(NSString *)filename withParameter:(NSDictionary *)dict progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress WithImageArray:(NSArray *)imageArray success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure;
/**
 *  发送post请求
 *
 *  @param urlStr    请求的url
 *  @param paramater 请求的参数
 *  @param block     完成的block
 */
- (void)sendPostRequestWithUrl:(NSString *)urlStr withParameter:(NSDictionary *)paramater success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure;

@end
