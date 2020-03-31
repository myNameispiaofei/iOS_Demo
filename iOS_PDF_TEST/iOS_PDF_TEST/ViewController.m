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
#import "ITTestViewController.h"
#import "SeaAnimationView.h"
#import "ITTouchTestViewController.h"
#import "ITDispatchTestController.h"
#import "ITCommViewController.h"
#import "MULifeViewController.h"

typedef void(^ITTestBolock)(void);

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *bgScrollView;
@property (nonatomic, strong) UITableView  *contentTextView;
@property (nonatomic, strong) ITNavigationBar *navigationBar;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIImageView *bgImageView;


@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    NSInteger val = 0;
//    ITTestBolock block = ^{
//        NSLog(@"this is val=%ld",val);
//    };
//    val = 20;
//    NSLog(@"this is begain val=%ld",val);
//    block();
//    NSLog(@"this is val=%ld",val);
//    self.navigationController.navigationBar.hidden = YES;
//    [self.view addSubview:self.bgScrollView];
//    [self.view addSubview:self.navigationBar];
//    [self.view addSubview:self.bgImageView];
//    [self.view addSubview:self.btn];
//
//}


//- (ITNavigationBar *)navigationBar {
//    if (!_navigationBar) {
//        _navigationBar = [[ITNavigationBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 88)];
//        _navigationBar.backgroundColor = kRGBAColor(0x00d8c9,1);
//    }
//    return _navigationBar;
//}
//
//
//- (UIScrollView *)bgScrollView {
//    if (!_bgScrollView) {
//        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
//        scrollView.delegate = self;
//        scrollView.pagingEnabled = YES;
//        scrollView.bounces = YES;
//        scrollView.showsHorizontalScrollIndicator = YES;
//        scrollView.contentSize = CGSizeMake(0, kScreenHeight*1.5);
//        _bgScrollView = scrollView;
//    }
//    return _bgScrollView;
//}
//
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self updateAlphaForNavigationBar:scrollView];
//}
//
//- (void)updateAlphaForNavigationBar:(UIScrollView *)scrollView {
//    CGFloat delta = scrollView.contentOffset.y;
////    NSLog(@"mub ----- offsety :%f",delta);
//    CGFloat offsetcolor = 0;
//    CGFloat headerContentViewHeight = 88;
//    if (delta > 0 && delta <88) {
//        offsetcolor = (headerContentViewHeight -delta) /88.0f;
//    } else if (delta >= 88)  {
//        offsetcolor = 0;
//    } else  if (delta <= 0){
//        offsetcolor = 1;
//    }
//    self.navigationBar.alpha = offsetcolor;
//}
//
//
- (UIButton *)btn {
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.backgroundColor = [UIColor redColor];
        [_btn addTarget:self action:@selector(btnClickAction) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake(200, 200, kScreenWidth/3, 50);
    };
    return _btn;
}


- (void)btnClickAction {
    MULifeViewController *lifeVC = [[MULifeViewController alloc] init];
//    [self.navigationController pushViewController:lifeVC animated:YES];
    [self presentViewController:lifeVC animated:YES completion:nil];
    
}

//
//
//- (void)btnClickAction {
// 
//    // layer test
////    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
////    view.center = self.view.center;
////    [self.view addSubview:view];
////    CALayer *blueLayer = [CALayer layer];
////    UIImage *image = [UIImage imageNamed:@"eason.png"];
////    blueLayer.frame = self.view.bounds;
////    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
////    blueLayer.contents = (__bridge id)image.CGImage;
////    blueLayer.contentsGravity = kCAGravityResizeAspect;
//////    blueLayer.contentsGravity = kCAGravityCenter;
//////    blueLayer.contentsScale = image.scale;
////    blueLayer.contentsCenter = CGRectMake(0.1, 0.25, 0.25, 0.25);
////    [self.view.layer addSublayer:blueLayer];
//    
////    ITTestViewController *vc = [[ITTestViewController alloc] init];
////    [self.navigationController pushViewController:vc animated:YES];
//    [self layerTest];
//    
////    SeaAnimationView *seaView = [[SeaAnimationView alloc] initWithFrame:self.view.bounds];
////    [self.view addSubview:seaView];
//    
////    ITTouchTestViewController *vc = [[ITTouchTestViewController alloc] init];
//    
////    ITDispatchTestController *vc = [[ITDispatchTestController alloc] init];
////    vc.view.backgroundColor = kRGBColor(0xffe111);
////    [self.navigationController pushViewController:vc animated:YES];
//}
//
//- (UIImageView *)bgImageView {
//    if (!_bgImageView) {
//        _bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//        _bgImageView.image = [UIImage imageNamed:@"eason.png"];
//    }
//    return _bgImageView;
//}
//
//- (void)layerTest {
//    ITCommViewController *vc = [[ITCommViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}


- (void)loadView {
    [super loadView];
    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.btn];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

- (void)dealloc {
  NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

@end
