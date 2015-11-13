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
@interface WBHomeViewController ()<WBCoverDelegate>
@property(nonatomic,strong)WBOneViewController *one;
@property(nonatomic,weak)WBTitleButton *titleBtn;
@property(nonatomic,strong)NSMutableArray *statusArr;
@end

@implementation WBHomeViewController

- (NSMutableArray *)statusArr {
    if(_statusArr == nil) {
        _statusArr = [NSMutableArray array];
    }
    return _statusArr;
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
//    [self loadNewsStatus];
    
//    if ([WBAccountTool accout]) {
//        [self.titleBtn setTitle:[WBAccountTool accout].name forState:UIControlStateNormal];
//    }
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewsStatus)];
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
    
    if (self.statusArr.count) {
        sinceID = [self.statusArr[0] idstr];
        
    }
    [WBStatusTool getNewstatuesSinceId:sinceID success:^(NSArray *status) {
        
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, status.count)];
        
        [self.statusArr insertObjects:status atIndexes:indexSet];
        
        [self.tableView headerEndRefreshing];
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];


}
//加载更多数据
-(void)loadMoreStatus{
    NSString *maxId = nil;
    if (self.statusArr.count) {
        long long max =[[[self.statusArr lastObject] idstr] longLongValue] - 1;
       maxId = [NSString stringWithFormat:@"%lld",max];
        
    }
    [WBStatusTool getMoretatuesSinceId:maxId success:^(NSArray *status) {
   
        //刷新数据
        [self.tableView footerEndRefreshing];
        [self.statusArr addObjectsFromArray:status];
        
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

    return self.statusArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    //用户的名称
    WBStatusModel *model = self.statusArr[indexPath.row];
    cell.textLabel.text = model.user.name;
   
    [cell.imageView sd_setImageWithURL:model.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    cell.detailTextLabel.text = model.text;
    
    return cell;
}


@end
