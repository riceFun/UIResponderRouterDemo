//
//  RFViewB.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/8.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFViewB.h"
#import "UIResponder+Router.h"


@implementation RFViewB

-(void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    if ([eventName isEqualToString:@"kkkkkkkkkk"]) {
        NSLog(@"RFViewB 收到了 routerEvent");
    }
    
    [self.nextResponder routerEventName:eventName userInfo:userInfo];
    
    
}

@end
