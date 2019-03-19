//
//  RFEventView.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/7.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFEventView.h"
#import "UIResponder+Router.h"

@implementation RFEventView

-(void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    [[self nextResponder] routerEventName:eventName userInfo:userInfo];
}

//判断触摸点是否在View中  这个View 就是下面返回的View
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    //返回 NO 就代表 拥有这个点的UI对象 不响应这个事件  所以可以通过point判断位置 来控制控件是否响应点击、滑动等触摸事件
    return false;
}

//返回触摸点所在的View，然后递归检查起subview
//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    //如果返回空 那么就不会进入 上面的方法
//    return nil;
//}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIResponder * next = [self nextResponder];
    NSMutableString * prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}

@end
