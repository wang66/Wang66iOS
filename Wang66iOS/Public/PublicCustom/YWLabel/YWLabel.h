//
//  YWLabel.h
//  YWLabelDemo
//
//  Created by 王亚文 on 2017/4/11.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWLabel : UILabel

- (void)labelText:(NSString *)text lineSpacing:(CGFloat)l_spacing;

+ (NSAttributedString *)attributedTexts:(NSArray *)texts textColors:(NSArray *)textColors textFonts:(NSArray *)textFonts;

+ (NSAttributedString *)attributedTexts:(NSArray *)texts textColors:(NSArray *)textColors textFonts:(NSArray *)textFonts lineSpacing:(CGFloat)l_spacing;

+ (CGSize)sizeLabelWith:(CGFloat)width attributedString:(NSAttributedString *)attributedStr;

+ (CGSize)sizeLabelWith:(CGFloat)width text:(NSString *)text font:(UIFont *)font;

+ (CGSize)sizeLabelWith:(CGFloat)width text:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)l_spacing;


@end
