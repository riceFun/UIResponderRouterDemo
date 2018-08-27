//
//  RFEventProxy.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RFEventProxy : NSObject
+(RFEventProxy *)sharedInstance;
//添加响应关系
-(void)addRespondWithTarget:(id)target selector:(SEL)selector key:(NSString *)key;

-(void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
