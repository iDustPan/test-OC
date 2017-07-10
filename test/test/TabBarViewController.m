//
//  TabBarViewController.m
//  test
//
//  Created by 徐攀 on 2017/7/10.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "TabBarViewController.h"
#import "NavViewController.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface TabBarViewController ()<UIViewControllerRestoration>

@end

@implementation TabBarViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    TabBarViewController *tabBar = [[TabBarViewController alloc] initWithNibName:nil bundle:nil];
    return tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ViewController *vc = [[ViewController alloc] initWithNibName:nil bundle:nil];
    NavViewController *nav = [[NavViewController alloc] initWithRootViewController:vc];
    nav.title = @"vc";
    
    ViewController2 *vc2 = [[ViewController2 alloc] initWithNibName:nil bundle:nil];
    NavViewController *nav2 = [[NavViewController alloc] initWithRootViewController:vc2];
    nav2.title = @"vc2";
    
    [self setViewControllers:@[nav, nav2] animated:YES];
}



@end
