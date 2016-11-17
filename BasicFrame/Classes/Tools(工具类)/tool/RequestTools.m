//
//  RequestTools.m
//  ttkhj
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "RequestTools.h"
#import "XZBaseUrlTool.h"
#import "ConmonsTool.h"
@implementation RequestTools

// op = reg 注册 | checkinfo其他身份验证 | findpwd 找回密码 | bindphone绑定手机号| change_phone 更换手机号
+(NSString *)sendPhoneCodeWithOp:(NSString *)op withPhone:(NSString *)phone andWithUid:(NSString*)uid{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:op,@"op",phone,@"phone", nil];
    if (uid!=nil) {
        [dict setObject:uid forKey:@"uid"];
    }
//    str = [str stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    return [NSString stringWithFormat:@"%@&op=%@&phone=%@",[self pubLicParmater:@"index.php?tp=api/send_sms" withSignDict:dict],op,phone];
    
}
//注册 op = phone_reg
+(NSString *)registerWithOp:(NSString *)op  withPhone:(NSString *)phone withPwd:(NSString *)pwd withCode:(NSString *)code withDevice_type:(NSString *)device_type{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:op,@"op",phone,@"phone",pwd,@"pwd",code,@"code",device_type,@"device_type", nil];
    NSString *str = [NSString stringWithFormat:@"%@&op=%@&phone=%@&pwd=%@&code=%@&device_type=%@",[self pubLicParmater:@"index.php?tp=api/reg" withSignDict:dict],op,phone,pwd,code,device_type];
    return str;
}
//登录 op = login
+(NSString *)loginWithOp:(NSString *)op withPhone:(NSString *)phone withPwd:(NSString *)pwd{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:op,@"op",phone,@"phone",pwd,@"pwd", nil];
    NSString *str = [NSString stringWithFormat:@"%@&op=%@&phone=%@&pwd=%@",[self pubLicParmater:@"index.php?tp=api/reg" withSignDict:dict],op,phone,pwd];
    return str;
}
//单图上传 op topics 话题中的图片
+(NSString *)postSingleImageWithOp:(NSString *)op{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:op,@"op",op, nil];
    NSString *str = [NSString stringWithFormat:@"%@&op=%@",[self postImageParmater:@"app/upic_ttkk.php?" withSignDict:dict],op];
    return str;
}
//发布话题
+(NSString *)publishTopicWithTitle:(NSString *)title andContent:(NSString *)content{
    
    NSString *str = [NSString stringWithFormat:@"%@",[self pubLicParmater:@"index.php?tp=api/up_topics" withSignDict:nil]];
    return str;
}
//话题关注   取消关注
+(NSString *)attentionTopicAndCancleWithID:(NSString *)ID{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:ID,@"id", nil];
    NSString *str = [NSString stringWithFormat:@"%@&id=%@",[self pubLicParmater:@"index.php?tp=api/concern_topics" withSignDict:dict],ID];
    return str;
}

//话题点赞，取消点赞
+(NSString *)apreciateTopicWithID:(NSString *)ID{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:ID,@"id", nil];
    NSString *str = [NSString stringWithFormat:@"%@&id=%@",[self pubLicParmater:@"index.php?tp=api/like_topics" withSignDict:dict],ID];
    return str;
}
//话题评论
+(NSString *)topicCommentFormID:(NSString *)fromId and:(NSString *)topic_id content:(NSString *)content{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:fromId,@"from_uid",topic_id,@"topics_id",content,@"content", nil];
    NSString *str = [NSString stringWithFormat:@"%@&from_uid=%@topics_id=%@content=%@",[self pubLicParmater:@"index.php?tp=api/topics_comment" withSignDict:dict],fromId,topic_id,content];
    return str;
}

//评论列表
+(NSString *)commonListWithTopicId:(NSString *)topic_id{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:topic_id,@"topics_id", nil];
    NSString *str = [NSString stringWithFormat:@"%@&topics_id=%@",[self pubLicParmater:@"index.php?tp=api/topics_comment" withSignDict:dict],topic_id];
    return str;
}
#pragma mark - 首页数据
+(NSString *)homeListData{
    NSString *str = [NSString stringWithFormat:@"%@",[self pubLicParmater:@"index.php?tp=api/index" withSignDict:nil]];
    return str;
}
//pos = 1 : 轮播图 pos =2 : 三个功能图片 pos = 3 : 两个专题图片 无pos参数 : 三个分组数据
+(NSString *)homeBannerAndTwoImageDataWithPos:(NSString *)pos{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:pos,@"pos", nil];
    NSString *str = [NSString stringWithFormat:@"%@&pos=%@",[self pubLicParmater:@"index.php?tp=api/index" withSignDict:dict],pos];
    return str;
}
//更多
+(NSString *)homeMoreDataWithId:(NSString *)Id{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:Id,@"id", nil];
    NSString *str = [NSString stringWithFormat:@"%@&id=%@",[self pubLicParmater:@"index.php?tp=api/special_list" withSignDict:dict],Id];
    return str;
}
#pragma mark - 分类页数据
//分类Icon列表
+(NSString *)classifyIconList {
    NSString *str = [NSString stringWithFormat:@"%@",[self pubLicParmater:@"index.php?tp=api/video_category" withSignDict:nil]];
    return str;
}

//分类列表详情
+(NSString *)classifyDetailWithCategory:(NSString *)category {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:category, @"category", nil];
    NSString *str = [NSString stringWithFormat:@"%@&category=%@",[self pubLicParmater:@"index.php?tp=api/category_detail" withSignDict:dict], category];
    return str;
}

//分类搜索
+(NSString *)classSearchWithType:(NSString *)type category:(NSString *)category year:(NSString *)year isCompleted:(NSString *)isCompleted cat_inner:(NSString *)cat_inner{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys: type, @"type",category, @"category",year,@"year",isCompleted,@"isCompleted",cat_inner,@"cat_inner", nil];
    NSString *str = [NSString stringWithFormat:@"%@&type=%@&category=%@&year=%@&isCompleted=%@&cat_inner=%@",[self pubLicParmater:@"index.php?tp=api/category_detail" withSignDict:dict],type, category,year,isCompleted,cat_inner];
    return str;
}

#pragma mark - h5页面
//社区 op = concern
+(NSString *)communityHomeWithOp:(NSString *)op{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]initWithObjectsAndKeys:op,@"op", nil];
    NSString *str = [NSString stringWithFormat:@"%@&op=%@",[self pubLicParmater:@"index.php?tp=mobile/community" withSignDict:dict], op];
    
    return str;
}


#pragma mark - 基础参数
+ (NSString *)postImageParmater:(NSString *)yuming withSignDict:(NSMutableDictionary *)signDict
{
    return [NSString stringWithFormat:@"%@%@&%@",@"http://img.xz.3z.cc/",yuming,[XZBaseUrlTool publicCapictyAndSignDict:signDict]];
}
+ (NSString *)pubLicParmater:(NSString *)yuming withSignDict:(NSMutableDictionary *)signDict
{
    return [NSString stringWithFormat:@"%@%@&%@",BMFBASEURL,yuming,[XZBaseUrlTool publicCapictyAndSignDict:signDict]];
}
+(NSString *)postRequestWithTitleAndOther:(NSString*)str and:(NSMutableDictionary *)dict{
    return [NSString stringWithFormat:@"%@%@&%@",@"http://xz.3z.cc/",str,[XZBaseUrlTool publicCapictyAndSignDict:dict]];
}

@end
