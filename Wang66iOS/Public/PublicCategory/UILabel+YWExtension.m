//
//  UILabel+YWExtension.m
//  Wang66iOS
//
//  Created by wang66 on 2017/5/26.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "UILabel+YWExtension.h"

@implementation UILabel (YWExtension)

- (CGSize)sizeWithWidth:(CGFloat)width
{
    return [self sizeWithWidth:width lineSpacing:2.f];
}

- (CGSize)sizeWithWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing
{
    if(width<=0){
        return CGSizeZero;
    }
    
    UILabel *tempLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 1000)];
    tempLab.text = self.text;
    tempLab.font = self.font;
    tempLab.numberOfLines = 0;
    
    CGSize labSize = [tempLab sizeThatFits:tempLab.bounds.size];
    return labSize;
}

- (void)labelText:(NSString *)text lineSpacing:(CGFloat)lineSpacing
{
    if(lineSpacing<=0){
        self.text = text;
        return;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attributes = @{NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.textColor, NSParagraphStyleAttributeName:paragraphStyle};
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:text];
    [mAttrStr setAttributes:attributes range:NSMakeRange(0, text.length)];
    
    self.attributedText = mAttrStr.copy;
}

/**
 给label的文本后追加个图标

 @param image 图标
 */
- (void)appendImage:(UIImage *)image
{
    if(!image){
        return;
    }
    NSMutableAttributedString *mAttrStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    NSDictionary *attributes = @{NSFontAttributeName:self.font,NSForegroundColorAttributeName:self.textColor};
    [mAttrStr setAttributes:attributes range:NSMakeRange(0, self.text.length)];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = image;
    attachment.bounds = CGRectMake(0, 0, image.size.width, image.size.width);
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    [mAttrStr appendAttributedString:attachmentAttrStr];
    
    self.attributedText = mAttrStr;
}

@end
