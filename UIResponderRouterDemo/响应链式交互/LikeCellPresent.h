//
//  LikeCellPresent.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LikeModel.h"

NS_ASSUME_NONNULL_BEGIN


typedef void(^CompletionHandler)(void);
typedef void(^LikeCellPresentblock)(void);
@interface LikeCellPresent : NSObject

+(instancetype)configWithLikeModel:(LikeModel *)likeModel;

@property (nonatomic,strong) LikeModel *likeModel;
@property (nonatomic,copy)LikeCellPresentblock cellPresentblock;

-(BOOL)isLike;

//netWork
-(void)likeOrDisLikeOpretion:(CompletionHandler)completionHandler;
-(void)likeOrDisLikeOpretion;
@end

NS_ASSUME_NONNULL_END
