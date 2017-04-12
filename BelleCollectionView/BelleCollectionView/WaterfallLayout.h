//
//  WaterfallLayout.h
//  MiaoKan
//
//  Created by baye on 2017/3/23.
//  Copyright © 2017年 YaXie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterfallLayout;
@protocol WaterfallLayoutDelegate <NSObject>

- (CGFloat)waterfallLayout:(WaterfallLayout *)layout heightAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterfallLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id <WaterfallLayoutDelegate> delegate;

@property (nonatomic) NSInteger columnNumber;
@property (nonatomic) CGFloat interSpaceing;

@end
