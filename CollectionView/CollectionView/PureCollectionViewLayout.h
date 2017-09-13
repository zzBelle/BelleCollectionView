//
//  PureCollectionViewLayout.h
//  CollectionView
//
//  Created by 十月 on 2017/9/13.
//  Copyright © 2017年 October. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PureCollectionViewLayout;
@protocol PureCeollectionDelegate <NSObject>

@required
-(CGFloat)waterLayout:(PureCollectionViewLayout *)waterLayout heightForItemAtIndex:(NSInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout;
- (CGFloat)rowMarginInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout;
- (CGFloat)columnMarginInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout;
- (UIEdgeInsets)edgeInsetsInWaterViewLayOut:(PureCollectionViewLayout *)pureCollectionViewLayout;

@end


@interface PureCollectionViewLayout : UICollectionViewLayout
@property (nonatomic ,weak) id <PureCeollectionDelegate> delegate;
@end
