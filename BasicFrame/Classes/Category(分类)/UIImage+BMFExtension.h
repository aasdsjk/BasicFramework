//
//  UIImage+BMFExtension.h
//  大嘴鱼
//
//  Created by ningzhen on 15-9-2.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BMFExtension)

+(UIImage*)createImageWithColor:(UIColor*) color;

- (UIImage *)leftHalfImage;

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;
+(UIImage *)coreBlurImage:(UIImage *)image
           withBlurNumber:(CGFloat)blur;

+(UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
@end
