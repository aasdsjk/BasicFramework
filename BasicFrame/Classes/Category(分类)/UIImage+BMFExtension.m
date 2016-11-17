//
//  UIImage+BMFExtension.m
//  大嘴鱼
//
//  Created by ningzhen on 15-9-2.
//  Copyright (c) 2015年 DianZhi. All rights reserved.
//

#import "UIImage+BMFExtension.h"

@implementation UIImage (BMFExtension)

- (UIImage *)leftHalfImage {
    CGImageRef imageRef = self.CGImage;
    
    CGFloat imageW =  CGImageGetWidth(imageRef);
    CGFloat imageH =  CGImageGetHeight(imageRef);
    //截取图片左边的一半
    CGImageRef thumbImageRef = CGImageCreateWithImageInRect(imageRef, CGRectMake(30, 0, imageW * 0.5, imageH));
    UIImage *thumbScale = [UIImage imageWithCGImage:thumbImageRef];
    CGImageRelease(thumbImageRef);
    
    return thumbScale;
    
}
+(UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect          = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage    = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha

{
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    
    
    CGContextScaleCTM(ctx, 1, -1);
    
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    
    
    CGContextSetAlpha(ctx, alpha);
    
    
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}
+(UIImage *)coreBlurImage:(UIImage *)image
           withBlurNumber:(CGFloat)blur {
    //博客园-FlyElephant
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage  *inputImage=[CIImage imageWithCGImage:[self createImageWithColor:[UIColor redColor]].CGImage];
    //设置filter
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey: @"inputRadius"];
    //模糊图片
    CIImage *result=[filter valueForKey:kCIOutputImageKey];
    CGImageRef outImage=[context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage=[UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
}

//修改图片大小
+(UIImage*)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);  //size 为CGSize类型，即你所需要的图片尺寸
    
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return scaledImage;   //返回的就是已经改变的图片
}

@end
