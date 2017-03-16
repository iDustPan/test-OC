//
//  XPPCollectionViewController.m
//  test
//
//  Created by 徐攀 on 2017/3/9.
//  Copyright © 2017年 com.borderXLab. All rights reserved.
//

#import "XPPCollectionViewController.h"

static NSInteger const kPrefetchRowCount = 10;

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

/** Prefetch a certain number of images for rows prior to and subsequent to the currently visible cells
 *
 * @param  tableView   The tableview for which we're going to prefetch images.
 */

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self prefetchImagesForTableView:self.collectionView];
}

- (void)prefetchImagesForTableView:(UICollectionView *)tableView {
    NSArray *indexPaths = [self.collectionView indexPathsForVisibleItems];
    if ([indexPaths count] == 0) return;
    
    NSIndexPath *minimumIndexPath = indexPaths[0];
    NSIndexPath *maximumIndexPath = [indexPaths lastObject];
    
    // they should be sorted already, but if not, update min and max accordingly
    
    for (NSIndexPath *indexPath in indexPaths) {
        if ([minimumIndexPath compare:indexPath] == NSOrderedDescending)
            minimumIndexPath = indexPath;
        if ([maximumIndexPath compare:indexPath] == NSOrderedAscending)
            maximumIndexPath = indexPath;
    }
    
    // build array of imageURLs for cells to prefetch
    
    NSMutableArray<NSIndexPath *> *prefetchIndexPaths = [NSMutableArray array];
    
    NSArray<NSIndexPath *> *precedingRows = [self collectionView:tableView indexPathsForPrecedingRows:kPrefetchRowCount fromIndexPath:minimumIndexPath];
    [prefetchIndexPaths addObjectsFromArray:precedingRows];
    
    NSArray<NSIndexPath *> *followingRows = [self tableView:tableView indexPathsForFollowingRows:kPrefetchRowCount fromIndexPath:maximumIndexPath];
    [prefetchIndexPaths addObjectsFromArray:followingRows];
    
    NSLog(@"%@", prefetchIndexPaths);
    
    // build array of imageURLs for cells to prefetch (how you get the image URLs will vary based upon your implementation)
    
//    NSMutableArray<NSURL *> *urls = [NSMutableArray array];
//    for (NSIndexPath *indexPath in prefetchIndexPaths) {
//        NSURL *url = self.objects[indexPath.row].imageURL;
//        if (url) {
//            [urls addObject:url];
//        }
//    }
    
    // now prefetch
    
//    if ([urls count] > 0) {
//        [[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:urls];
//    }
}

/** Retrieve NSIndexPath for a certain number of rows preceding particular NSIndexPath in the table view.
 *
 * @param  collectionView  The tableview for which we're going to retrieve indexPaths.
 * @param  count      The number of rows to retrieve
 * @param  indexPath  The indexPath where we're going to start (presumably the first visible indexPath)
 *
 * @return            An array of indexPaths.
 */

- (NSArray<NSIndexPath *> *)collectionView:(UICollectionView *)collectionView indexPathsForPrecedingRows:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    
    for (NSInteger i = 0; i < count; i++) {
        if (row == 0) {
            if (section == 0) {
                return indexPaths;
            } else {
                section--;
                row = [collectionView numberOfItemsInSection:section] - 1;
            }
        } else {
            row--;
        }
        [indexPaths addObject:[NSIndexPath indexPathForItem:row inSection:section]];
    }
    
    return indexPaths;
}

/** Retrieve NSIndexPath for a certain number of following particular NSIndexPath in the table view.
 *
 * @param  collectionView  The tableview for which we're going to retrieve indexPaths.
 * @param  count      The number of rows to retrieve
 * @param  indexPath  The indexPath where we're going to start (presumably the last visible indexPath)
 *
 * @return            An array of indexPaths.
 */

- (NSArray<NSIndexPath *> *)tableView:(UICollectionView *)collectionView indexPathsForFollowingRows:(NSInteger)count fromIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *indexPaths = [NSMutableArray array];
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    NSInteger rowCountForSection = [collectionView numberOfItemsInSection:section];
    
    for (NSInteger i = 0; i < count; i++) {
        row++;
        if (row == rowCountForSection) {
            row = 0;
            section++;
            if (section == [collectionView numberOfSections]) {
                return indexPaths;
            }
            rowCountForSection = [collectionView numberOfItemsInSection:section];
        }
        [indexPaths addObject:[NSIndexPath indexPathForItem:row inSection:section]];
    }
    
    return indexPaths;
}

@end
