//
//  BasicTabBarViewController.m
//  ttkhj-ios
//
//  Created by ning on 16/10/25.
//  Copyright © 2016年 songjk. All rights reserved.
//

#import "BasicTabBarViewController.h"

#import "CCNavigationController.h"
#import "RequestTools.h"
@interface BasicTabBarViewController ()

@end

@implementation BasicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    NSArray *titles = @[@"首页",@"分类",@"社区",@"搜索",@"我的"];
    
    HJHomeViewController *homeVc = [[HJHomeViewController alloc] init];
    homeVc.title = titles[0];
    CCNavigationController *homeNav = [[CCNavigationController alloc] initWithRootViewController:homeVc];
    
    ClassifyViewController *classVc = [[ClassifyViewController alloc] init];
    classVc.title = titles[1];
    CCNavigationController *classNav = [[CCNavigationController alloc] initWithRootViewController:classVc];
    
    
    CommunityWebViewController *comVC = [[CommunityWebViewController alloc] initWithUrl:[RequestTools communityHomeWithOp:@"concern"]];
    comVC.title = titles[2];
    CCNavigationController *comNav = [[CCNavigationController alloc] initWithRootViewController:comVC];
    
    
    SearchViewController *searchVc = [[SearchViewController alloc] init];
    searchVc.title = titles[3];
    CCNavigationController *searchNav = [[CCNavigationController alloc] initWithRootViewController:searchVc];
    
    MineViewController *mineVc = [[MineViewController alloc] init];
    mineVc.title = titles[4];
    CCNavigationController *minnav = [[CCNavigationController alloc] initWithRootViewController:mineVc];
    
    homeVc.tabBarItem.image = [UIImage imageNamed:@"正常_03"];
    homeVc.tabBarItem.selectedImage = [UIImage imageNamed:@"按下-30_06"];
    
    classVc.tabBarItem.image = [UIImage imageNamed:@"正常_08"];
    classVc.tabBarItem.selectedImage = [UIImage imageNamed:@"按下-30_11"];
    
    comVC.tabBarItem.image = [UIImage imageNamed:@"正常_11"];
    comVC.tabBarItem.selectedImage = [UIImage imageNamed:@"按下-30_14"];
    
    searchVc.tabBarItem.image = [UIImage imageNamed:@"正常_05"];
    searchVc.tabBarItem.selectedImage = [UIImage imageNamed:@"按下-30_08"];
    
    mineVc.tabBarItem.image = [UIImage imageNamed:@"正常_14"];
    mineVc.tabBarItem.selectedImage = [UIImage imageNamed:@"按下-30_03"];
    
    self.tabBar.tintColor = NAVOrange;
    self.viewControllers = @[homeNav,classNav,comNav,searchNav,minnav];
     */
    
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
