//
//  HttpTool.m
//  FFDemo
//
//  Created by ning on 16/10/22.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool
/**
 *  发送get请求
 *
 *  @param url
 *  @param params  发送的参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)get:(NSString *)url params:(nullable NSDictionary *)params success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    // 1.创建请求管理者
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
//    //申明请求的数据是json类型
    mgr.requestSerializer=[AFJSONRequestSerializer serializer];
    //请求超时
    mgr.requestSerializer.timeoutInterval = 10.0f;
    //    XZAccount *account = [XZAccount account];
    //
    //    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    //    dict[@"appid"] = account.appid;
    //    dict[@"timestamp"] = account.timesTamp;
    //    dict[@"signature"] = account.signature;
    
//    [mgr GET:@"abc" parameters:nil progress:nil success:nil failure:nil];
    
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
}

+ (void)postmanager:(NSString *)url params:(nullable id)params success:(void (^)(id manager,id _Nullable json))success failure:(void (^)(NSError *error))failure {
    // 1.创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    //申明返回的结果是json类型
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    mgr.requestSerializer=[AFJSONRequestSerializer serializer];
//    XZAccount *account = [XZAccount account];
    //请求超时
    mgr.requestSerializer.timeoutInterval = 10.0f;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    //    if (dict[@"title"]) {
    //
    //
    //    }else{
    
//    dict[BMFData(@"client")] = @1;
//    dict[BMFData(@"region_id")] = [XZUserModel sharedUserModel].region_id.length ? [XZUserModel sharedUserModel].region_id : @"1381";
//    dict[BMFData(@"current_version")] = [XZUserModel sharedUserModel].currentVersion;
//    dict[@"appid"] = account.appid;
//    dict[@"timestamp"] = account.timesTamp;
//    dict[@"signature"] = account.signature;
//    //    }
//    
//    BMFLog(@"%@----%@",dict,mgr.requestSerializer);
    
    
    
    // 2.发送请求
    [mgr POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSLog(@"%@",responseObject);
            success(mgr,responseObject);
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            NSLog(@"tool%@",error);
            failure(error);
        }
    }];
    
    //    [mgr POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        if (success) {
    //            BMFLog(@"%@",responseObject);
    //            success(mgr,responseObject);
    //
    //        }
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        if (failure) {
    //            BMFLog(@"tool%@",error);
    //            failure(error);
    //        }
    //    }];
    //
}


/**
 *  发送post请求
 *
 *  @param url
 *  @param params  发送的参数
 *  @param success 成功回调
 *  @param failure 失败回调
 */
+ (void)post:(NSString *)url params:(nullable NSDictionary *)params success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure
{
    [self postmanager:url params:params success:^(id manager, id json) {
        if (success) {
            success(json);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(nullable NSDictionary *)params constructingBodyWithBlock:(void (^)(id <BMFMultipartFormData> formData))block success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure {
    {
        // 1.创建一个管理者
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
        
        
        
//        XZAccount *account = [XZAccount account];
//        // 2.封装参数(这个字典只能放非文件参数)
//        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
//        dict[@"appid"] = account.appid;
//        dict[@"timestamp"] = account.timesTamp;
//        dict[@"signature"] = account.signature;
        
        
        
        // 3.发送一个请求
        
        
        [mgr POST:url parameters:params constructingBodyWithBlock:^(id<BMFMultipartFormData>  _Nonnull formData) {
            
            if (block) {
                block(formData);
            }
            
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
        
        
    }
}
+ (void)post:(NSString *)url params:(nullable NSDictionary *)params constructingBodyWithBlock:(void (^)(id <BMFMultipartFormData> formData))block progress:(nullable void (^)(NSProgress * _Nonnull))uploadProgress success:(void (^)(id __nullable json))success failure:(void (^)(NSError *error))failure {
    {
        // 1.创建一个管理者
        AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
        
        
        
//        XZAccount *account = [XZAccount account];
//        // 2.封装参数(这个字典只能放非文件参数)
//        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
//        dict[@"appid"] = account.appid;
//        dict[@"timestamp"] = account.timesTamp;
//        dict[@"signature"] = account.signature;
        
        
        
        // 3.发送一个请求
        
        
        [mgr POST:url parameters:params constructingBodyWithBlock:^(id<BMFMultipartFormData>  _Nonnull formData) {
            
            if (block) {
                block(formData);
            }
            
        } progress:^(NSProgress * _Nonnull Progress) {
            if (uploadProgress) {
                uploadProgress(Progress);
            }
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(error);
            }
        }];
        
        
    }
}
@end
