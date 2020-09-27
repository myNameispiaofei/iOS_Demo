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
#import "AliPayHomePageController.h"
#import <mach/mach.h>
#import <sys/sysctl.h>

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
    AliPayHomePageController  *aliVC = [[AliPayHomePageController alloc] init];
    [self.navigationController pushViewController:aliVC animated:YES];
//    ITTouchTestViewController *lifeVC = [[ITTouchTestViewController alloc] init];
//    [self.navigationController pushViewController:lifeVC animated:YES];
    
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

 + (float)cpu_usage
{
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;

    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }

    task_basic_info_t      basic_info;
    thread_array_t         thread_list;
    mach_msg_type_number_t thread_count;

    thread_info_data_t     thinfo;
    mach_msg_type_number_t thread_info_count;

    thread_basic_info_t basic_info_th;
    uint32_t stat_thread = 0; // Mach threads

    basic_info = (task_basic_info_t)tinfo;

    // get threads in the task
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    if (thread_count > 0)
        stat_thread += thread_count;

    long tot_sec = 0;
    long tot_usec = 0;
    float tot_cpu = 0;
    int j;

    for (j = 0; j < thread_count; j++)
    {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                         (thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }

        basic_info_th = (thread_basic_info_t)thinfo;

        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->user_time.microseconds + basic_info_th->system_time.microseconds;
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE * 100.0;
        }

    } // for each thread

    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    printf("mub --totCPU:%f\n",tot_cpu);
    return tot_cpu;
}

@end
