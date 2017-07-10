//
//  NavViewController.m
//  test
//
//  Created by 徐攀 on 2017/7/10.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()<UIViewControllerRestoration>

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    NavViewController *tabBar = [[NavViewController alloc] initWithNibName:nil bundle:nil];
    return tabBar;
}



@end
