//
//  LikeCellPresent.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "LikeCellPresent.h"
#import "NetWork.h"

@implementation LikeCellPresent

+(instancetype)configWithLikeModel:(LikeModel *)likeModel{
    return [[LikeCellPresent alloc]initWithLikeModel:likeModel];
}

-(instancetype)initWithLikeModel:(LikeModel *)likeModel{
    if (self = [super init]) {
        _likeModel = likeModel;
    }
    return self;
}

-(BOOL)isLike{
    return _likeModel.isLike;
}

-(void)likeOrDisLikeOpretion:(CompletionHandler)completionHandler{
    if (self.likeModel.isLike) {
        [NetWork userDislikeThisBlogWithcompletionHandler:^(NSError * _Nonnull error, id  _Nonnull result) {
            self.likeModel.isLike = NO;
            //更新UI
            completionHandler();
        }];
    }else{
        [NetWork userLikeThisBlogWithcompletionHandler:^(NSError * _Nonnull error, id  _Nonnull result) {
             self.likeModel.isLike = YES;
            //更新UI
            completionHandler();
        }];
    }
}

@end
