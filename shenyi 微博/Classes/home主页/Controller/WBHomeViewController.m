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
@interface WBHomeViewController ()<WBCoverDelegate>
@property(nonatomic,strong)WBOneViewController *one;
@property(nonatomic,strong)WBTitleButton *titleBtn;
@end

@implementation WBHomeViewController

- (WBTitleButton *)titleBtn {
    if(_titleBtn == nil) {
        _titleBtn = [[WBTitleButton alloc] init];
        
    }
    return _titleBtn;
}

- (WBOneViewController *)one {
    if(_one == nil) {
        _one = [[WBOneViewController alloc] init];
    }
    return _one;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    +(UIBarButtonItem *)initWithImage:(UIImage *)image HeightLight : (UIImage *)hImage  target : (id )target action : (SEL)sel ControlEvents :(UIControlEvents)controlEvents
     self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_friendsearch"] HeightLight:[UIImage imageNamed:@"navigationbar_friendsearch_highlighted"] target:self action:@selector(clickLeft) ControlEvents:UIControlEventTouchUpInside];
    
  
     self.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImage:[UIImage imageNamed:@"navigationbar_pop"] HeightLight:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(clickRight) ControlEvents:UIControlEventTouchUpInside];
//    WBTitleButton *button = [WBTitleButton buttonWithType:0];
//    _titleBtn = button;
    [self.titleBtn setTitle:@"首页" forState:UIControlStateNormal];
    [_titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    [_titleBtn setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateSelected];
    [_titleBtn addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
    
    //高亮的适合不需要调整图片

    _titleBtn.adjustsImageWhenHighlighted = NO;
    

    self.navigationItem.titleView = _titleBtn;
    
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




@end
