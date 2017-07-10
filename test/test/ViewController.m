//
//  ViewController.m
//  test
//
//  Created by 徐攀 on 2016/12/24.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIViewControllerRestoration>



@end

@implementation ViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.restorationIdentifier = NSStringFromClass([self class]);
    }
    return self;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    ViewController *tabBar = [[ViewController alloc] initWithNibName:nil bundle:nil];
    return tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}


@end
