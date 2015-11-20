//
//  WBHomeViewController.m
//  shenyi weibo
//
//  Created by apple-jd30 on 15/11/4.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBHomeViewController.h"
#import "WBOneViewController.h"
#import "WBTitleButton.h"
#import "WBCover.h"
#import "WBPopMenu.h"
#import "UIBarButtonItem+WBItem.h"
#import "AFNetworking.h"
#import "WBAccountTool.h"
#import "MJExtension.h"
#import "WBStatusModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "WBHttp.h"
#import "WBStatusTool.h"
#import "WBParam.h"
#import "WBUserTool.h"
#import "WBStatusCell.h"
#import "WBViewModel.h"

@interface WBHomeViewController ()<WBCoverDelegate>
@property(nonatomic,strong)WBOneViewController *one;
@property(nonatomic,weak)WBTitleButton *titleBtn;
/**
 *  ViewModel  WBViewModel
 */
@property(nonatomic,strong)NSMutableArray *statusArrFrame;
@end

@implementation WBHomeViewController

- (NSMutableArray *)statusArrFrame {
    if(_statusArrFrame == nil) {
        _statusArrFrame = [NSMutableArray array];
    }
    return _statusArrFrame;
}

-(void)refresh{
    [self.tableView headerBeginRefreshing];
}
- (WBOneViewController *)one {
    if(_one == nil) {
        _one = [[WBOneViewController alloc] init];
    }
    return _one;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigionBar];
    self.tableView.backgroundColor = [UIColor colorWithRed:213 / 250.0 green:214 / 250.0 blue:215 / 250.0 alpha:1];
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewsStatus)];
    self.tableView.separatorStyle =   UITableViewCellSeparatorStyleNone;
    [self.tableView headerBeginRefreshing];
    //加载更多
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    //获取当前用户名
    [WBUserTool GetUserInformation:^(WBUserModel *result) {

        [self.titleBtn setTitle:result.name forState:UIControlStateNormal];
        //获取当前用户
       WBAccout *accout =  [WBAccountTool accout];
        //把用户的名字添加到账号类中 在其中添加name 属性
        accout.name = result.name;
        //保存用户
        [WBAccountTool  saveAccout:accout];
        
    } :^(NSError *error) {
        
    }];
    
}




//请求最新的微博数据

-(void)loadNewsStatus{
    NSString *sinceID = nil;
    
    if (self.statusArrFrame.count) {
        WBViewModel *model = self.statusArrFrame[0];
        sinceID = model.status.idstr;
        
    }
    [WBStatusTool getNewstatuesSinceId:sinceID success:^(NSArray *status) {
        // 显示几条微博数  有最新微博的适合
        [self showNumberStatus:status.count];
        
//        WBStatusModel -- >WBViewModel  模型转 ViewModel
        NSMutableArray *dict = [NSMutableArray array];
        for (WBStatusModel *model in status) {
            WBViewModel *viewModel = [[WBViewModel alloc]init];
            viewModel.status = model;
            [dict addObject:viewModel];
        }
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, status.count)];
        
        [self.statusArrFrame insertObjects:dict atIndexes:indexSet];
        
        [self.tableView headerEndRefreshing];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    }
//显示几条微博数量
-(void)showNumberStatus : (NSInteger)number{
    //没有微博就不显示
    if (number == 0) {
        return;
    }
    //显示最新微博数
    NSInteger width =self.view.width;
    NSInteger height = 35;
    NSInteger x = 0;
    
    NSInteger h = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    NSInteger y = h - height;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.text = [NSString stringWithFormat:@"最新微博数%ld", number];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
//    [self.view addSubview:label];
    //在navigation控制器里面添加label
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    //添加动画
    //向下的动画
    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, height);
    } completion:^(BOOL finished) {
        
        [UIView  animateWithDuration:0.25 delay:1 options:UIViewAnimationOptionCurveLinear  animations:^{
            //返回原地方  还原
            label.transform = CGAffineTransformIdentity;
          
            
        } completion:^(BOOL finished) {
            //移除label
            [label removeFromSuperview];
        }];
    }];
}
//加载更多数据
-(void)loadMoreStatus{
    NSString *maxId = nil;
    if (self.statusArrFrame.count) {
        WBViewModel *model = [self.statusArrFrame lastObject];
        long long max =[model.status.idstr longLongValue] - 1;
       maxId = [NSString stringWithFormat:@"%lld",max];
        
    }
    [WBStatusTool getMoretatuesSinceId:maxId success:^(NSArray *status) {
   
        //刷新数据
        [self.tableView footerEndRefreshing];
        
        //        WBStatusModel -- >WBViewModel  模型转 ViewModel
        NSMutableArray *dict = [NSMutableArray array];
        for (WBStatusModel *model in status) {
            WBViewModel *viewModel = [[WBViewModel alloc]init];
            viewModel.status = model;
            [dict addObject:viewModel];
        }

        
        [self.statusArrFrame addObjectsFromArray:dict];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];

   


}
-(void)setUpNavigionBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] HeightLight:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(clickLeft) ControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_pop"] HeightLight:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(clickRight) ControlEvents:UIControlEventTouchUpInside];
    WBTitleButton *button = [WBTitleButton buttonWithType:UIButtonTypeCustom];
    _titleBtn = button;
    //判是否有用户
    NSString *titleName = [WBAccountTool accout].name ? :@"首页";
    [button setTitle:titleName forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    //高亮的适合不需要调整图片
    
    button.adjustsImageWhenHighlighted = NO;
    
    [button addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
    self.navigationItem.titleView = button;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击了左边的按钮
-(void)clickLeft{
    
}

//点击了右边的按钮
-(void)clickRight{
    
    WBOneViewController *vc = [[ WBOneViewController alloc]init];
    //当push 的时候 就会隐藏底部条
    //前提条件： 只会隐藏系统自带的tabbar
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma  mark CoverDelegate

-(void)clickCover :(WBCover *)cover{
    //隐藏pop 菜单
    [WBPopMenu hide];
    self.titleBtn.selected = NO;
    
}
-(void)clickTitle : (UIButton *)button{
    NSLog(@"clickTitle");
    button.selected = !button.selected;
    //弹出蒙版
    WBCover *cover = [WBCover showCover];
    cover.delegate =self;
    CGFloat popW = 200;
    CGFloat popH = popW;
    CGFloat popX = (self.view.width - popW) * 0.5;
    CGFloat popY = 55;
    WBPopMenu *menu = [WBPopMenu showRect:CGRectMake(popX, popY, popW, popH)];
    menu.conteView = self.one.view;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.statusArrFrame.count;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   WBStatusCell *cell =  [WBStatusCell getCellFromTabel:tableView];
       //用户的名称

    cell.statusViewModel = self.statusArrFrame[indexPath.row];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WBViewModel *viewMode = self.statusArrFrame[indexPath.row];
    return viewMode.cellTotalHeight;
}
@end
