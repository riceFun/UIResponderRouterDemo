//
//  RFResponderCell.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RFResponderCell : UITableViewCell
@property (nonatomic,strong) UIButton *eventButton;

-(void)updateCell:(NSIndexPath *)indexPath;
@end
