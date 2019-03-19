//
//  ViewController.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2018/8/27.
//  Copyright © 2018年 riceFun. All rights reserved.
//

#import "ViewController.h"

//#import "RFResponderCell.h"
//#import "RFHeaderView.h"
//
//#import "UIResponder+Router.h"
//#import "RFEventProxy.h"
//#import "ResponderChainName.h"

@interface ViewController ()

@end

@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
    
    
//    [self setupUI];
//
//    [self addEventBind];
//
//}
//
////添加子视图响应关系
//- (void)addEventBind{
////    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellButtnClick:) key:kRFResponderCellButtonEvent];
////    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellSelect:) key:kRFResponderCellDidselectEvent];
////    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellHeaderViewButtonEvent:) key:kRFResponderCellHeaderVeiwButtonEvent];
//}
//
//- (void)setupUI{
//    [self.view addSubview:self.tableView];
//}
//
//#pragma mark UIResponder Event
//-(void)cellButtnClick:(NSDictionary *)userInfo{
//    NSLog(@"你点击了button%@",userInfo[@"name"]);
//}
//
//-(void)cellSelect:(NSDictionary *)userInfo{
//    NSLog(@"你点击了整个cell%@",userInfo[@"name"]);
//}
//
//-(void)cellHeaderViewButtonEvent:(NSDictionary *)userInfo{
//    NSLog(@"点击了tableView headerView button");
//}
//
//
//#pragma mark uitableViewdatasource & delegate
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 30;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 44;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    RFResponderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dddd" forIndexPath:indexPath];
//    [cell updateCell:indexPath];
//
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
////    [[RFEventProxy sharedInstance] handleEvent:kRFResponderCellDidselectEvent userInfo:@{@"name":indexPath}];
//    [self routerEventName:kRFResponderCellDidselectEvent userInfo:nil];
//}
//
//-(void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
////    [[RFEventProxy sharedInstance] handleEvent:eventName userInfo:userInfo];
//    if ([eventName isEqualToString:kRFResponderCellDidselectEvent]) {
//        NSLog(@"你点击了整个cell%@",userInfo[@"name"]);
//    }else if ([eventName isEqualToString:kRFResponderCellButtonEvent]){
//        NSLog(@"你点击了button%@",userInfo[@"name"]);
//    }else if ([eventName isEqualToString:kRFResponderCellHeaderVeiwButtonEvent]){
//        NSLog(@"点击了tableView headerView button");
//    }
//}
//
//#pragma mark getter setter
//-(UITableView *)tableView{
//    if (!_tableView) {
//        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.tableHeaderView = self.tableHeaderView;
//        [_tableView registerClass:[RFResponderCell class] forCellReuseIdentifier:@"dddd"];
//    }
//    return _tableView;
//}
//
//-(RFHeaderView *)tableHeaderView{
//    if (!_tableHeaderView) {
//        _tableHeaderView = [[RFHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
//    }
//    return _tableHeaderView;
//}

@end
