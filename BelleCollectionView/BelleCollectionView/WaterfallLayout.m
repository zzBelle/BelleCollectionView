//
//  WaterfallLayout.m
//  MiaoKan
//
//  Created by baye on 2017/3/23.
//  Copyright © 2017年 YaXie. All rights reserved.
//

#import "WaterfallLayout.h"

@interface WaterfallLayout ()

@property (nonatomic, strong) NSMutableArray *attributes;

@end

@implementation WaterfallLayout {
    int _heights[4];
}
//
//#pragma mark - getter & setter
//- (void)setColumnNumber:(NSInteger)columnNumber {
//    if (_columnNumber == columnNumber) {
//        return;
//    }
//    _columnNumber = columnNumber;
//    [self invalidateLayout];
//}
//
//- (void)setInterSpaceing:(CGFloat)interSpaceing {
//    if (_interSpaceing == interSpaceing) {
//        return;
//    }
//    _interSpaceing = interSpaceing;
//    [self invalidateLayout];
//}
//
//- (NSMutableArray *)attributes {
//    if (!_attributes) {
//        _attributes = [NSMutableArray array];
//    }
//    return _attributes;
//}
//
//- (void)prepareLayout {
//    [super prepareLayout];
//    [self.attributes removeAllObjects];
//    for (NSInteger idx = 0; idx < self.columnNumber; idx++) {
//        _heights[idx] = self.sectionInset.top;
//    }
//    
//    NSInteger totalItmes = [self.collectionView numberOfItemsInSection:0];
//    for (NSInteger idx = 0; idx < totalItmes; idx++) {
//        [self.attributes addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:idx inSection:0]]];
//    }
//}
//
//- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
//    return self.attributes;
//}
//
//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
//    NSInteger currentColumn = [self shortestColumnHeight];
//    CGFloat itemWith = [self itemWidth];
//    CGFloat xPos = self.sectionInset.left + (itemWith + self.interSpaceing) * currentColumn;
//    CGFloat yPos = _heights[currentColumn];
//    CGFloat itemHeight = [self.delegate waterfallLayout:self heightAtIndexPath:indexPath];
//    attr.frame = CGRectMake(xPos, yPos, itemWith, itemHeight);
//    CGFloat updateYPos = yPos + itemHeight + self.interSpaceing;
//    _heights[currentColumn] = updateYPos;
//    return attr;
//}
//
//- (CGSize)collectionViewContentSize {
////    return CGSizeMake(self.collectionView.mk_width, [self contentHeight]);
//}

//#pragma mark - private
//- (CGFloat)itemWidth {
//    static CGFloat w;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        CGFloat totalWidth = self.collectionView.mk_width;
//        CGFloat validWidth = totalWidth - self.sectionInset.left - self.sectionInset.right - self.interSpaceing * (self.columnNumber - 1);
//        w = validWidth / self.columnNumber;
//    });
//    return w;
//}
//
//- (NSInteger)shortestColumnHeight {
//    int idx = 0;
//    CGFloat shortestHeight = MAXFLOAT;
//    for (int index = 0; index < self.columnNumber; index++) {
//        CGFloat height = _heights[index];
//        if (height < shortestHeight) {
//            shortestHeight = height;
//            idx = index;
//        }
//    }
//    return idx;
//}
//
//- (CGFloat)contentHeight {
//    CGFloat longestHeight = 0;
//    for (int idx = 0; idx < self.columnNumber; idx++) {
//        CGFloat height = _heights[idx];
//        if (height > longestHeight) {
//            longestHeight = height;
//        }
//    }
//    return longestHeight;
//}

@end
