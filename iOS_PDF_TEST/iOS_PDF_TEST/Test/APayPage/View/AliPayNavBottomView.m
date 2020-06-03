//
//  AliPayNavBottomView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2020/5/18.
//  Copyright © 2020 母斌. All rights reserved.
//

#import "AliPayNavBottomView.h"
#import <Masonry/Masonry.h>

@interface AliPayNavBottomView()

@property (nonatomic, strong) UIImageView *gMoney; //收钱
@property (nonatomic, strong) UIImageView *search;   //搜索
@property (nonatomic, strong) UIImageView *addPlus;

@end




@implementation AliPayNavBottomView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}


- (instancetype)init
{
    if (self = [super init]) {
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI
{
   
    [self addSubview:self.gMoney];
    [self addSubview:self.search];
    [self addSubview:self.addPlus];
    
    [self.gMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@55);
        make.left.equalTo(self.mas_left).offset(18);
        make.centerY.equalTo(self.mas_centerY);
    }];
  
    [self.search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.gMoney);
        make.left.mas_equalTo(self.gMoney.mas_right).offset(10);
    }];
    [self.addPlus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.gMoney);
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
    
}

-(UIImageView *)gMoney
{
    if (!_gMoney) {
        _gMoney = [[UIImageView alloc] init];
        _gMoney.backgroundColor = [UIColor redColor];
    }
    return _gMoney;
}
-(UIImageView *)search
{
    if (!_search) {
        _search = [[UIImageView alloc] init];
        _search.backgroundColor = [UIColor blueColor];
    }
    return _search;
}
-(UIImageView *)addPlus
{
    if (!_addPlus) {
        _addPlus = [[UIImageView alloc] init];
        _addPlus.backgroundColor = [UIColor grayColor];
    }
    return _addPlus;
}






@end
