//
//  MyTabBarController.m
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [UITabBar appearance].barTintColor = [UIColor greenColor];
    
    UIFont *font = [UIFont fontWithName:@"OriyaSangamMN" size:18.0f];
    NSDictionary *attribute1 = @{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor redColor]};
    NSDictionary *attribute2 = @{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor blackColor]};
    
    [[UITabBarItem appearance] setTitleTextAttributes:attribute1 forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:attribute2 forState:UIControlStateNormal];
    
    UINavigationController *controller1 = [[UINavigationController alloc] initWithRootViewController:[[LocalViewController alloc]init]];
    UINavigationController *controller2 = [[UINavigationController alloc] initWithRootViewController:[[CloudViewController alloc] init]];
    UINavigationController *controller3 = [[UINavigationController alloc] initWithRootViewController:[[UserViewController alloc] init]];
    
    self.viewControllers = @[controller1, controller2, controller3];
    controller1.tabBarItem.title = @"Local";
    controller2.tabBarItem.title = @"Cloud";
    controller3.tabBarItem.title = @"User";
    
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//// Screen rotation.
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

@end
