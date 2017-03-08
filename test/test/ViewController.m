//
//  ViewController.m
//  test
//
//  Created by 徐攀 on 2016/12/24.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "ViewController.h"
#import <SDCycleScrollView.h>

@interface ViewController ()

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titles = @[@"这是第一篇文章", @"这是第二篇文章"];
    
    _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:nil placeholderImage:nil];
    _scrollView.onlyDisplayText = YES;
    _scrollView.titlesGroup = _titles;
    _scrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    _scrollView.frame = CGRectMake(30, 200, self.view.frame.size.width - 60, 33);
    _scrollView.titleLabelHeight = 33;
    _scrollView.titleLabelTextFont = [UIFont systemFontOfSize:12];
    _scrollView.titleLabelTextColor = [UIColor blueColor];
    [self.view addSubview:_scrollView];
    
    
    //master 提交

    //Tower在master上的提交

    //sourceTree在Tower上的提交
    
    // 这个说找tower上的提交

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
    // This is a method didReceiveMemoryWaining
    
    UIView *view = [UIView new];
    
    
    UIFont *font = [UIFont systemFontOfSize:12];
    
    //thi se test
    // 这是第三次提交
    
    // 这是master上的提交1
    
    
    // rebase1
    
    // 这个是tower的提交
    
    
    UIView *view2 = [UIView new];
    
    
    // 这是rebase4上第一次提交
}


@end
