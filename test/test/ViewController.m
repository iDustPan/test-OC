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

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) NSInteger idx;

@end

@implementation ViewController
//21行有个操作
//我也在21行有操作
- (void)viewDidLoad {
    [super viewDidLoad];
  
    NSMutableArray *muta = [NSMutableArray array];
    
    dispatch_queue_t seriaQue = dispatch_queue_create("pan.text.que", DISPATCH_QUEUE_SERIAL);
    NSLog(@"outbegin");
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(100, 1000);
    self.scrollView.frame = self.view.bounds;
    [self.view addSubview:self.scrollView];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        for (int i = 0; i < 5; i ++) {
            NSLog(@"begin%d", i);
            dispatch_barrier_async(seriaQue, ^{
                
                [muta removeAllObjects];
                for (int i = 0; i < 1000; i++) {
                    NSLog(@"%@--%d", [NSThread currentThread], i);
                    [muta addObject:@(i)];
                }
                
                
                for (NSNumber *number in muta) {
                    NSLog(@"output:%d", [number intValue]);
                }
                NSLog(@"end%d", i);
            });
        }
    });
    
    NSLog(@"outEnd");
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
    
    // rebase4第二次提交
}


@end
