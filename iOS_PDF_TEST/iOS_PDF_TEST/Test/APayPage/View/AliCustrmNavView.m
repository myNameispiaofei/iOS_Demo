//
//  AliCustrmNavView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2020/5/18.
//  Copyright © 2020 母斌. All rights reserved.
//

#import "AliCustrmNavView.h"
#import "ITCommonTool.h"
#import <Masonry/Masonry.h>

@interface AliCustrmNavView()

// Part B
@property (nonatomic, strong) UILabel * locationLabel;
@property (nonatomic, strong) UIImageView *firend;
@property (nonatomic, strong) UIImageView *addSmall;  // 小+号
@property (nonatomic, strong) UISearchBar *searchBar;


// PartA
@property (nonatomic, strong) UIImageView *sao;      // 扫一扫
@property (nonatomic, strong) UIImageView *pay;      //支付
@property (nonatomic, strong) UIImageView *gMoney; //收钱
@property (nonatomic, strong) UIImageView *search;   //搜索
@property (nonatomic, strong) UIImageView *addPlus;  // 大+  号


@end

@implementation AliCustrmNavView

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

- (void)updateAlpha:(CGFloat)alpha
{
    [self updatePartAAlpha:alpha];
    [self updatePartBAlpha:alpha];
    if (alpha >= 1.0) {
        self.backgroundColor =  kRGBColor(0x04c7b7);
    } else {
        self.backgroundColor = [UIColor clearColor];
    }
}

- (void)updatePartAAlpha:(CGFloat)alpha
{
    _sao.alpha = (alpha - 0.5) *2;
    _pay.alpha = (alpha - 0.5) *2;
    _gMoney.alpha = (alpha - 0.5) *2;
    _search.alpha = (alpha -0.5) *2;
    _addPlus.alpha = (alpha -0.5) *2;
}

- (void)updatePartBAlpha:(CGFloat)alpha
{
    _addSmall.alpha = 1- alpha*2;
    _firend.alpha = 1 - alpha*2;
}


- (void)layoutUI
{
    [self layoutPartA];
    [self layoutPartB];
    [self updateAlpha:0.0];
}

- (void)layoutPartA
{
    [self addSubview:self.sao];
    [self addSubview:self.pay];
    [self addSubview:self.gMoney];
    [self addSubview:self.search];
    [self addSubview:self.addPlus];
    
    [self.sao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@55);
        make.left.equalTo(self.mas_left).offset(18);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.pay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.sao);
        make.left.mas_equalTo(self.sao.mas_right).offset(10);
    }];
    [self.gMoney mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.sao);
        make.left.mas_equalTo(self.pay.mas_right).offset(10);
    }];
    [self.search mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.sao);
        make.left.mas_equalTo(self.gMoney.mas_right).offset(10);
    }];
    [self.addPlus mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.sao);
        make.right.mas_equalTo(self.mas_right).offset(-20);
    }];
    
}

- (void)layoutPartB
{
    [self addSubview:self.firend];
    [self addSubview:self.addSmall];
   
    
    [self.addSmall mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@55);
        make.right.equalTo(self.mas_right).offset(-20);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [self.firend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(self.addSmall);
        make.right.mas_equalTo(self.addSmall.mas_left).offset(-10);
    }];
}

-(UIImageView *)firend
{
    if (!_firend) {
        _firend = [[UIImageView alloc] init];
        _firend.backgroundColor = [UIColor redColor];
    }
    return _firend;
}

-(UIImageView *)addSmall
{
    if (!_addSmall) {
        _addSmall = [[UIImageView alloc] init];
        _addSmall.backgroundColor = [UIColor redColor];
    }
    return _addSmall;
}

-(UIImageView *)sao
{
    if (!_sao) {
        _sao = [[UIImageView alloc] init];
        _sao.backgroundColor = [UIColor redColor];
    }
    return _sao;
}

-(UIImageView *)pay
{
    if (!_pay) {
        _pay = [[UIImageView alloc] init];
        _pay.backgroundColor = [UIColor redColor];
    }
    return _pay;
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
        _search.backgroundColor = [UIColor redColor];
    }
    return _search;
}
-(UIImageView *)addPlus
{
    if (!_addPlus) {
        _addPlus = [[UIImageView alloc] init];
        _addPlus.backgroundColor = [UIColor redColor];
    }
    return _addPlus;
}

+ (CGFloat)custrmNavHeight {
    
    return  80;
}

@end
