//
//  PureCollectionViewLayout.m
//  CollectionView
//
//  Created by 十月 on 2017/9/13.
//  Copyright © 2017年 October. All rights reserved.
//

#import "PureCollectionViewLayout.h"

static const CGFloat PureDefaultColumnCount = 3;//列数

static const CGFloat PureDefaultColumnMargin = 10;//列间距

static const CGFloat PureDefaultRowMargin = 10;//行间距

static const UIEdgeInsets PureDefaultEdgeInsets = {10,10,10,10};//边缘间距

@interface PureCollectionViewLayout ()
//存放所有cell的布局属性
@property (nonatomic, strong) NSMutableArray *attrsArray;
//存放所有列的高度
@property (nonatomic, strong) NSMutableArray *columnHeights;

@property (nonatomic, assign) CGFloat contentHeight;//内容高度
- (CGFloat)rowMargin;
- (CGFloat)columnMargin;
- (CGFloat)columnCount;
- (UIEdgeInsets)edgeInsets;
@end

@implementation PureCollectionViewLayout
#pragma mark - Source
- (CGFloat)rowMargin {
    if ([self.delegate respondsToSelector:@selector(rowMarginInWaterViewLayOut:)]) {
        return [self.delegate rowMarginInWaterViewLayOut:self];
    }else {
        return PureDefaultRowMargin;
    }
}

- (CGFloat)columnMargin {
    if ([self.delegate respondsToSelector:@selector(columnMarginInWaterViewLayOut:)]) {
        return [self.delegate columnMarginInWaterViewLayOut:self];
    }else {
        return PureDefaultColumnMargin;
    }
}

- (CGFloat)columnCount {
    if ([self.delegate respondsToSelector:@selector(columnCountInWaterViewLayOut:)]) {
        return [self.delegate columnCountInWaterViewLayOut:self];
    }else {
        return PureDefaultColumnCount;
    }
}

- (UIEdgeInsets)edgeInsets {
    if ([self.delegate respondsToSelector:@selector(edgeInsetsInWaterViewLayOut:)]) {
        return [self.delegate edgeInsetsInWaterViewLayOut:self];
    }else {
        return PureDefaultEdgeInsets;
    }
}

#pragma mark - lazy
- (NSMutableArray *)columnHeights {
    if (!_columnHeights) {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;

}

- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

/*
 初始化
 */
- (void)prepareLayout {
    [super prepareLayout];
//    清除之前的所有布局属性
    [self.attrsArray removeAllObjects];
    self.contentHeight = 0;
    for (NSInteger i = 0; i < self.columnCount; i ++) {
        [self.columnHeights addObject:@(PureDefaultEdgeInsets.top)];
    }
//    开始创建每一个cell的布局
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
//    创建每一个cell对应的布局属性
    for (NSInteger i = 0; i < count; i++) {
//        创建位置
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//       获取indexPath位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

/*
 决定cell的排布
 
 */
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
  
    return self.attrsArray;
}

/*
 返回indexPath位置cell对应的布局属性
 
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //        创建布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    CollectionView的宽度
    CGFloat collectionWight = self.collectionView.frame.size.width;
//    设置布局属性的frame
    CGFloat w = (collectionWight - self.edgeInsets.left - self.edgeInsets.right - self.columnMargin * (self.columnCount - 1)) / self.columnCount;
    
    CGFloat h = 50 + arc4random_uniform(100);
    
    //  注意： ❤️不需要判断waterLayout:heightForItemAtIndex:方法是否实现 如果要使用的话必须实现这个方法 替换     CGFloat h = 50 + arc4random_uniform(100);

//    CGFloat h = [self.delegate waterLayout:self heightForItemAtIndex:indexPath.item itemWidth:w];
    
    
    
// 找出高度最短的一列 优化使用 for循环遍历可以省去一次遍历
//   __block NSInteger destColumn = 0;
//   __block CGFloat minColumnHeight = MAXFLOAT;
//    [self.columnHeights enumerateObjectsUsingBlock:^(NSNumber *columnHeightNumber, NSUInteger idx, BOOL * _Nonnull stop) {
//        CGFloat columnHeight = columnHeightNumber.doubleValue;
//        if ( minColumnHeight < columnHeight) {
//            minColumnHeight = columnHeight;
//            destColumn = idx;
//        }
//    }];
    
    NSInteger desColumn = 0;
    CGFloat minColumnHeight = [self.columnHeights[0] doubleValue];
    for (NSInteger i = 0; i < self.columnCount; i ++) {
        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            desColumn = i;
        }
        
    }
    CGFloat x = self.edgeInsets.left + desColumn * (w + self.columnMargin);
    
    CGFloat y = minColumnHeight;

    if (y != self.edgeInsets.top) {
        y += self.rowMargin;
    }
    attrs.frame = CGRectMake(x, y, w, h);

//    记录内容的高度
    self.columnHeights[desColumn] = @(CGRectGetMaxY(attrs.frame));
    CGFloat columnHeight = [self.columnHeights[desColumn] doubleValue];
    if (self.contentHeight < columnHeight) {
        self.contentHeight = columnHeight;
    }
    return attrs;
}


- (CGSize)collectionViewContentSize {
//    遍历的方法
//    CGFloat maxColumnHeight = [self.columnHeights[0] doubleValue];
   
//    for (NSInteger i = 1; i < self.columnCount; i++) {
//        CGFloat columnHeight = [self.columnHeights[i] doubleValue];
//        if (maxColumnHeight < columnHeight) {
//            maxColumnHeight = columnHeight;
//        }
//    }
    return CGSizeMake(0, self.contentHeight + self.edgeInsets.bottom);
}
@end
