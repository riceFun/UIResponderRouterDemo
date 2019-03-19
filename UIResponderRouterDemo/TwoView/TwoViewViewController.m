//
//  TwoViewViewController.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/8.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "TwoViewViewController.h"
#import "RFViewA.h"
#import "RFViewB.h"

@interface TwoViewViewController ()

@end

@implementation TwoViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RFViewA *viewA = [[RFViewA alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    viewA.backgroundColor = [UIColor blueColor];
    [self.view addSubview:viewA];
    
    RFViewB *viewB = [[RFViewB alloc]initWithFrame:CGRectMake(0, 200, 100, 100)];
    viewB.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewB];
    
/*****************************************************************************************/
    RFViewB *viewB1 = [[RFViewB alloc]initWithFrame:CGRectMake(150, 100, 150, 150)];
    viewB1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:viewB1];
    
    RFViewA *viewA1 = [[RFViewA alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    viewA1.backgroundColor = [UIColor cyanColor];
    [viewB1 addSubview:viewA1];
    
}

-(void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    if ([eventName isEqualToString:@"kkkkkkkkkk"]) {
        NSLog(@"TwoViewViewController 收到了 routerEvent");
    }
}

@end
