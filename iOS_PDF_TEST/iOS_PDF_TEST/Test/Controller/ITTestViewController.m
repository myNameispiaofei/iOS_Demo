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
#import "ITTestView.h"
#import <Masonry/Masonry.h>

@interface ITTestViewController () <UITableViewDelegate ,UITableViewDataSource, CALayerDelegate>
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, assign) CGRect starFrame;
@property (nonatomic, strong) ITTestView *testView;
@property (nonatomic, strong) ITTestView *test2View;
@end

@implementation ITTestViewController

+ (void)load {
    NSLog(@"11");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.testView = [[ITTestView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
//    self.testView.layer.anchorPoint = CGPointMake(0, 0);
    self.testView.backgroundColor = [UIColor redColor];
    self.test2View = [[ITTestView alloc] initWithFrame:CGRectMake(90 , 100, 200, 300)];
    self.test2View.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.testView];
    [self.view addSubview:self.test2View];
    self.test2View.layer.zPosition = -1.0f;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNot) name:@"defaultCenterTest" object:nil];
    [self sendTestNot];
}


- (void)testNot {
    BOOL isMain = [NSThread isMainThread];
    NSLog(@"mub current isMain:%@",@(isMain));
}

- (void)sendTestNot {
    dispatch_queue_t sQ1 = dispatch_queue_create("stq01", 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       dispatch_async(sQ1, ^{
           BOOL isMain = [NSThread isMainThread];
            NSLog(@"mub current1 isMain:%@",@(isMain));
           [[NSNotificationCenter defaultCenter] postNotificationName:@"defaultCenterTest" object:nil];
           
       });
    });
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    NSLog(@"mub--  drwaLayer");
    CGContextSetLineWidth(ctx, 5.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


- (void)displayLayer:(CALayer *)layer {
     CGRect rect = CGRectMake(0 , 0,  20 ,20 );
       UIGraphicsBeginImageContext(rect.size);
       CGContextRef context = UIGraphicsGetCurrentContext();
       CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
       CGContextFillRect(context, rect);
       UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
       UIGraphicsEndImageContext();
    NSLog(@"mub curr:%@",image);
//    UIImage *image = [UIImage imageNamed:@"hello_image"];
    layer.contents = (__bridge id)image.CGImage;
    NSLog(@"mub --lalallsl");
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
