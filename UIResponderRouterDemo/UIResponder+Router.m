//
//  UIResponder+Router.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
- (void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    [[self nextResponder] routerEventName:eventName userInfo:userInfo];
}

@end
