//
//  AliPayHomePageController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2020/5/18.
//  Copyright © 2020 母斌. All rights reserved.
//

#import "AliPayHomePageController.h"
#import "AliCustrmNavView.h"
#import "ITCommonTool.h"
#import "AliPayNavBottomView.h"
#import <Masonry/Masonry.h>


@interface AliPayHomePageController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AliCustrmNavView *cursNav;
@property (nonatomic, strong) UITableView *aliPayTableView;
@property (nonatomic, strong) UIView *tableHeaderView;

@property (nonatomic, strong)AliPayNavBottomView *shadowView;
@property (nonatomic, strong)AliPayNavBottomView *navBottomView;



@end

@implementation AliPayHomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cursNav = [[AliCustrmNavView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, [AliCustrmNavView custrmNavHeight])];
    
    self.shadowView = [[AliPayNavBottomView alloc] init];
    self.shadowView.frame = CGRectMake(0, CGRectGetMaxY(_cursNav.frame), kScreenWidth, 80);
    
    self.navBottomView = [[AliPayNavBottomView alloc] init];
    self.navBottomView.frame = CGRectMake(0, -320, kScreenWidth, 80);
    self.tableHeaderView = [[UIView alloc] init];
    self.tableHeaderView.backgroundColor = [UIColor orangeColor];
    self.tableHeaderView.frame = CGRectMake(0, -240, kScreenWidth, 240);
    
    CGFloat contentY = 240 + 80;
    
    [self.view addSubview:self.cursNav];
    [self.view addSubview:self.aliPayTableView];
    self.aliPayTableView.frame = CGRectMake(0, [AliCustrmNavView custrmNavHeight], kScreenWidth, kScreenHeight);
    
    [_aliPayTableView setContentInset:UIEdgeInsetsMake(contentY , 0, 0, 0)];
     _aliPayTableView.scrollIndicatorInsets = UIEdgeInsetsMake(contentY, 0, 0, 0);
    [_aliPayTableView addSubview:self.navBottomView];
    [_aliPayTableView addSubview:self.tableHeaderView];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}




-(void)tableViewSlide:(CGFloat)slide
{
     CGFloat offsetY = slide+320;
    
     NSLog(@"mub --Scrolling:%f,",offsetY);
    [self handleCustrmNavView:offsetY];
    [self handleTabBar:offsetY];
    
}

- (void)handleTabBar:(CGFloat)slide
{
    // offsetY < 0;
    if (slide <= 0) {
        _navBottomView.hidden = NO;
        _shadowView.hidden = YES;
        CGRect  headerFram = CGRectMake(0, 0, kScreenWidth, 240);
        CGRect  bottmoFram = CGRectMake(0, 0, kScreenWidth, 80);
        headerFram.origin.y = - 240 + slide;
        bottmoFram.origin.y = - 320 + slide;
        _tableHeaderView.frame = headerFram;
        _navBottomView.frame = bottmoFram;
    } else {
        _navBottomView.hidden = YES;
        _shadowView.hidden = NO;
        _tableHeaderView.frame =  CGRectMake(0, -240, kScreenWidth, 240);
    }
}

- (void)handleCustrmNavView:(CGFloat)slide
{
    if(slide >=0) {
        if (slide <=[AliCustrmNavView custrmNavHeight]) {
            [_cursNav updateAlpha:slide/[AliCustrmNavView custrmNavHeight]];
        }
    } else {
        [_cursNav updateAlpha:0.0];
    }
}

#pragma UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
}

#pragma UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *  cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.backgroundColor =  indexPath.row %2 == 0 ? [UIColor greenColor] : [UIColor yellowColor];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"Scrolling:%f,%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    [self tableViewSlide:scrollView.contentOffset.y];
}


-(UITableView *)aliPayTableView {
    if (!_aliPayTableView) {
     UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor whiteColor];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
//        tableView.estimatedRowHeight = 0;
//        tableView.estimatedSectionFooterHeight = 0;
//        tableView.estimatedSectionHeaderHeight = 0;
        _aliPayTableView = tableView;
    }
    return _aliPayTableView;
}



@end
