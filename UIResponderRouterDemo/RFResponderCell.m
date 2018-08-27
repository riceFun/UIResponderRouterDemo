//
//  RFResponderCell.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "RFResponderCell.h"
#import "UIResponder+Router.h"
#import "ResponderChainName.h"

@implementation RFResponderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.eventButton];
    }
    return self;
}

-(UIButton *)eventButton{
    if (!_eventButton) {
        _eventButton = [[UIButton alloc]initWithFrame:CGRectMake(4, 4, 200, 35)];
        [_eventButton setTitle:@"cell Button" forState:UIControlStateFocused];
        [_eventButton setBackgroundColor:[UIColor grayColor]];
        [_eventButton addTarget:self action:@selector(click_eventButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _eventButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    self.eventButton.frame = CGRectMake(0, 0, 200, 40);
//    self.eventButton.center = self.center;
}

-(void)click_eventButton:(UIButton *)btn{
    [self.nextResponder routerEventName:kRFResponderCellButtonEvent userInfo:@{@"name":self.eventButton.titleLabel.text}];
}

-(void)updateCell:(NSIndexPath *)indexPath{
    [self.eventButton setTitle:[NSString stringWithFormat:@"%ld行，请点击 ",(long)indexPath.row] forState:UIControlStateNormal];
}


@end
