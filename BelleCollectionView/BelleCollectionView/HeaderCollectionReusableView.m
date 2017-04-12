//
//  HeaderCollectionReusableView.m
//  BelleCollectionView
//
//  Created by 十月 on 17/4/12.
//  Copyright © 2017年 October. All rights reserved.
//

#import "HeaderCollectionReusableView.h"

@implementation HeaderCollectionReusableView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel =[[UILabel alloc] initWithFrame:CGRectMake(27, 15, 60, 20)];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _titleLabel.textColor = [UIColor orangeColor];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
    }
    return self;
}

@end
