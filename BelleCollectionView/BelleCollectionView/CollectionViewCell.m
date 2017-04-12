//
//  CollectionViewCell.m
//  BelleCollectionView
//
//  Created by 十月 on 17/4/12.
//  Copyright © 2017年 October. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        [self addSubview:self.textLabel];
    }
    return self;
}
- (UIImageView *)imageView {
    
    if (_imageView==nil) {
        
        _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 100, 80)];
        _imageView.backgroundColor = [UIColor yellowColor];
    }
    
    return _imageView;
}

- (UILabel *)textLabel {
    if (_textLabel==nil) {
        
        _textLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 90, 120, 30)];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _textLabel;
}

@end
