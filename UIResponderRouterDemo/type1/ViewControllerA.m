//
//  ViewControllerA.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/7.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "ViewControllerA.h"
#import "UIResponder+Router.h"
#import "RFEventView.h"

@interface ViewControllerA ()
@property (nonatomic,strong) UIView *bgView;

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgView];
//    NSArray *views = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1"];
    for (int i = 0; i < 10 ; i++) {
        RFEventView *view = [[RFEventView alloc]initWithFrame:CGRectMake(0, 0, 300 - i* 10, 400 - i * 10)];
        
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        view.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
        [self.view addSubview:view];
        
        if (i == 9) {
//            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:<#(nullable SEL)#>];
//            tap addTarget:<#(nonnull id)#> action:<#(nonnull SEL)#>
        }
        
        
    }
    
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    }
    return _bgView;
}

@end
