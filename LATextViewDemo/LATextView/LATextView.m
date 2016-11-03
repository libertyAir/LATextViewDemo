//
//  LATextView.m
//  LATextViewDemo
//
//  Created by libertyAir on 2016/11/2.
//  Copyright © 2016年 libertyAir. All rights reserved.
//

#import "LATextView.h"

@interface LATextView ()
{
    UIEdgeInsets _laTextContainerInset;
}

@end

@implementation LATextView 

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (void)setup
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveTextDidChangeNotification:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    //默认style
    UITextField *tf = [UITextField new];
    tf.placeholder = @" ";
    
    self.placeHolderTextColor = [tf valueForKeyPath:@"_placeholderLabel.textColor"];
    self.font = [tf valueForKeyPath:@"_placeholderLabel.font"];
    self.textColor = [UIColor blackColor];
    _laTextContainerInset = UIEdgeInsetsMake(7.0f, .0f, 7.0f, .0f);
    self.textContainerInset = _laTextContainerInset;
    NSLog(@"%@---%@",NSStringFromUIEdgeInsets(self.textContainerInset),NSStringFromUIEdgeInsets(self.contentInset));
    
}

- (void)didReceiveTextDidChangeNotification:(NSNotification *)notification {
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (self.text.length==0 && self.placeHolder)
    {
        CGRect placeHolderRect = CGRectMake(_laTextContainerInset.left + 5.0f,
                                            _laTextContainerInset.top,
                                            rect.size.width - 2*(_laTextContainerInset.left+5.0f),
                                            rect.size.height - 2*_laTextContainerInset.top); //top-5.0f 是光标空了5 这个值不完全准确，差5
        
        [self.placeHolder drawInRect:placeHolderRect withAttributes:@{NSFontAttributeName : self.font,
                                                                      NSForegroundColorAttributeName : self.placeHolderTextColor}];
    }
}

- (void)setPlaceHolder:(NSString *)placeHolder
{
    if([placeHolder isEqualToString:_placeHolder])   return;

    _placeHolder = placeHolder;
    [self setNeedsDisplay];
}


- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
{
    [super setTextContainerInset:textContainerInset];
    _laTextContainerInset = textContainerInset;
}

- (void)setContentInset:(UIEdgeInsets)contentInset
{
    //丢弃该设置
    [super setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}

- (void)setFont:(UIFont *)font {
    [super setFont:font];
    [self setNeedsDisplay];
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    [super setTextAlignment:textAlignment];
    [self setNeedsDisplay];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextViewTextDidChangeNotification object:self];
}


@end
