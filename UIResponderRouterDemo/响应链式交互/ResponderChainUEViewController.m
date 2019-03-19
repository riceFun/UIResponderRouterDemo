//
//  ResponderChainUEViewController.m
//  UIResponderRouterDemo
//
//  Created by riceFun on 2019/1/9.
//  Copyright © 2019 riceFun. All rights reserved.
//

#import "ResponderChainUEViewController.h"

#import "RFResponderCell.h"
#import "RFHeaderView.h"

#import "RFResponderCell2.h"
#import "LikeCellPresent.h"

#import "UIResponder+Router.h"
#import "RFEventProxy.h"
#import "ResponderChainName.h"

#import <SVProgressHUD/SVProgressHUD.h>




@interface ResponderChainUEViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) RFHeaderView *tableHeaderView;

@property (nonatomic,strong) LikeCellPresent *likeCellPresent;
@end

@implementation ResponderChainUEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self setupUI];
    
    [self addEventBind];
    
}

-(void)initData{
    LikeModel *model = [[LikeModel alloc]init];
    model.isLike = YES;
    self.likeCellPresent = [LikeCellPresent configWithLikeModel:model];
}

//添加子视图响应关系
- (void)addEventBind{
    //    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellButtnClick:) key:kRFResponderCellButtonEvent];
    //    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellSelect:) key:kRFResponderCellDidselectEvent];
    //    [[RFEventProxy sharedInstance] addRespondWithTarget:self selector:@selector(cellHeaderViewButtonEvent:) key:kRFResponderCellHeaderVeiwButtonEvent];
}

- (void)setupUI{
    [self.view addSubview:self.tableView];
}

#pragma mark UIResponder Event
-(void)cellButtnClick:(NSDictionary *)userInfo{
    NSLog(@"你点击了button%@",userInfo[@"name"]);
}

-(void)cellSelect:(NSDictionary *)userInfo{
    NSLog(@"你点击了整个cell%@",userInfo[@"name"]);
}

-(void)cellHeaderViewButtonEvent:(NSDictionary *)userInfo{
    NSLog(@"点击了tableView headerView button");
}


#pragma mark uitableViewdatasource & delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RFResponderCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"kkkkkkk" forIndexPath:indexPath];
        cell.likeCellPresent = self.likeCellPresent;
//        cell.likeBlock = ^(id  _Nonnull model) {
//            //喜欢 或者不喜欢 操作
//        };
        return cell;
    }else{
        RFResponderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dddd" forIndexPath:indexPath];
        [cell updateCell:indexPath];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    [[RFEventProxy sharedInstance] handleEvent:kRFResponderCellDidselectEvent userInfo:@{@"name":indexPath}];
    [self routerEventName:kRFResponderCellDidselectEvent userInfo:nil];
}

-(void)routerEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    //    [[RFEventProxy sharedInstance] handleEvent:eventName userInfo:userInfo];
    if ([eventName isEqualToString:kRFResponderCellDidselectEvent]) {
        NSLog(@"你点击了整个cell%@",userInfo[@"name"]);
    }else if ([eventName isEqualToString:kRFResponderCellButtonEvent]){
        NSLog(@"你点击了button%@",userInfo[@"name"]);
    }else if ([eventName isEqualToString:kRFResponderCellHeaderVeiwButtonEvent]){
        NSLog(@"点击了tableView headerView button");
    }else if ([eventName isEqualToString:kRFResponderCellDislikeButtonEvent]){
        
        LikeCellPresent *likeCellPresent = userInfo[@"LikeCellPresent"];
        __weak typeof (self)weakSelf = self;
        if (likeCellPresent.isLike) {
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"确认不再喜欢了吗" message:nil preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:nil];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                [SVProgressHUD show];
                [likeCellPresent likeOrDisLikeOpretion:^{
                    [SVProgressHUD dismiss];
                    [weakSelf.tableView reloadData];
                }];
            }];
            [alertVC addAction:cancelAction];
            [alertVC addAction:okAction];
            [self.navigationController presentViewController:alertVC animated:YES completion:nil];
        }else{
            [SVProgressHUD show];
            [likeCellPresent likeOrDisLikeOpretion:^{
                [SVProgressHUD dismiss];
                [weakSelf.tableView reloadData];
            }];
        }
        
    }
}

#pragma mark getter setter
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.tableHeaderView;
        [_tableView registerClass:[RFResponderCell class] forCellReuseIdentifier:@"dddd"];
        [_tableView registerClass:[RFResponderCell2 class] forCellReuseIdentifier:@"kkkkkkk"];
    }
    return _tableView;
}

-(RFHeaderView *)tableHeaderView{
    if (!_tableHeaderView) {
        _tableHeaderView = [[RFHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    }
    return _tableHeaderView;
}

@end
