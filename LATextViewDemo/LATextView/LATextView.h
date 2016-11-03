//
//  LATextView.h
//  LATextViewDemo
//
//  Created by libertyAir on 2016/11/2.
//  Copyright © 2016年 libertyAir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LATextView : UITextView

/**
 *  提示用户输入的标语
 */
@property (nonatomic, copy) NSString *placeHolder;


/**
 *  标语文本的颜色
 */
@property (nonatomic, strong) UIColor *placeHolderTextColor;



@end
