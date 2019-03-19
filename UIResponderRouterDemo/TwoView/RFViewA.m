//
//  RFViewA.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/8.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFViewA.h"
#import "UIResponder+Router.h"

@implementation RFViewA

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.nextResponder routerEventName:@"kkkkkkkkkk" userInfo:@{@"like":@"drinking"}];
    
    UIResponder * next = [self nextResponder];
    NSMutableString * prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}

@end
