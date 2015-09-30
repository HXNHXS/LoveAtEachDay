//
//  MyTabBarController.m
//  LoveAtEachDay
//
//  Created by qianfeng on 15/9/5.
//  Copyright (c) 2015年 雪凝. All rights reserved.
//

#import "MyTabBarController.h"
#import "ContainerViewController.h"
#import "BaseViewController.h"
#import "NewsViewController.h"
#import "RootViewController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self createTabBarView];
    [self createView];
}

- (void)createView
{
    
    NSArray *title=@[@[@"首页", @"军事", @"社会", @"视频", @"华人", @"生活经", @"体育", @"财经", @"国际", @"两岸", @"娱乐", @"最新"]];
    
    NSArray *urlArr=@[@[kShouye, kJunShi, kShehui, kVideo, kHuaRen, kLife, kTiyu, kCaiJing, kGuoJi, kLiangAn, kYule, kZuixin]];
    
    NSArray *classArr=@[@"XinWenViewController", @"MilitarilyViewController" , @"SocietyViewController", @"VideoViewController", @"ChinesePeopleViewController", @"LiftWarpViewController", @"PEViewController", @"FinanceViewController", @"InternationalViewController", @"BothSidesViewController", @"AmuseViewController", @"LatestViewController"];
//    ,@"AudioVisualViewController"
    NSArray *classNameArr=@[@"NewsViewController",@"SearchViewController",@"InstallViewController"];
    
    NSArray *imageArr=@[@"1",@"3",@"4"];//,@"2"
    
    NSArray *selectImageArr=@[@"01",@"03",@"04"];//,@"2"
    
    NSArray *titleArr=@[@"新闻",@"搜索",@"设置"];//,@"视听"
    
    NSMutableArray *viewControllerArr=[[NSMutableArray alloc]init];
    
    for (NSInteger i=0; i<classNameArr.count; i++)
    {
        if (i<classNameArr.count-2)
        {
            NSMutableArray *vcArr=[[NSMutableArray alloc]init];
            
            ContainerViewController *contain=[[ContainerViewController alloc]init];
            
            for (NSInteger j=0; j<[title[i] count]; j++)
            {
                
                Class vcClass=NSClassFromString(classArr[j]);
                
                NewsViewController *vc=[[vcClass alloc]init];
                
                vc.url=urlArr[i][j];
                
                vc.title=title[i][j];
                
                [vcArr addObject:vc];
                
            }
            contain.viewControllers=vcArr;
            
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:contain];
            
            nav.tabBarItem.image=[[UIImage imageNamed:imageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectImageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            nav.tabBarItem.title=titleArr[i];
            
            [viewControllerArr addObject:nav];
            
        } else {
            
            Class vcClass=NSClassFromString(classNameArr[i]);
            BaseViewController *vc=[[vcClass alloc]init];
            
            UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:vc];
            
            nav.tabBarItem.image=[[UIImage imageNamed:imageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            nav.tabBarItem.selectedImage=[[UIImage imageNamed:selectImageArr[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            
            nav.tabBarItem.title=titleArr[i];
            
            [viewControllerArr addObject:nav];
        }
    }
    self.viewControllers=viewControllerArr;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
