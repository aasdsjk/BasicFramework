//
//  RequestTools.h
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestTools : NSObject
//验证码
+(NSString *)sendPhoneCodeWithOp:(NSString *)op withPhone:(NSString *)phone andWithUid:(NSString*)uid;

//注册
+(NSString *)registerWithOp:(NSString *)op  withPhone:(NSString *)phone withPwd:(NSString *)pwd withCode:(NSString *)code withDevice_type:(NSString *)device_type;
//登录
+(NSString *)loginWithOp:(NSString *)op withPhone:(NSString *)phone withPwd:(NSString *)pwd;

//单图上传
+(NSString *)postSingleImageWithOp:(NSString *)op;
//发布话题
+(NSString *)publishTopicWithTitle:(NSString *)title andContent:(NSString *)content;
//话题关注   取消关注
+(NSString *)attentionTopicAndCancleWithID:(NSString *)ID;

//话题点赞，取消点赞
+(NSString *)apreciateTopicWithID:(NSString *)ID;
//话题评论
+(NSString *)topicCommentFormID:(NSString *)fromId and:(NSString *)topic_id content:(NSString *)content;
//评论列表
+(NSString *)commonListWithTopicId:(NSString *)topic_id;

#pragma mark - 分类
//分类Icon列表
+(NSString *)classifyIconList;
//分类列表详情
+(NSString *)classifyDetailWithCategory:(NSString *)category;
//分类搜索
+(NSString *)classSearchWithType:(NSString *)type category:(NSString *)category year:(NSString *)year isCompleted:(NSString *)isCompleted cat_inner:(NSString *)cat_inner;

#pragma mark - 首页数据
+(NSString *)homeListData;

+(NSString *)homeBannerAndTwoImageDataWithPos:(NSString *)pos;
  
+(NSString *)homeMoreDataWithId:(NSString *)Id;
#pragma mark - h5页面

+(NSString *)communityHomeWithOp:(NSString *)op;
@end
