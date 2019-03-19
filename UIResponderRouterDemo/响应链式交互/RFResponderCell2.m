//
//  RFResponderCell2.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFResponderCell2.h"
#import "UIResponder+Router.h"
#import "ResponderChainName.h"

@interface RFResponderCell2 ()
@property (nonatomic,strong) UIButton *disLikeButton;

@end

@implementation RFResponderCell2

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.disLikeButton];
    }
    return self;
}

-(UIButton *)disLikeButton{
    if (!_disLikeButton) {
        _disLikeButton = [[UIButton alloc]initWithFrame:CGRectMake(4, 4, 200, 35)];
        [_disLikeButton setTitle:@"变色" forState:UIControlStateFocused];
        [_disLikeButton setBackgroundColor:[UIColor cyanColor]];
        [_disLikeButton addTarget:self action:@selector(click_disLikeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _disLikeButton;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //    self.eventButton.frame = CGRectMake(0, 0, 200, 40);
    //    self.eventButton.center = self.center;
}



#pragma mark userEvent
-(void)click_disLikeButton:(UIButton *)btn{
    [self.nextResponder routerEventName:kRFResponderCellDislikeButtonEvent userInfo:@{@"LikeCellPresent":self.likeCellPresent}];
}

#pragma mark setter
-(void)setLikeCellPresent:(LikeCellPresent *)likeCellPresent{
    _likeCellPresent = likeCellPresent;
    
    if (likeCellPresent.isLike) {
        [self.disLikeButton setImage:[UIImage imageNamed:@"like_fill"] forState:UIControlStateNormal];
    }else{
        [self.disLikeButton setImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    }
}

@end

