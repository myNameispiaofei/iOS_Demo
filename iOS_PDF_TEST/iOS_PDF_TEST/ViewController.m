//
//  ViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/6/18.
//  Copyright © 2019年 母斌. All rights reserved.
//

#import "ViewController.h"
#import "ITNavigationBar.h"
#import "ITCommonTool.h"


@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UITableView  *contentTextView;
@property (nonatomic, strong) ITNavigationBar *navigationBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.bgScrollView];
    [self.view addSubview:self.navigationBar];
}


- (ITNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[ITNavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 88)];
        _navigationBar.backgroundColor = kRGBAColor(0x00d8c9,1);
    }
    return _navigationBar;
}


- (UIScrollView *)bgScrollView {
    if (!_bgScrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
        scrollView.bounces = YES;
        scrollView.showsHorizontalScrollIndicator = YES;
        scrollView.contentSize = CGSizeMake(0, kScreenHeight*1.5);
        _bgScrollView = scrollView;
    }
    return _bgScrollView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateAlphaForNavigationBar:scrollView];
}

- (void)updateAlphaForNavigationBar:(UIScrollView *)scrollView {
    CGFloat delta = scrollView.contentOffset.y;
    NSLog(@"mub ----- offsety :%f",delta);
    CGFloat offsetcolor = 0;
    CGFloat headerContentViewHeight = 88;
    if (delta > 0 && delta <88) {
        offsetcolor = (headerContentViewHeight -delta) /88.0f;
    } else if (delta >= 88)  {
        offsetcolor = 0;
    } else  if (delta <= 0){
        offsetcolor = 1;
    }
    self.navigationBar.alpha = offsetcolor;
}

@end
