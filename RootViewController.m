//
//  RootViewController.m
//  LoveAtEachDay
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 雪凝. All rights reserved.
//

#import "RootViewController.h"
#import "MyTabBarController.h"

#define KCellId @"UICollectionViewCell"

#import "ContainerViewController.h"

@interface RootViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createCollectionView];
}

#pragma mark - UICollectionView

- (void)createCollectionView
{
    self.data = [[NSMutableArray alloc] initWithObjects:@"help1",@"help2",@"help3", nil];
    
    //UICollectionView的布局 都要依赖于 layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //所有的cell 的大小 屏幕大小
    layout.itemSize = kScreenSize;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //间距
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenSize.width, kScreenSize.height) collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    //注册 cell 需要注册
    [self.collectionView registerClass:[UICollectionViewCell  class] forCellWithReuseIdentifier:KCellId];
    //按页滚动
    self.collectionView.pagingEnabled = YES;
    
}


#pragma make -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KCellId forIndexPath:indexPath];
    //设置背景
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data[indexPath.row]]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.data.count-1) {
        //点击的是最后一个
#if 0
        //模态跳转到 tabBar
        MyTabBarController *picket = [[MyTabBarController alloc] init];
        [self presentViewController:picket animated:YES completion:nil];
#else
        //把window的跟视图控制器 换成PicketKitchenTabBarController
        MyTabBarController *picket = [[MyTabBarController alloc] init];
        //获取window
        //UIWindow *window = self.view.window;//和下边的一样
        UIWindow *window = [[UIApplication sharedApplication] keyWindow];
        
        window.rootViewController = picket;
#endif
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
