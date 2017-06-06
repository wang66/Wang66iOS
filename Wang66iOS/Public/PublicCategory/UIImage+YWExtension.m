//
//  UIImage+YWExtension.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/26.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "UIImage+YWExtension.h"

@implementation UIImage (YWExtension)


/**
 将图片切成圆角

 @return 圆角图片
 */
- (UIImage *)cycleImage
{
    UIGraphicsBeginImageContext(self.size); // 开始图片上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(context, rect);
    CGContextClip(context);
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 将图片切成圆角

 @param imgName image name
 @return 圆角图片
 */
+ (UIImage *)cycleImageNamed:(NSString *)imgName
{
    return [[UIImage imageNamed:imgName] cycleImage];
}

@end
