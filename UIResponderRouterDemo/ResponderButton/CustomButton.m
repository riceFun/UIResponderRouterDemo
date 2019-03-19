//
//  CustomButton.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/7.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton ()

@property (strong,nonatomic)CAShapeLayer * shapeLayer;
@end
@implementation CustomButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setUp];
    }
    return self;
}
-(void)setUp{
    self.shapeLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil,100, 0);
    CGPathAddLineToPoint(path, nil,100,100);
    CGPathAddLineToPoint(path, nil,0, 100);
    self.shapeLayer.path = path;
    [self.layer setMask:self.shapeLayer];
    self.layer.masksToBounds = true;
    self.backgroundColor = [UIColor lightGrayColor];
}


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    if (CGPathContainsPoint(self.shapeLayer.path, nil, point, true)) {
        return [super pointInside:point withEvent:event];
    }else{
        return false;
    }
}

@end
