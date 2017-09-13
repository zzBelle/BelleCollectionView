//
//  ViewController.m
//  CollectionView
//
//  Created by 十月 on 2017/9/13.
//  Copyright © 2017年 October. All rights reserved.
//

#import "ViewController.h"
#import "PureCollectionViewLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,PureCeollectionDelegate>

@end

@implementation ViewController

static NSString *const shopCellId = @"PureCellId";

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupLayOut];

}

- (void)setupLayOut {
    //    创建布局
    PureCollectionViewLayout *layout = [[PureCollectionViewLayout alloc] init];
    layout.delegate = self;
    //    创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionView.dataSource = self;

    [self.view addSubview:collectionView];
    
    //    注册
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:shopCellId];
}

#pragma mark - UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:shopCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor orangeColor];
    
    NSInteger tag = 10;
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:tag];
    
    if (label == nil) {
        label = [[UILabel alloc] init];
        label.tag = tag;
        [cell.contentView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    [label sizeToFit];
    
    return cell;

}

#pragma mark -  PureCeollectionDelegate
- (CGFloat)columnCountInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout {
    return 4;
}

- (CGFloat)waterLayout:(PureCollectionViewLayout *)waterLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth {

    return 30 + arc4random_uniform(100);
}

- (CGFloat)rowMarginInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout {
    return 20;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
