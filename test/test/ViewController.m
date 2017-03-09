//
//  ViewController.m
//  test
//
//  Created by 徐攀 on 2016/12/24.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "ViewController.h"
#import "XPPCollectionViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *titles;


@end



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    XPPCollectionViewController *vc = [[XPPCollectionViewController alloc] init];
    vc.title = @"UICollectionView";
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
