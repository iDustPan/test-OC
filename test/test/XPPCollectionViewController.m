//
//  XPPCollectionViewController.m
//  test
//
//  Created by 徐攀 on 2017/3/9.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "XPPCollectionViewController.h"

@interface XPPCollectionViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate
>

@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation XPPCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self setupBasic];
    
}

- (void)setupBasic
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.collectionView = [self creatCollectionView];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.collectionView reloadData];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setBackgroundColor:[UIColor blackColor]];
    button.tintColor = [UIColor whiteColor];
    [button setTitle:@"已抢光" forState:UIControlStateDisabled];
    [button setTitle:@"立即购买" forState:UIControlStateNormal];
    button.enabled = arc4random_uniform(2);
    button.frame = CGRectMake(0, 160, 175, 40);
    [cell.contentView addSubview:button];
    return cell;
}


- (UICollectionView *)creatCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 30) / 2, 200);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                          collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    return collectionView;
}


@end
