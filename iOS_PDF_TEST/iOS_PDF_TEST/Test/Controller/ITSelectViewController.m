//
//  ITSelectViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/2.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITSelectViewController.h"
#import "ITCommonTool.h"

static NSInteger offsetX = 125;

@interface ITSelectViewController ()

@property (nonatomic, strong) UIView *selectView;

@end

@implementation ITSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self  addGestureRecognizer];
    
}


- (void)addGestureRecognizer {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesAction:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    CGRect frame = CGRectMake(offsetX, 0, kScreenWidth - offsetX, kScreenHeight);
    [UIView animateWithDuration:0.25 animations:^{
        self.selectView.frame = frame;
        self.view.backgroundColor = kRGBAColor(0x000000, 0.3);
    }];
}

- (void)configUI {
    [self.view addSubview:self.selectView];
    self.view.backgroundColor = [UIColor clearColor];
}



- (UIView *)selectView {
    if (!_selectView) {
        _selectView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth - offsetX, kScreenHeight)];
        _selectView.backgroundColor = [UIColor whiteColor];
    }
    return _selectView;
}


- (void)tapGesAction:(UITapGestureRecognizer *)tapGesture {
    CGRect frame = CGRectMake(kScreenWidth, 0, kScreenWidth - offsetX, kScreenHeight);
    [UIView animateWithDuration:0.25 animations:^{
        self.selectView.frame = frame;
        self.view.backgroundColor = kRGBAColor(0x000000, 0);
    } completion:^(BOOL finished) {
         [self dismissViewControllerAnimated:NO completion:nil];
    }];
}

@end
