//
//  YWLabel.m
//  YWLabelDemo
//
//  Created by 王亚文 on 2017/4/11.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "YWLabel.h"

@implementation YWLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)labelText:(NSString *)text lineSpacing:(CGFloat)l_spacing
{
    if(l_spacing<=0){
        self.text = text;
        return;
    }
    self.numberOfLines = 0;
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = l_spacing;
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    [mAttrStr addAttribute:NSForegroundColorAttributeName value:self.textColor range:NSMakeRange(0, text.length)];
    [mAttrStr addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, text.length)];
    
    self.attributedText = mAttrStr;
}

+ (NSAttributedString *)attributedTexts:(NSArray *)texts textColors:(NSArray *)textColors textFonts:(NSArray *)textFonts
{
    if(texts.count==0){
        return nil;
    }
    
    NSMutableAttributedString *mResultAttrStr = [[NSMutableAttributedString alloc] init];
    
    for(int i=0; i<texts.count; i++)
    {
        NSString *text = texts[i];
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:text];
        [attrStr addAttribute:NSForegroundColorAttributeName value:textColors[i] range:NSMakeRange(0, text.length)];
        [attrStr addAttribute:NSFontAttributeName value:textFonts[i] range:NSMakeRange(0, text.length)];
        [mResultAttrStr appendAttributedString:attrStr];
    }
    return mResultAttrStr.copy;
}

+ (NSAttributedString *)attributedTexts:(NSArray *)texts textColors:(NSArray *)textColors textFonts:(NSArray *)textFonts lineSpacing:(CGFloat)l_spacing
{
    NSMutableAttributedString *mAttrStr = [YWLabel attributedTexts:texts textColors:textColors textFonts:textFonts].mutableCopy;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = l_spacing;
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mAttrStr.length)];
    
    return mAttrStr.copy;
}

+ (CGSize)sizeLabelWith:(CGFloat)width attributedString:(NSAttributedString *)attributedStr
{
    if(width<0){
        return CGSizeZero;
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    lab.attributedText = attributedStr;
    lab.numberOfLines = 0;
    CGSize fitSize = [lab sizeThatFits:lab.bounds.size];
    
    return fitSize;
}

+ (CGSize)sizeLabelWith:(CGFloat)width text:(NSString *)text font:(UIFont *)font
{
    if(width<0){
        return CGSizeZero;
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    lab.text = text;
    lab.font = font;
    lab.numberOfLines = 0;
    CGSize fitSize = [lab sizeThatFits:lab.bounds.size];
    
    return fitSize;
}

+ (CGSize)sizeLabelWith:(CGFloat)width text:(NSString *)text font:(UIFont *)font lineSpacing:(CGFloat)l_spacing
{
    if(width<0){
        return CGSizeZero;
    }
    
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:text];
    [mAttrStr addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = l_spacing;
    [mAttrStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, text.length)];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    lab.attributedText = mAttrStr.copy;
    lab.font = font;
    lab.numberOfLines = 0;
    CGSize fitSize = [lab sizeThatFits:lab.bounds.size];
    
    return fitSize;
}






@end
