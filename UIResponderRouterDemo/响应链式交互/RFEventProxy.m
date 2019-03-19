//
//  RFEventProxy.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "RFEventProxy.h"
#import "ResponderChainName.h"
#import "ViewController.h"

@interface RFEventProxy ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSInvocation *> *eventStrategy;
@end

@implementation RFEventProxy
+(RFEventProxy *)sharedInstance{
    static RFEventProxy *event = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        event = [[RFEventProxy alloc] init];
    });
    return event;
}

//添加响应关系
-(void)addRespondWithTarget:(id)target selector:(SEL)selector key:(NSString *)key{
    if (![self.eventStrategy objectForKey:key]) {
        [self.eventStrategy setObject:[self createInvocationWithTarget:target selector:selector] forKey:key];
    }
}

-(void)handleEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    NSInvocation *invocation = [self.eventStrategy objectForKey:eventName];
    if (invocation) {
        if (invocation.methodSignature.numberOfArguments > 2) {
            [invocation setArgument:&userInfo atIndex:2];
        }
        [invocation invoke];
    }
}

- (NSInvocation *)createInvocationWithTarget:(id)target selector:(SEL)action{
    if (!target) {
        return nil;
    }
    NSMethodSignature *methodSignature = [(NSObject *)target methodSignatureForSelector:action];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    invocation.selector = action;
    invocation.target = target;
    return invocation;
}

#pragma mark getter setter
//self.eventStrategy是一个字典，这个字典以eventName作key，对应的处理逻辑封装成NSInvocation来做value。
-(NSMutableDictionary<NSString *,NSInvocation *> *)eventStrategy{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
//                           kRFResponderCellButtonEvent:[self createInvocationWithTarget: selector:@selector(cellButtonEvent:)],
//                           kRFResponderCellDidselectEvent:[self createInvocationWithTarget:self selector:@selector(cellSelectEvent:)]

                           }.mutableCopy;
    }
    return _eventStrategy;
}

@end
