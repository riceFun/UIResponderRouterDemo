//
//  UIResponder+Router.h
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)
- (void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
