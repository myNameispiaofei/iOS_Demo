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
#import <AVFoundation/AVPlayer.h>
#import <AVKit/AVkit.h>
#import "TestTransitionAnimator.h"
#import "TestLandscapeVideoVCTempHolder.h"
#import "TestVideoFullScreenViewController.h"

typedef void(^ITTestBolock)(void);

@interface ViewController ()<UIScrollViewDelegate,UIViewControllerTransitioningDelegate,TestTransitionAnimatorDataSourec>

@property (nonatomic, strong) AVPlayer *avPlayer;
@property (nonatomic, strong) AVPlayerLayer *playlayer;
@property (nonatomic, strong) AVPlayerItem *currentItem;
@property (nonatomic, strong) UIView *playView;
@property (nonatomic, strong) UIButton *enterFullVideoBtn;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.avPlayer = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://mirror.aarnet.edu.au/pub/TED-talks/911Mothers_2010W-480p.mp4"]];
    self.playlayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    self.playView = [[UIView alloc] initWithFrame:CGRectMake(16, 70, self.view.frame.size.width-32, 300)];
    self.playlayer.frame = self.playView.bounds;
    [self.playView.layer addSublayer:self.playlayer];
    [self.view addSubview:self.playView];
    self.enterFullVideoBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, 400, 60, 30)];
    [self.enterFullVideoBtn setBackgroundColor:[UIColor blueColor]];
    [self.enterFullVideoBtn addTarget:self action:@selector(clickFlull) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.enterFullVideoBtn];
}


- (void)clickFlull{
    [self.playlayer removeFromSuperlayer];
    TestVideoFullScreenViewController *fullVC = [[TestVideoFullScreenViewController alloc] initWithAVPlayerLayer:self.playlayer];
    fullVC.transitioningDelegate = self;
    fullVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController presentViewController:fullVC animated:YES completion:^{
        
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.avPlayer play];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    TestTransitionAnimator *animator = [[TestTransitionAnimator alloc] initWithTransitionAnimatorType:TestTransitionAnimatorPresent];
    animator.dataSource = self;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    TestTransitionAnimator *animator = [[TestTransitionAnimator alloc] initWithTransitionAnimatorType:TestTransitionAnimatorDismiss];
    animator.dataSource = self;
    return animator;
}


- (UIView*)originVideoPlayerContainerView
{
    return self.playView;
}

- (CGFloat)videoHeightWidthRatio
{
    return [UIScreen mainScreen].bounds.size.height/[UIScreen mainScreen].bounds.size.width;
}

- (CGFloat)videoDefaultHeight {
    return  300;
}








@end
