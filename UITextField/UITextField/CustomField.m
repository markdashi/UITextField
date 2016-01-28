//
//  CustomField.m
//  UITextField
//
//  Created by Apple on 16/1/28.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "CustomField.h"
#import <objc/runtime.h>

static NSString * const PlacerholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation CustomField

//通过runtime来访问UITextField的成员变量,通过KVC来改变站位文字的颜色
+ (void)initialize
{
    unsigned int count = 0;
    //这是底层的C语言函数copy一个属性列表
    Ivar *ivars =  class_copyIvarList([UITextField class], &count);
    for (int i = 0; i< count; i++)
    {
        Ivar ivar =  *(ivars + i);//取出成员变量
        NSLog(@"%s",ivar_getName(ivar));//打印属性名
    }
    free(ivars);//释放
    
}
//方法二：通过KVC 来设置
- (void)awakeFromNib
{
    UILabel *placeholderLabel = [self valueForKeyPath:@"_placeholderLabel"];
    placeholderLabel.textColor = [UIColor grayColor];

   //设置光标的颜色
    self.tintColor = self.textColor;
    [self resignFirstResponder];
}

- (BOOL)becomeFirstResponder
{

    [self setValue:self.textColor forKeyPath:PlacerholderColorKeyPath];
    return [super becomeFirstResponder];
}
- (BOOL)resignFirstResponder
{
   [self setValue:[UIColor grayColor] forKeyPath:PlacerholderColorKeyPath];
    return [super resignFirstResponder];
}

////方法一，重绘placeholder
//- (void)drawPlaceholderInRect:(CGRect)rect
//{
//    [self.placeholder drawInRect:CGRectMake(0, 10, rect.size.width, 25) withAttributes:@{
//                                                                                         NSForegroundColorAttributeName:[UIColor grayColor],
//                                                                                         NSFontAttributeName:self.font
//                                                                                        }];
//}


@end
