//
//  WBClickPlusController.m
//  shenyi 微博
//
//  Created by apple-jd30 on 15/11/20.
//  Copyright © 2015年 apple-jd30. All rights reserved.
//

#import "WBClickPlusController.h"
#import "WBText.h"
#import "WBComposeTooBar.h"
#import "WBTextPhoto.h"
#import "WBComposeTool.h"
#import "MBProgressHUD+MJ.h"
@interface WBClickPlusController ()<UITextViewDelegate,WBComposeTooBarDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property(nonatomic,strong)  WBText *text;

@property(nonatomic,strong) WBComposeTooBar *tool;

@property(nonatomic,weak)WBTextPhoto *photo;

@property(nonatomic,strong) UIButton *rightbtn;

@property(nonatomic,strong)NSMutableArray *photoArr;
@end

@implementation WBClickPlusController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor whiteColor];
    [self setAllItem];
   //添加text
    
    [self addText];
    //添加工具条
    [self addToolBar];
}


- (NSMutableArray *)photoArr {
    if(_photoArr == nil) {
        _photoArr = [[NSMutableArray alloc] init];
    }
    return _photoArr;
}

#pragma mark 添加工具栏
-(void)addToolBar{
    CGFloat h = 35;
    CGFloat y = self.view.height - h;
    CGFloat w = self.view.width;
    _tool = [[WBComposeTooBar alloc]initWithFrame:CGRectMake(0, y, w, h)];
    _tool.delegate = self;
    [self.view addSubview:_tool];
}

#pragma mark 添加text
-(void)addText{
   
    self.text= [[WBText alloc]initWithFrame:self.view.bounds];
     _text.placeHolders = @"分享新鲜事...";
    [self.view addSubview:_text];
   //默认垂直方向拖拽
    _text.alwaysBounceVertical = YES;
    _text.font = [UIFont systemFontOfSize:18];
    // 监听文本框的输入
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeValue) name:UITextViewTextDidChangeNotification object:nil];
    //监听拖拽
     self.text.delegate = self;
    //监听键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardFarmeChange :) name:UIKeyboardWillChangeFrameNotification object:nil];
    //添加图片相册
    [self addphotoInText];
}
-(void)addphotoInText{
    WBTextPhoto *tPhoto = [[WBTextPhoto alloc]initWithFrame:CGRectMake(0, 80, self.view.width, self.view.height - 80)];
    _photo = tPhoto;
    [_text addSubview:tPhoto];
}
/**
 * 点击了toolBar的按钮触发

 */
#pragma mark WBComposeTooBarDelegate协议的方法
- (void)DidClickedButton:(WBComposeTooBar *)toolbar Selectindex:(NSInteger)index{
    //点击 了相册按钮
    if (index == 0) {
        //弹出系统相册
        UIImagePickerController *vc = [[UIImagePickerController alloc]init];
        //设置相册类型 相册集 ， 相机
        vc.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        //设置协议
        vc.delegate = self;
        [self presentViewController:vc animated:YES completion:nil];
        
    }
}
/**
 *  键盘的frame 发送改变调用
 */
-(void)keyBoardFarmeChange : (NSNotification *)notify{
    
    CGRect keyBFrame = [notify.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat duration = [notify.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    
    if (keyBFrame.origin.y == self.view.height) { // 没有弹起键盘
        //回到原点  设置动画
        [UIView animateWithDuration:duration animations:^{
              _tool.transform = CGAffineTransformIdentity;
        }];
   
    }else{  //弹起键盘
        [UIView animateWithDuration:duration animations:^{
            
        _tool.transform = CGAffineTransformMakeTranslation(0, -keyBFrame.size.height);
            
        }];
  
    }
    
}
#pragma mark UIImagePickerControllerDelegate 完成选择图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //选择的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    _photo.image = image;
    _rightbtn.enabled = YES;
    [self.photoArr addObject:image];
    //选择图片后就退出 图片选择
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
/**
 *  text的值发送改变 调用
 */
-(void)changeValue{
    
    if (_text.placeHolders.length) {
        [_text setIsTextChange:YES];
        _rightbtn.enabled = YES;
        
    }else{
        [_text setIsTextChange:NO];
        _rightbtn.enabled = NO;
    }
    
}

#pragma mark 设置导航栏的按钮
-(void)setAllItem{
    self.title = @"发送微博";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];
    UIButton *btn = [UIButton buttonWithType:0];
    _rightbtn = btn;
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    [btn addTarget:self action:@selector(compose) forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.text becomeFirstResponder];
}
- (void)dealloc{
  
        [[NSNotificationCenter defaultCenter]removeObserver:self];
}
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//
//}

/**
*  点击取消调用
*/
 -(void)dismiss{
        
     [self dismissViewControllerAnimated:YES completion:nil];
        
 }
/**
*  点击发送调用
*/
-(void)compose{
    //判断有没有图片
    if (self.photoArr.count) {
        //发送图片
        [self sendPic];
        
    }else{
        
        //发送文字
    [self sendTextMes];
        
    }
    
}
#pragma  mark 发送图片
-(void)sendPic{
    UIImage *image = self.photoArr[0];
    
    NSString *str = _text.text.length ? _text.text : @"分享图片";
    _rightbtn.enabled = NO;
    [WBComposeTool composePic:str image:image success:^{
          [MBProgressHUD showSuccess:@"分享成功"];
          [self dismissViewControllerAnimated:YES completion:nil];
        _rightbtn.enabled = YES;
    } failure:^(NSError *error) {
        if (error) {
           [MBProgressHUD showError:@"分享失败"];
        }
    }];

}
#pragma mark 发送文字
-(void)sendTextMes{
    [WBComposeTool composeMessage:_text.text success:^{
        
        [MBProgressHUD showSuccess:@"发送成功"];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } failure:^(NSError *error) {
        if (error) {
            [MBProgressHUD  showError:@"发送失败"];
        }
    }];
}

@end
