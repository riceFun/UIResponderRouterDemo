//
//  CustomButtonViewController.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/7.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "CustomButtonViewController.h"
#import "CustomButton.h"

@interface CustomButtonViewController ()

@end

@implementation CustomButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomButton *button = [[CustomButton alloc]init];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(click_button:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)click_button:(UIButton *)button{
    NSLog(@"你点击了 不规则的button");
}
@end
