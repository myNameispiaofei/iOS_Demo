//
//  ITNavigationBar.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/1.
//  Copyright © 2019年 母斌. All rights reserved.
//

#import "ITNavigationBar.h"
#import "ITCommonTool.h"


@interface ITNavigationBar ()

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;


@end

@implementation ITNavigationBar


- (instancetype)init {
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}



- (void)configUI {
    [self addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake((self.bounds.size.width - 216)/2, 0, 216, self.bounds.size.height);
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = kRGBColor(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
        _titleLabel.alpha = 0;
    }
    return _titleLabel;
}

@end
