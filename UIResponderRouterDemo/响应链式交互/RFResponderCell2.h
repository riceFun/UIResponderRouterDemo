//
//  RFResponderCell2.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LikeCellPresent.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^LikeBlock)(id model);
@interface RFResponderCell2 : UITableViewCell
@property (nonatomic,copy) LikeBlock likeBlock;

@property (nonatomic,strong)LikeCellPresent *likeCellPresent;

@end

NS_ASSUME_NONNULL_END
