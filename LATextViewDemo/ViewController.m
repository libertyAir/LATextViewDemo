//
//  ViewController.m
//  LATextViewDemo
//
//  Created by libertyAir on 2016/11/2.
//  Copyright © 2016年 libertyAir. All rights reserved.
//

#import "ViewController.h"
#import "LATextView.h"
#import "LATextField.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    LATextView *textView = [[LATextView alloc]initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 100)];
    textView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    textView.placeHolder = @"placeholderplaceholderplaceholderplaceholderplaceholderplaceholderplaceholderplaceholder";
    [self.view addSubview:textView];
    
    self.view.backgroundColor = [UIColor redColor];//

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
