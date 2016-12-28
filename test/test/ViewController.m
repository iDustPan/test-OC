//
//  ViewController.m
//  test
//
//  Created by 徐攀 on 2016/12/24.
//  Copyright © 2016年 com.borderXLab. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *redButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.redButton addTarget:self
                       action:@selector(redButtonTouchAction:)
             forControlEvents:UIControlEventTouchUpInside];
    [self.redButton setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:self.redButton];
    [self.redButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
    }];
    
}


- (void)redButtonTouchAction:(UIButton *)sender
{
    TableViewController *tableVC = [[TableViewController alloc] init];
    [self showViewController:tableVC sender:nil];
    
    sender.selected = !sender.selected;
    CGFloat buttonHeight = sender.selected ? 100 : 50;
//    (
//     "<MASLayoutConstraint:0x6000000baa00 UIButton:0x7fc1a270a360.height == 50>",
//     "<MASLayoutConstraint:0x6000000bad60 UIButton:0x7fc1a270a360.height == 100>"
//     )
//    
//    Will attempt to recover by breaking constraint
//    <MASLayoutConstraint:0x6000000bad60 UIButton:0x7fc1a270a360.height == 100>
    
//    [self.redButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//        make.left.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
//        make.height.mas_equalTo(100);
//    }];
    
    [self.redButton mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//        make.left.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(buttonHeight);
    }];

//    [self.redButton mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(100);
//        make.left.mas_equalTo(10);
//        make.right.mas_equalTo(-10);
//        make.height.mas_equalTo(buttonHeight);
//    }];
    
    
    [UIView animateWithDuration:0.6
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:10
                        options:0
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:^(BOOL finished) {
                         
                     }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
