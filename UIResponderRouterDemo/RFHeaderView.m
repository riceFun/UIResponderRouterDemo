//
//  RFHeaderView.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "RFHeaderView.h"
#import "UIResponder+Router.h"
#import "ResponderChainName.h"

@implementation RFHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.headerButton];
        self.backgroundColor = [UIColor darkGrayColor];
    }
    return self;
}

#pragma mark  getter setter
-(UIButton *)headerButton{
    if (!_headerButton) {
        _headerButton = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 250, 50)];
        [_headerButton setTitle:@"I'm button, U can click me" forState:UIControlStateNormal];
        [_headerButton setBackgroundColor:[UIColor lightGrayColor]];
        [_headerButton addTarget:self action:@selector(click_headerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headerButton;
}

#pragma mark responder event
-(void)click_headerButton:(UIButton *)btn{
    [[self nextResponder] routerEventName:kRFResponderCellHeaderVeiwButtonEvent userInfo:nil];
}

@end
