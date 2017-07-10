//
//  DetailViewController.m
//  test
//
//  Created by 徐攀 on 2017/7/10.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIViewControllerRestoration>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation DetailViewController


- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.restorationIdentifier = NSStringFromClass([self class]);
        self.restorationClass = [self class];
    }
    return self;
}

+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    DetailViewController *tabBar = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
    return tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableView];
    
}



@end
