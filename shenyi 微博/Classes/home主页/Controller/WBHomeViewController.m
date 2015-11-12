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
    //下拉刷新
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewsStatus)];
    [self.tableView headerBeginRefreshing];
    //加载更多
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
}

//请求最新的微博数据

-(void)loadNewsStatus{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    dict[@"access_token"] =[WBAccountTool accout].access_token;
    //有最新微博数据 才需要下面的新属性
    if (self.statusArr.count) {
        dict[@"since_id"] = [self.statusArr[0] idstr];
       
    }

    [manager GET:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求到了数据  转化成模型
        [self.tableView headerEndRefreshing];
        NSArray *dictArr = responseObject[@"statuses"];
    
       NSArray *status = (NSMutableArray *)[WBStatusModel objectArrayWithKeyValuesArray:dictArr];
        //刷新数据
       
        //这个status 数组的范围
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, status.count)];
         //把status 数据插入到self.status数组中
        [self.statusArr insertObjects:status atIndexes:indexSet];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

-(void)loadMoreStatus{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *path = @"https://api.weibo.com/2/statuses/friends_timeline.json";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    dict[@"access_token"] =[WBAccountTool accout].access_token;
    //有最新微博数据 才需要下面的新属性
    if (self.statusArr.count) {
        long long maxId =[[[self.statusArr lastObject] idstr] longLongValue] - 1;
        dict[@"max_id"] = [NSString stringWithFormat:@"%lld",maxId];
        
    }
    
    [manager GET:path parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求到了数据  转化成模型
        [self.tableView footerEndRefreshing];
        NSArray *dictArr = responseObject[@"statuses"];
        
        NSArray *status = (NSMutableArray *)[WBStatusModel objectArrayWithKeyValuesArray:dictArr];
        //刷新数据
        [self.statusArr addObjectsFromArray:status];
        
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    

}
-(void)setUpNavigionBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] HeightLight:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(clickLeft) ControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_pop"] HeightLight:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(clickRight) ControlEvents:UIControlEventTouchUpInside];
    WBTitleButton *button = [WBTitleButton buttonWithType:UIButtonTypeCustom];
    _titleBtn = button;
    [button setTitle:@"首页" forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    
    [button addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    //高亮的适合不需要调整图片
    
    button.adjustsImageWhenHighlighted = NO;
    
    
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
