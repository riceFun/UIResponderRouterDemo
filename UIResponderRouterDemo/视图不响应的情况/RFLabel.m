//
//  RFLabel.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/8.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFLabel.h"

@implementation RFLabel

//-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return nil;
//}

//-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
//    return YES;
//}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@，响应了",self.name);
    
    [[self nextResponder] touchesBegan:touches withEvent:event];
    
    UIResponder * next = [self nextResponder];
    NSMutableString * prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}

@end
