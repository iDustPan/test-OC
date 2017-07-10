//
//  ViewController2.m
//  test
//
//  Created by 徐攀 on 2017/7/10.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "ViewController2.h"
#import "DetailViewController.h"

@interface ViewController2 ()<UIViewControllerRestoration>

@end

@implementation ViewController2

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    ViewController2 *tabBar = [[ViewController2 alloc] initWithNibName:nil bundle:nil];
    return tabBar;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(20, 100, 100, 50);
    [self.view addSubview:button];
    
}

- (void)push {
    DetailViewController *detailV = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:detailV animated:YES];
}


@end
