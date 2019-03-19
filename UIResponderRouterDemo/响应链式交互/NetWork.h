//
//  NetWork.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^NetWorkCompletionHandler)(NSError *error, id result);
@interface NetWork : NSObject
+(void)userLikeThisBlogWithcompletionHandler:(NetWorkCompletionHandler)completionHandler;

+(void)userDislikeThisBlogWithcompletionHandler:(NetWorkCompletionHandler)completionHandler;


@end

NS_ASSUME_NONNULL_END
