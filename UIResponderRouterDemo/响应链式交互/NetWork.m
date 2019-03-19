//
//  NetWork.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork
+(void)userLikeThisBlogWithcompletionHandler:(NetWorkCompletionHandler)completionHandler{
    
    NSUInteger delayTime = 1.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !completionHandler ?: completionHandler(nil, @(YES));
    });
}

+(void)userDislikeThisBlogWithcompletionHandler:(NetWorkCompletionHandler)completionHandler{
    
    NSUInteger delayTime = 1.5;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !completionHandler ?: completionHandler(nil, @(NO));
    });
}


@end
