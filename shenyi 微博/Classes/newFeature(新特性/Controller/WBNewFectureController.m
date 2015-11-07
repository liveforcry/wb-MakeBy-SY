//
//  WBNewFectureController.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/7.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBNewFectureController.h"
#import "WBNewFectureCell.h"
@interface WBNewFectureController ()
@property(nonatomic,strong)UIPageControl *page;
@end

@implementation WBNewFectureController

static NSString *ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    [self.collectionView registerClass:[WBNewFectureCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self setPageController];
}

-(void)setPageController{
    UIPageControl *page = [[UIPageControl alloc]init];
    _page =  page;
    page.numberOfPages = 4;
    page.userInteractionEnabled = NO;
    page.pageIndicatorTintColor = [UIColor grayColor];
    page.currentPageIndicatorTintColor = [UIColor redColor];
    page.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.95 );
    
    [self.view addSubview:page];
}
- (instancetype)init{
//    if (self = [super init]) {
    // 因为这里的类不需要对自己属性 初始化 或赋值 就 直接返回
//    }
    // 设置流动布局
    UICollectionViewFlowLayout *view = [[UICollectionViewFlowLayout alloc]init];
    //设置item 的大小
    view.itemSize= [UIScreen mainScreen].bounds.size;
    //设置行间距
    view.minimumLineSpacing = 0;
    //设置滚动的方向--- horizontal 水平滚动
    view.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:view];
}

#pragma mark uicollectionViewControllDelegete 
//返回有几个区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
// 返回有有个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
  //dequeueReusableCellWithReuseIdentifier 下面的原理底层
    //1: 从缓冲层中去cell
    //2: 如果没有的话 就会根据注册的cell 新建
    //3: 否则就会报错
    WBNewFectureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];

    NSString *imagePath = [NSString stringWithFormat:@"new_feature_%ld", indexPath.row + 1];
    cell.image = [UIImage imageNamed:imagePath];
    [cell setIndexLastRow:indexPath count:4];
    return cell;
}

#pragma mark uiscrollView
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index=scrollView.contentOffset.x / self.view.width;
    self.page.currentPage = index;
}











@end
