//
//  ITTestViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/1.
//  Copyright © 2019年 母斌. All rights reserved.
//

#import "ITTestViewController.h"
#import "ITSelectViewController.h"
#import "ITCommonTool.h"

#import <Masonry/Masonry.h>

@interface ITTestViewController () <UITableViewDelegate ,UITableViewDataSource>
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, assign) CGRect starFrame;
@end

@implementation ITTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    [self.view addSubview:self.bgImageView];
    [self.view addSubview:self.tabelView];
    self.tabelView.frame = self.view.bounds;
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    headerView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableHeaderView = headerView;
    self.bgImageView.frame = CGRectMake(0, 0, kScreenWidth, 250);
    self.starFrame = self.bgImageView.frame;
}


- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"hello_image"];
        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImageView.clipsToBounds = YES;
        _bgImageView.image = image;
    }
    return _bgImageView;
}

- (UITableView *)tabelView {
    if (!_tabelView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        _tabelView = tableView;
        _tabelView.showsVerticalScrollIndicator = NO;
        _tabelView.backgroundColor = [UIColor clearColor];
//        _tabelView.alwaysBounceVertical = YES;
        if (@available(iOS 11.0, *)) {
            _tabelView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    
    return _tabelView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    if (indexPath.row % 2 ==0) {
        cell.backgroundColor = [UIColor redColor];
    } else {
        cell.backgroundColor = [UIColor greenColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ITSelectViewController *vc = [[ITSelectViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat detal = scrollView.contentOffset.y;
    NSLog(@"mub ---image  detal :%f",detal);
    if (detal <= 0) {
        CGRect frame = self.starFrame;
        frame.size.height -= detal;
        self.bgImageView.frame = frame;
    }
    if (detal >0  && detal < 88) {
        CGRect frame = self.starFrame;
        frame.size.height -= detal;
        self.bgImageView.frame = frame;
    }
}

@end
