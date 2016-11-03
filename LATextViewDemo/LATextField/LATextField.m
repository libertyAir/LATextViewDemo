//
//  LATextField.m
//  LATextViewDemo
//
//  Created by libertyAir on 2016/11/3.
//  Copyright © 2016年 libertyAir. All rights reserved.
//

#import "LATextField.h"
#import <objc/runtime.h>

@implementation LATextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 初始化调用一次 用于查看UITextField中的成员属性和变量
+ (void)initialize
{
    [self getIvars];
// [self getProperties];
    //    [tf setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];;  //_placeholderLabel.textColor
    //    [tf setValue:[UIFont boldSystemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
}

// 获取所有属性
+ (void)getProperties
{
unsigned int count = 0;
    objc_property_t *properties = class_copyPropertyList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        // 取出属性
        objc_property_t property = properties[i];
        
        // 打印属性名字
        NSLog(@"%s<---->%s", property_getName(property), property_getAttributes(property));
    }
    free(properties);
}

// 获取所有成员变量
+ (void)getIvars
{
    unsigned int count = 0;
    // 拷贝出所有的成员变量列表
    Ivar *ivars = class_copyIvarList([UITextField class], &count);
    for (int i = 0; i<count; i++) {
        // 取出成员变量
        //        Ivar ivar = *(ivars + i);
        Ivar ivar = ivars[i];
        
        // 打印成员变量名字
        NSLog(@"%s %s", ivar_getName(ivar), ivar_getTypeEncoding(ivar));
    }
    // 释放
    free(ivars);
}

@end
