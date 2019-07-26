//
//  SeaAnimationView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/26.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "SeaAnimationView.h"
#import "ITCommonTool.h"


#define RatioH (kScreenHeight / 667.0)
#define RatioW (kScreenWidth / 375.0)
static NSInteger wingRepeatCount = 0;


@interface SeaAnimationView()
// 第一只鸟
@property (nonatomic, strong) CALayer *fBirdLeftLayer;
@property (nonatomic, strong) CALayer *fBirdRightLayer;
@property (nonatomic, strong) CALayer *fBirdBirdLayer;
@property (nonatomic, strong) CALayer *fBirdBodyLayer;


//第二只鸟
@property (nonatomic, strong) CALayer *sBirdLeftLayer;
@property (nonatomic, strong) CALayer *sBirdRightLayer;
@property (nonatomic, strong) CALayer *sBirdBirdLayer;
@property (nonatomic, strong) CALayer *sBirdBodyLayer;

@property (nonatomic, strong) CABasicAnimation *leftAnimation;
@property (nonatomic, strong) CABasicAnimation *rightAnimation;

@end

@implementation SeaAnimationView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configBird];
    }
    return self;
}


- (void)configBird {
    [self prepareBirdContents];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
}

- (void)prepareBirdContents {
    _fBirdBirdLayer = [CALayer layer];
    _fBirdLeftLayer = [CALayer layer];
    _fBirdRightLayer = [CALayer layer];
    _fBirdBodyLayer = [CALayer layer];
    
    [_fBirdBirdLayer addSublayer:_fBirdLeftLayer];
    [_fBirdBirdLayer addSublayer:_fBirdRightLayer];
    [_fBirdBirdLayer addSublayer:_fBirdBodyLayer];
    
    
    _sBirdBirdLayer = [CALayer layer];
    _sBirdLeftLayer = [CALayer layer];
    _sBirdRightLayer = [CALayer layer];
    _sBirdBodyLayer = [CALayer layer];
    
    [_sBirdBirdLayer addSublayer:_sBirdLeftLayer];
    [_sBirdBirdLayer addSublayer:_sBirdRightLayer];
    [_sBirdBirdLayer addSublayer:_sBirdBodyLayer];
    
    
    [self.layer addSublayer:_fBirdBirdLayer];
    [self.layer addSublayer:_sBirdBirdLayer];
    
    UIImage *birdLeftImage = [UIImage imageNamed:@"bird_left"];
    CGSize birdLeftSize = birdLeftImage.size;
    
    UIImage *birdRightImage = [UIImage imageNamed:@"bird_right"];
    CGSize birdRightSize = birdRightImage.size;
    
    UIImage *bodyImage = [UIImage imageNamed:@"bird_body"];
    CGSize bodySize = bodyImage.size;
    // ??? size/2 ??
    CGRect birdLeftFrame = CGRectMake(-2, 0, birdLeftSize.width/2, birdLeftSize.height/2);
    CGRect birdRightFrame = CGRectMake(birdLeftFrame.size.width, 0, birdRightSize.width/2, birdRightSize.height/2);
    
    CGRect birdBodyFrame = CGRectMake(birdLeftSize.width/4 + 10, birdLeftSize.height/2 -2 , bodySize.width/2, bodySize.height/2);
    
// 第一只鸟 frame
    _fBirdLeftLayer.contents = (__bridge id _Nullable)(birdLeftImage.CGImage);
    _fBirdLeftLayer.frame = birdLeftFrame;
    _fBirdRightLayer.contents = (__bridge id _Nullable)(birdRightImage.CGImage);
    _fBirdRightLayer.frame =  birdRightFrame;
    _fBirdBodyLayer.contents = (__bridge id _Nullable)(bodyImage.CGImage);
    _fBirdBodyLayer.frame = birdBodyFrame;
    
// 第二只鸟 frame
    _sBirdLeftLayer.contents = (__bridge id _Nullable)(birdLeftImage.CGImage);
    _sBirdLeftLayer.frame = birdLeftFrame;
    _sBirdRightLayer.contents = (__bridge id _Nullable)(birdRightImage.CGImage);
    _sBirdRightLayer.frame =  birdRightFrame;
    _sBirdBodyLayer.contents = (__bridge id _Nullable)(bodyImage.CGImage);
    _sBirdBodyLayer.frame = birdBodyFrame;

    CGFloat birdWid = bodySize.width + birdLeftSize.width + birdRightSize.width;
    CGFloat birdHig = birdLeftSize.height / 2 + bodySize.height / 2;
    
    
    [_fBirdBirdLayer
     setFrame:CGRectMake(200, kScreenHeight / 2 + 40, birdWid, birdHig)];
    _fBirdBirdLayer.transform = CATransform3DMakeScale(0.4, 0.4, 1);
    
    [_sBirdBirdLayer
     setFrame:CGRectMake(200, _fBirdBirdLayer.frame.size.height +
                         kScreenHeight / 2 + 60,
                         birdWid, birdHig)];
}



- (void)startAnimation {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self birdFlyAnimation];
    });
}



- (void)birdFlyAnimation {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_fBirdLeftLayer addAnimation:[self leftWingFly:YES] forKey:nil];
        [_sBirdLeftLayer addAnimation:[self leftWingFly:NO] forKey:nil];
        
        [_fBirdRightLayer addAnimation:[self rightWingFly:YES] forKey:nil];
        [_sBirdRightLayer addAnimation:[self rightWingFly:NO] forKey:nil];
        if (wingRepeatCount < 1) {
            ++wingRepeatCount;
        }
        CABasicAnimation *firstBirdScale = [self birdBodyScale:YES];
        CAKeyframeAnimation *firstKeyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        UIBezierPath *path1 = [UIBezierPath bezierPath];
        CGPoint p11 = CGPointMake(0, 400 * RatioH);
        CGPoint p12 = CGPointMake(kScreenWidth + 80 * RatioW, 180 * RatioH);
        CGPoint p13 = CGPointMake(kScreenWidth/2, kScreenHeight/2 +60);
        [path1 moveToPoint:p11];
        [path1 addQuadCurveToPoint:p12 controlPoint:p13];
        
        firstKeyframe.path = path1.CGPath;
        firstKeyframe.duration = 11.0f;
        if (RatioH<1) {
            firstKeyframe.duration = 10.0f;
        }
        [firstKeyframe setValue:@"keyPosition1" forKey:@"keyPosition1"];
        
        CAAnimationGroup *firstGroup = [CAAnimationGroup animation];
        firstGroup.animations = @[firstBirdScale, firstKeyframe];
        firstGroup.duration = 12.0f;
        firstGroup.autoreverses = NO;
        firstGroup.removedOnCompletion = NO;
        firstGroup.fillMode = kCAFillModeForwards;
        firstBirdScale.repeatCount = 0;
        [firstGroup setValue:@"firstBirdFly" forKey:@"firstBirdFly"];
        
        [_fBirdBirdLayer addAnimation:firstGroup forKey:nil];
    });
}



- (CABasicAnimation *)birdBodyScale:(BOOL)isFirst {
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scale.duration = 0.6;
    scale.repeatCount = 0;
    scale.fillMode = kCAFillModeForwards;
    scale.removedOnCompletion = NO;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    if (isFirst) {
        scale.fromValue = [NSNumber numberWithFloat:0.2];
        scale.toValue = [NSNumber numberWithFloat:0.3];
    } else {
        scale.fromValue = [NSNumber numberWithFloat:0.8];
        scale.toValue = [NSNumber numberWithFloat:0.3];
    }
    
    return scale;
}
- (CABasicAnimation *)leftWingFly:(BOOL)first {
    
    _fBirdLeftLayer.anchorPoint = CGPointMake(1, 1);  // ?
    _sBirdLeftLayer.anchorPoint = CGPointMake(1, 1);
    if (wingRepeatCount == 0) {
        // 获取 frame
        CGRect firstFrame;
        if (first) {
            firstFrame = _fBirdLeftLayer.frame;
        } else {
            firstFrame = _sBirdLeftLayer.frame;
        }
        //
        
        CGPoint rightPoint =  firstFrame.origin;
        rightPoint.x += firstFrame.size.width / 2;
        rightPoint.y += firstFrame.size.height / 2;
        
        firstFrame = CGRectMake(rightPoint.x, rightPoint.y, firstFrame.size.width, firstFrame.size.height);
        
        if (first) {
            _fBirdLeftLayer.frame = firstFrame;
        } else {
            _sBirdLeftLayer.frame = firstFrame;
        }
    }
    CATransform3D transform1;
    CATransform3D transform2;
    if (first) {
        transform1 = CATransform3DMakeRotation(M_PI_2 * 0.8, 0, 1, 0);
        transform2 = CATransform3DMakeRotation(M_PI_2 * 1.2, 0, 1, 0);
    } else {
        transform1 = CATransform3DMakeRotation(M_PI_2 * 1.2, 0, 1, 0);
        transform2 = CATransform3DMakeRotation(M_PI_2 * 8.2, 0, 1, 0);
    }
    
    _leftAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    _leftAnimation.fromValue = [NSValue valueWithCATransform3D:transform1];
    _leftAnimation.toValue = [NSValue valueWithCATransform3D:transform2];
    
    _leftAnimation.duration = 0.6;
    _leftAnimation.repeatCount = CGFLOAT_MAX;
    _leftAnimation.fillMode = kCAFillModeForwards;
    _leftAnimation.autoreverses = YES;
    _leftAnimation.removedOnCompletion = NO;
    _leftAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    _leftAnimation.delegate = self;
    [_leftAnimation setValue:@"wingLeft" forKey:@"wingLeft"];
    
    return _leftAnimation;
}


//右侧翅膀
- (CABasicAnimation *)rightWingFly:(BOOL)first {
    _fBirdRightLayer.anchorPoint = CGPointMake(0, 1);
    _sBirdRightLayer.anchorPoint = CGPointMake(0, 1);
    
    if (wingRepeatCount == 0) {
        CGRect frame;
        if (first) {
            frame = _fBirdRightLayer.frame;
        } else {
            frame = _sBirdRightLayer.frame;
        }
        
        CGPoint rightOrigin = frame.origin;
        rightOrigin.x -= frame.size.width / 2;
        rightOrigin.y += frame.size.height / 2;
        frame = CGRectMake(rightOrigin.x, rightOrigin.y, frame.size.width,
                           frame.size.height);
        if (first) {
            [_fBirdRightLayer setFrame:frame];
        } else {
            [_sBirdRightLayer setFrame:frame];
        }
    }
    
    CATransform3D transform1;
    CATransform3D transform2;
    if (first) {
        transform1 = CATransform3DMakeRotation(M_PI_2 * 1.2, 0, 1, 0);
        transform2 = CATransform3DMakeRotation(M_PI_2 * 0.8, 0, 1, 0);
    } else {
        transform1 = CATransform3DMakeRotation(M_PI_2 * 0.8, 0, 1, 0);
        transform2 = CATransform3DMakeRotation(M_PI_2 * 1.2, 0, 1, 0);
    }
    _rightAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    _rightAnimation.fromValue = [NSValue valueWithCATransform3D:transform1];
    _rightAnimation.toValue = [NSValue valueWithCATransform3D:transform2];
    _rightAnimation.duration = 0.6;
    _rightAnimation.repeatCount = CGFLOAT_MAX;
    _rightAnimation.fillMode = kCAFillModeForwards;
    _rightAnimation.autoreverses = YES;
    _rightAnimation.removedOnCompletion = NO;
    _rightAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    _rightAnimation.delegate = self;
    [_rightAnimation setValue:@"wingright" forKey:@"wingright"];
    return _rightAnimation;
}
@end
