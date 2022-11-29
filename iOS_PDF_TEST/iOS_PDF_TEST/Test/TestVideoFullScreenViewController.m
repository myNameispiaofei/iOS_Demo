//
//  TestVideoFullScreenViewController.m
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import "TestVideoFullScreenViewController.h"
#import "TestTransitionAnimator.h"

@interface TestVideoFullScreenViewController ()<UIViewControllerTransitioningDelegate,TestTransitionAnimatorDataSourec>
@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIButton *enterFullVideoBtn;
@property (nonatomic, assign) BOOL isMontoring;
@end

@implementation TestVideoFullScreenViewController


- (instancetype)initWithAVPlayerLayer:(AVPlayerLayer*) playlayer
{
    if (self =[super init]) {
        _playlayer = playlayer;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.containerView];
    self.containerView.backgroundColor = [UIColor greenColor];
    _playlayer.frame = self.view.bounds;
//    [self.containerView.layer addSublayer:_playlayer];
    [self.containerView.layer addSublayer:_playlayer];
    self.enterFullVideoBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 60, 30)];
    [self.enterFullVideoBtn setBackgroundColor:[UIColor blueColor]];
    [self.enterFullVideoBtn addTarget:self action:@selector(quitFull) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self beginMonitor];
}

- (void)quitFull
{
    [self.playlayer removeFromSuperlayer];
    [self endMonitor];
    UIViewController *presVC = self.presentingViewController ?: self;
    [presVC dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
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
   return self.containerView;
}
//
//- (CGFloat)videoHeightWidthRatio
//{
//   return [UIScreen mainScreen].bounds.size.height/[UIScreen mainScreen].bounds.size.width;
//}


- (BOOL)shouldAutorotate
{
    return  !self.disableAutoRotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return  UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight) {
        return UIInterfaceOrientationLandscapeLeft;
    } else {
        return UIInterfaceOrientationLandscapeRight;
    }
}


- (void)beginMonitor
{
    if (self.isMontoring) {
        return;
    }
    self.isMontoring = YES;
    UIDevice *device = [UIDevice currentDevice];
    [device beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)endMonitor
{
    if (!self.isMontoring) {
        return;
    }
    self.isMontoring = NO;
    UIDevice *device = [UIDevice currentDevice];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [device endGeneratingDeviceOrientationNotifications];
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self endMonitor];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        [self beginMonitor];
    }];
}


- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (deviceOrientation == UIDeviceOrientationLandscapeLeft || deviceOrientation == UIDeviceOrientationLandscapeRight) {
        _playlayer.frame = self.view.bounds;
        [self.view.layer addSublayer:_playlayer];

    }
}

@end
