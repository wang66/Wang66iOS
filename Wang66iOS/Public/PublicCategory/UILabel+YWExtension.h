//
//  UILabel+YWExtension.h
//  Wang66iOS
//
//  Created by wang66 on 2017/5/26.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YWExtension)

- (CGSize)sizeWithWidth:(CGFloat)width;

- (CGSize)sizeWithWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;

- (void)labelText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;

- (void)appendImage:(UIImage *)image;

@end
