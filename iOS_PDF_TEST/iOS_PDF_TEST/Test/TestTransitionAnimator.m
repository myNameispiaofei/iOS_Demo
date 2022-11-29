//
//  TestTransitionAnimator.m
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import "TestTransitionAnimator.h"
#import "TestLandscapeVideoVCTempHolder.h"

@interface TestTransitionAnimator()

@property (nonatomic, assign) TestTransitionAnimatorType animatorType;

@end

@implementation TestTransitionAnimator


- (instancetype)initWithTransitionAnimatorType:(TestTransitionAnimatorType)type
{
    self = [super init];
    if (self) {
        _animatorType = type;
    }
    return self;
}


- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch(self.animatorType){
        case TestTransitionAnimatorPresent:
        {
            [self presentAnimation:transitionContext];
            
        }
            break;
        case TestTransitionAnimatorDismiss:
        {
            
        }
            break;
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return  0.3;
}


- (void)presentAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //将要弹出的VC
    UIViewController *presentedViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];

    
    //拿到present动画的起始位置，并转换成[transitionContext containerView]里的坐标系
    UIView *movieView = [self.dataSource originVideoPlayerContainerView];
    CGRect smallMovieFrame = [[transitionContext containerView] convertRect:movieView.bounds fromView:movieView];
    smallMovieFrame.origin.x = 0;
    smallMovieFrame.origin.y = 0;
    
    //将presentedView变成起始的大小和方向
    presentedView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    presentedView.center = CGPointMake(CGRectGetMidX(smallMovieFrame), CGRectGetMidY(smallMovieFrame));
    [[transitionContext containerView] addSubview:presentedView];
    CGRect presentedViewFinalFrame = [transitionContext finalFrameForViewController:presentedViewController];
    [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext] delay:0.0 options:UIViewAnimationOptionLayoutSubviews|UIViewAnimationOptionCurveEaseInOut animations:^{
        presentedView.transform = CGAffineTransformIdentity;
        presentedView.frame = presentedViewFinalFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


- (void)dismissAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *prevViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *dismissingView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    toView.frame = [transitionContext finalFrameForViewController:prevViewController];
    
    [[transitionContext containerView] insertSubview:toView atIndex:0];
    
    CGFloat targetWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat videoHeightWidthRatio = [self.dataSource videoHeightWidthRatio];
    CGFloat videoRealHeight = videoHeightWidthRatio * targetWidth;
    CGFloat videoDefaultHeight = [self.dataSource videoDefaultHeight];
    CGRect targetFrame = CGRectZero;
    targetFrame.size = CGSizeMake(targetWidth, videoRealHeight);
    if (videoDefaultHeight > videoRealHeight) {
        targetFrame.origin.y = (videoDefaultHeight - videoRealHeight)/2;
    }
    
    UIView *movieView = [self.dataSource originVideoPlayerContainerView];
    
    UIImage *screenShotImage = [TestLandscapeVideoVCTempHolder sharedInstance].screenShotImage;
    UIImageView *snapshotImageView = [[UIImageView alloc] initWithImage:screenShotImage];
    snapshotImageView.contentMode = (videoDefaultHeight > videoRealHeight) ? UIViewContentModeScaleToFill:UIViewContentModeScaleAspectFit;
    snapshotImageView.backgroundColor = UIColor.clearColor;
    snapshotImageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    snapshotImageView.frame = [transitionContext containerView].bounds;
    snapshotImageView.center = dismissingView.center;
    snapshotImageView.clipsToBounds = YES;
    [[transitionContext containerView] addSubview:snapshotImageView];
    dismissingView.hidden = YES;
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  delay:0.0 options:UIViewAnimationOptionLayoutSubviews|UIViewAnimationOptionCurveEaseInOut
                     animations:^{
        snapshotImageView.transform = CGAffineTransformIdentity;
        dismissingView.transform = CGAffineTransformIdentity;
        toView.transform = CGAffineTransformIdentity;
        snapshotImageView.frame = targetFrame;
        snapshotImageView.center = movieView.center;
        dismissingView.frame = targetFrame;
        dismissingView.center = movieView.center;
        
    } completion:^(BOOL finished) {
        dismissingView.hidden = NO;
        [dismissingView removeFromSuperview];
        [TestLandscapeVideoVCTempHolder sharedInstance].screenShotImage = nil;
        [snapshotImageView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
    
}

@end
