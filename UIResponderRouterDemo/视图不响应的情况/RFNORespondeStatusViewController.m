//
//  RFNORespondeStatusViewController.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/8.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "RFNORespondeStatusViewController.h"
#import "RFLabel.h"

@interface RFNORespondeStatusViewController ()
@property (weak, nonatomic) IBOutlet RFLabel *testLabel1;
@property (weak, nonatomic) IBOutlet UIButton *changeTestLabelStatusBtn;
@property (weak, nonatomic) IBOutlet UIButton *button2;

@end

@implementation RFNORespondeStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self NOenabledButton2];
    
    [self duogeView];
    
}

- (void)NOenabledButton2{
    self.button2.enabled = NO;
}

- (void)duogeView{
    RFLabel *bgLabel = [[RFLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.changeTestLabelStatusBtn.frame), 300, 300)];
    bgLabel.name = @"bgLabel";
    bgLabel.userInteractionEnabled = YES;
    bgLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgLabel];
    
    
    RFLabel *bgLabel1 = [[RFLabel alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    bgLabel1.name = @"bgLabel1";
    bgLabel1.userInteractionEnabled = YES;//1.
//    bgLabel1.userInteractionEnabled = NO;//2.
//    bgLabel1.enabled = NO;//3.
    
    bgLabel1.backgroundColor = [UIColor cyanColor];
    [bgLabel addSubview:bgLabel1];
    
    
    RFLabel *bgLabel2 = [[RFLabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    bgLabel2.name = @"bgLabel2";
    bgLabel2.userInteractionEnabled = YES;
    bgLabel2.backgroundColor = [UIColor blueColor];
    [bgLabel1 addSubview:bgLabel2];
}

- (IBAction)changeLabelStatus:(id)sender {
    self.testLabel1.userInteractionEnabled = !self.testLabel1.userInteractionEnabled;
    if (self.testLabel1.userInteractionEnabled) {
        self.testLabel1.text = [NSString stringWithFormat:@"userInteractionEnabled=Yes"];
    }else{
       self.testLabel1.text = [NSString stringWithFormat:@"userInteractionEnabled=NO"];
    }
}


@end
