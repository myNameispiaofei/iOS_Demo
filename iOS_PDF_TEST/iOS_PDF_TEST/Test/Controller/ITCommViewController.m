//
//  ITCommViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/12/27.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITCommViewController.h"
#import <Masonry/Masonry.h>

 #define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)

@interface ITCommViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIView *tview1;
@property (nonatomic, strong) UIView *tview2;
@property (nonatomic, strong) CALayer *colorLayer;
@property (nonatomic, strong) NSArray <UIImage*>* imageArr;
@property (nonatomic, strong) CALayer *shipLayer;
@property (nonatomic, strong) CALayer *doorLayer;


@end

@implementation ITCommViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.tview1];
    self.tview1.frame = self.view.bounds;
    self.tview1.layer.backgroundColor = [UIColor whiteColor].CGColor;
//    [self.tview1.layer addSublayer:self.shipLayer];
//    [self doorTest];
//    [self.tview1 addSubview:self.imageView];
//    self.imageView.frame = CGRectMake(50, 50, 70, 70);
   // [self beziertest];
//    [self keyAniframtest];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(changColor) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor greenColor];
    btn.frame = CGRectMake(100, 450, 80, 60);
    
    
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 addTarget:self action:@selector(stopAni) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    btn1.backgroundColor = [UIColor yellowColor];
    btn1.frame = CGRectMake(200, 450, 80, 60);
//    [self switchImageTest];
//
//
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(50, 50, 100, 100);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.tview1.layer addSublayer:self.colorLayer];

//    [self testColor];
//    self.tview1.frame = self.view.bounds;
//    self.tview1.backgroundColor = [UIColor orangeColor];
//
//    [self repeatinglayerTest];
//
    
    
//    CATransform3D pt = CATransform3DIdentity;
//    pt.m34 = -1.0/5000;
//    self.tview1.layer.sublayerTransform = pt;
//
//
//
//    CATransform3D c1t = CATransform3DIdentity;
//    c1t = CATransform3DTranslate(c1t, -100, 0, 1);
//    c1t = CATransform3DRotate(c1t, -M_PI_4, 1, 0, 0);
//    c1t = CATransform3DRotate(c1t, -M_PI_4, 0, 0, 1);
//    CALayer *cuble1 =  [self cubeWithTransfrom:c1t];
//
//    [self.tview1.layer addSublayer:cuble1];
//
//
//
//    CATransform3D c2t = CATransform3DIdentity;
//    c2t = CATransform3DTranslate(c2t, 100, 0, 0);
//    c2t = CATransform3DRotate(c2t, -M_PI_4, 1, 0, 0);
//    c2t = CATransform3DRotate(c2t, -M_PI_4, 0, 1, 0);
//    CALayer *cube2 = [self cubeWithTransfrom:c2t];
//    [self.tview1.layer addSublayer:cube2];
    
//    [self.view addSubview:self.imageView];
//    [self.view addSubview:self.imageView2];
//    [self.view addSubview:self.tview1];
//    [self.tview1 addSubview:self.tview2];
//
//    self.view.backgroundColor = [UIColor grayColor];
//    self.tview1.backgroundColor = [UIColor redColor];
//    self.tview2.backgroundColor = [UIColor blueColor];
//    [self.tview1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.view.mas_centerY);
//        make.centerX.equalTo(self.view.mas_centerX);
//    }];
//  [self culbTest];
//
//    [self.tview2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.tview1.mas_centerY);
//        make.centerX.equalTo(self.tview1.mas_centerX);
//        make.width.height.equalTo(@(60));
//    }];
//    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.view.mas_centerY);
//        make.right.equalTo(self.view.mas_centerX).offset(-20);
//        make.width.height.equalTo(@(80));
//    }];
//
//    [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.view.mas_centerY);
//        make.left.equalTo(self.view.mas_centerX).offset(20);
//        make.width.height.equalTo(@(80));
//    }];
  
//    [self layerTest5];
//    [self testColor2];
}

- (void)layerTest1
{
    CGAffineTransform transFrom = CGAffineTransformIdentity;
    transFrom = CGAffineTransformRotate(transFrom, M_PI_4);
    transFrom = CGAffineTransformScale(transFrom, 1, 1);
    transFrom = CGAffineTransformTranslate(transFrom, 80, 100);
    self.imageView.layer.affineTransform = transFrom;
    
    NSLog(@"mub - fram %@", NSStringFromCGRect(self.imageView.layer.bounds));
    
}

- (void)layerTest2
{
    CATransform3D transFrom3D = CATransform3DIdentity;
    transFrom3D.m34 = - 1.0 / 500.0;
    transFrom3D = CATransform3DRotate(transFrom3D, DEGREES_TO_RADIANS(130), 0, 1, 0);
//    transFrom3D = CATransform3DMakeRotation(DEGREES_TO_RADIANS(45), 0, 1, 0);
    
    self.imageView.layer.transform = transFrom3D;
    
    NSLog(@"mub - fram %@", NSStringFromCGRect(self.imageView.layer.bounds));
    
}

- (void)layerTest3
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    CATransform3D transform1 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-45), 0, 1, 0);
    self.imageView.layer.transform = transform1;
    CATransform3D transform2 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(45), 0, 1, 0);
    self.imageView2.layer.transform = transform2;
}


// y轴旋转
- (void)layerTest4
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
//    self.view.layer.sublayerTransform = perspective;
    CATransform3D transform1 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-45), 0, 0, 1);
    self.tview1.layer.transform = transform1;
    CATransform3D transform2 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(45), 0, 0, 1);
    self.tview2.layer.transform = transform2;
}

// z轴旋转
- (void)layerTest5
{
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    CATransform3D transform1 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(-45), 0, 1, 0);
    transform1.m34 = - 1.0 / 500.0;
    self.tview1.layer.transform = transform1;
    CATransform3D transform2 = CATransform3DMakeRotation(DEGREES_TO_RADIANS(100), 0, 1, 0);
    transform2.m34 = - 1.0 / 500.0;
    self.tview2.layer.transform = transform2;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.image = [UIImage imageNamed:@"emoji_1.jpg"];
    }
    return _imageView;
}

- (UIImageView *)imageView2
{
    if (!_imageView2) {
        _imageView2 = [[UIImageView alloc] init];
        _imageView2.image = [UIImage imageNamed:@"emoji_2.png"];
    }
    return _imageView2;
}

- (UIView *)tview1
{
    if (!_tview1) {
        _tview1 = [[UIView alloc] init];
    }
    return _tview1;
}

- (UIView *)tview2
{
    if (!_tview2) {
        _tview2 = [[UIView alloc] init];
    }
    return _tview2;
}


- (void)culbTest {
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.tview1.layer.sublayerTransform = perspective;
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:1 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:2 withTransform:transform];
    
    
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    
    
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:4 withTransform:transform];
     
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
    
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:6 withTransform:transform];
    
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    
}


- (void)addFace:(NSInteger)index withTransform:(CATransform3D)trans {
    UIView *view = [self bulidViewWithIndex:index];
    [self.tview1 addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
//    CGSize containerSize = self.tview1.bounds.size;
//    view.center  = CGPointMake( containerSize.width/ 2, containerSize.height/2.0);
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view.mas_centerY);
        make.centerX.equalTo(view.mas_centerX);
        make.width.height.equalTo(@170);
    }];
    view.layer.transform = trans;
}


- (UIView *)bulidViewWithIndex:(NSInteger )index {
    UIView *view = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = [NSString stringWithFormat:@"第%ld面",index];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(view.mas_centerY);
        make.centerX.equalTo(view.mas_centerX);
    }];
    return view;
    
}


- (CALayer *)faceWithFransfrom:(CATransform3D)transfrom
{
    CALayer * face = [CALayer layer];
    face.frame = CGRectMake(-50, -50, 100, 100);
    CGFloat r = (arc4random()%255);
    CGFloat g = (arc4random()%255);
    CGFloat b = (arc4random()%255);
    face.backgroundColor =  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1].CGColor;
    face.transform = transfrom;
    return face;
}

- (CALayer *)cubeWithTransfrom:(CATransform3D)transfrom
{
    CATransformLayer *cube = [CATransformLayer layer];
    // face1
    CATransform3D ct = CATransform3DMakeTranslation(0, 0, 50);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    // face2
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    // face3
    ct = CATransform3DMakeTranslation(0, -50, 0);
    ct = CATransform3DRotate(ct, M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    // face4
    ct = CATransform3DMakeTranslation(0, 50, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 1, 0, 0);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    // face5
    ct = CATransform3DMakeTranslation(50, 0, 0);
    ct = CATransform3DRotate(ct, -M_PI_2, 0, 1, 0);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    // face6
    ct = CATransform3DMakeTranslation(0, 0, -50);
    ct = CATransform3DRotate(ct, M_PI, 0, 1, 0);
    [cube addSublayer:[self faceWithFransfrom:ct]];
    
    CGSize  size = self.view.bounds.size;
    cube.position = CGPointMake(size.width/2, size.height/2);
    
    cube.transform = transfrom;
    
    return cube;
}


//Repeating layer

- (void)repeatinglayerTest
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.tview1.bounds;
    [self.tview1.layer addSublayer:replicatorLayer];
    
    replicatorLayer.instanceCount = 5;
    
    CATransform3D transfrom = CATransform3DIdentity;
    transfrom = CATransform3DTranslate(transfrom, 0, 200, 0);
    transfrom = CATransform3DRotate(transfrom, M_PI/5.0, 0, 0, 1);
    transfrom = CATransform3DTranslate(transfrom, 0, -200, 0);
    
    replicatorLayer.instanceTransform = transfrom;
    replicatorLayer.instanceBlueOffset = -0.1;
    replicatorLayer.instanceGreenOffset = -0.1;
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    [replicatorLayer addSublayer:layer];
}



- (void)changColor {
    
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    CGFloat r = (arc4random()%255);
//    CGFloat g = (arc4random()%255);
//    CGFloat b = (arc4random()%255);
//    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
//    CABasicAnimation *animation = [CABasicAnimation animation];
//
//    animation.keyPath = @"backgroundColor";
//    animation.toValue = (__bridge id)color.CGColor;
//    animation.delegate = self;
//
//    [self.colorLayer addAnimation:animation forKey:nil];
//    [CATransaction commit];
//     [self changColor1];
//    [self layerActionTest];
    
    //[self keyframeTest];
//    [self switchButtonAction];
//    [self startAni];
  
    [self changeEffectTest];
}



- (void)keyframeTest {
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.5;
    animation.values = @[
        (__bridge id)[UIColor blueColor].CGColor,
        (__bridge id)[UIColor redColor].CGColor,
        (__bridge id)[UIColor greenColor].CGColor,
        (__bridge id)[UIColor blueColor].CGColor,
    ];
    
    [self.colorLayer addAnimation:animation forKey:nil];
    
}



//- (void)animationDidStop:(CABasicAnimation *)anim finished:(BOOL)flag {
//    NSLog(@"ani did stop!!!");
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
//    self.colorLayer.backgroundColor = (__bridge CGColorRef)anim.toValue;
//    [CATransaction commit];
//}

- (void)layerActionTest
{
    NSLog(@"mub--- out %@",[self.tview1 actionForLayer:self.tview1.layer forKey:@"backgroundColor"]);
    [UIView beginAnimations:nil context:nil];
    NSLog(@"mub--- inseide %@",[self.tview1 actionForLayer:self.tview1.layer forKey:@"backgroundColor"]);
    [UIView commitAnimations];
    
}

- (void)changColor1 {
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:1.0];
    CGFloat r = (arc4random()%255);
    CGFloat g = (arc4random()%255);
    CGFloat b = (arc4random()%255);
    self.tview1.layer.backgroundColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1].CGColor;
    [CATransaction commit];
}

- (void)changColorAniBlock {
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0];
    [CATransaction setCompletionBlock:^{
        CGAffineTransform transfrom = self.colorLayer.affineTransform;
        transfrom = CGAffineTransformRotate(transfrom, M_PI_2);
        self.colorLayer.affineTransform = transfrom;
    }];
    CGFloat r = (arc4random()%255);
    CGFloat g = (arc4random()%255);
    CGFloat b = (arc4random()%255);
    self.colorLayer.backgroundColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1].CGColor;
    [CATransaction commit];
}


- (void)testColor {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.tview1.bounds;
    [self.tview1.layer addSublayer:self.colorLayer];
}

- (void)testColor2 {
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = self.tview1.bounds;
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
//    CALayer *layer =  [self.colorLayer presentationLayer];
//
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionPush;
//    transition.subtype =  kCATransitionFromLeft;
//    self.colorLayer.actions = @{@"backgroundColor":transition};
    [self.tview1.layer addSublayer:self.colorLayer];
    
    
}

//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    if ([self.colorLayer hitTest:point]) {
//        CGFloat r = (arc4random()%255);
//        CGFloat g = (arc4random()%255);
//        CGFloat b = (arc4random()%255);
//        self.colorLayer.backgroundColor = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1].CGColor;
//    } else {
//        [CATransaction begin];
//        [CATransaction setAnimationDuration:4.0];
//        self.colorLayer.position = point;
//        [CATransaction commit];
//    }
//}


- (void)beziertest
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    
    [bezierPath addCurveToPoint:CGPointMake(375, 150) controlPoint1:CGPointMake(100, 250) controlPoint2:CGPointMake(200, 50)];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0;
    [self.tview1.layer addSublayer:pathLayer];
    
    CALayer *shipLayer = [CALayer layer];
    shipLayer.frame = CGRectMake(0, 0, 64, 64);
    shipLayer.position = CGPointMake(150, 150);
    shipLayer.contents = (__bridge id)[UIImage imageNamed:@"emoji_2.png"].CGImage;
    
    [self.tview1.layer addSublayer:shipLayer];
    
//    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
//    animation.keyPath = @"position";
//    animation.duration = 4.0;
//    animation.path = bezierPath.CGPath;
//    animation.repeatCount = CGFLOAT_MAX;
//    animation.rotationMode = kCAAnimationRotateAuto;
//
//    [shipLayer addAnimation:animation forKey:nil];
    
    
    
    CABasicAnimation *baseAnimation = [CABasicAnimation animation];
    baseAnimation.keyPath = @"transform";
    baseAnimation.duration = 2.0;
    baseAnimation.byValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI*2.0, 0, 1, 0)];
    [shipLayer addAnimation:baseAnimation forKey:nil];
    
}

- (void)keyAniframtest
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    [bezierPath moveToPoint:CGPointMake(0, 150)];
    [bezierPath addCurveToPoint:CGPointMake(375, 150) controlPoint1:CGPointMake(100, 250) controlPoint2:CGPointMake(200, 50)];
    
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.path = bezierPath.CGPath;
    pathLayer.fillColor = [UIColor clearColor].CGColor;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.lineWidth = 3.0;
    
    [self.tview1.layer addSublayer:pathLayer];
    
    CALayer *colorLayer = [CALayer layer];
    colorLayer.frame = CGRectMake(64, 0, 64, 64);
    colorLayer.position = CGPointMake(0, 150);
    colorLayer.backgroundColor = [UIColor greenColor].CGColor;
    [self.tview1.layer addSublayer:colorLayer];
    
    CAKeyframeAnimation *ani1 = [CAKeyframeAnimation animation];
    ani1.keyPath = @"position";
    ani1.path = bezierPath.CGPath;
    ani1.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *ani2 = [CABasicAnimation animation];
    ani2.keyPath = @"backgroundColor";
    ani2.toValue = (__bridge id)[UIColor redColor].CGColor;
    
    CAAnimationGroup * groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[ani1, ani2];
    groupAni.duration = 4.0;
    [colorLayer addAnimation:groupAni forKey:nil];
    
}


/*
 过度动画Test
 */


- (void)switchImageTest
{
    self.imageArr = @[
        [UIImage imageNamed:@"emoji_3.jpg"],
        [UIImage imageNamed:@"emoji_4.jpg"],
        [UIImage imageNamed:@"emoji_5.jpg"],
        [UIImage imageNamed:@"emoji_6.jpg"],
        [UIImage imageNamed:@"emoji_7.jpg"],
    ];
    self.imageView.image = self.imageArr[0];
}



- (void)switchButtonAction
{
//    CATransition *transition = [CATransition animation];
//    transition.type = kCATransitionReveal;
////    transition.subtype = kCATransitionFromTop;
//    [self.imageView.layer addAnimation:transition forKey:nil];
//    UIImage *current = self.imageView.image;
//    NSUInteger index = [self.imageArr indexOfObject:current];
//    index = (index +1)%(self.imageArr.count);
//    self.imageView.image = self.imageArr[index];
//    [self switchButtonAction1];
    [self performTransition];
}


- (void)switchButtonAction1
{
    [UIView transitionWithView:self.imageView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        UIImage *current = self.imageView.image;
        NSUInteger index = [self.imageArr indexOfObject:current];
        index = (index +1)%(self.imageArr.count);
        self.imageView.image = self.imageArr[index];
    } completion:nil];
}



- (void)performTransition
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, 0, [UIScreen mainScreen].scale);
    [self.tview1.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *coverImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImageView *coverView =[[UIImageView alloc] initWithImage:coverImage];
    coverView.frame = self.view.bounds;
    
//    [self.view addSubview:coverView];
    CGFloat r  = (arc4random()%255);
    CGFloat g  = (arc4random()%255);
    CGFloat b  = (arc4random()%255);
    UIColor *color = [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
    self.tview1.backgroundColor = color;
    [self.tview1 addSubview:coverView];
    
    [UIView animateWithDuration:1 animations:^{
        CGAffineTransform tra = CGAffineTransformMakeScale(1, 1);
        tra = CGAffineTransformRotate(tra, M_PI_2);
        coverView.transform = tra;
        coverView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [coverView removeFromSuperview];
    }];
    
}

- (void)stopAni
{
    [self.shipLayer removeAnimationForKey:@"hell_ani"];
}

- (void)startAni
{
    CABasicAnimation *basAni = [CABasicAnimation animation];
    basAni.duration = 4.0;
    basAni.byValue = @(M_PI *2);
    basAni.keyPath = @"transform.rotation";
    [self.shipLayer addAnimation:basAni forKey:@"hell_ani"];
}

- (CALayer *)shipLayer {
    if (!_shipLayer) {
        CALayer *shipLayer = [CALayer layer];
        shipLayer.frame = CGRectMake(0, 0, 128 , 128);
        shipLayer.position = CGPointMake(150, 150);
        shipLayer.contents = (__bridge id)[UIImage imageNamed:@"emoji_2.png"].CGImage;
        _shipLayer = shipLayer;
    }
    return _shipLayer;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"dadadada");
}



- (void)doorTest
{
    [self.tview1.layer addSublayer:self.doorLayer];
    CATransform3D trans = CATransform3DIdentity;
    trans.m34 = -1.0/5000.0;
    self.tview1.layer.sublayerTransform = trans;
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.tview1 addGestureRecognizer:panGes];
    self.doorLayer.speed = 0.0;
    
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath = @"transform.rotation.y";
    ani.toValue = @(M_PI_2);
    ani.duration = 1.0;
    [self.doorLayer addAnimation:ani forKey:nil];
}

- (void)panAction:(UIPanGestureRecognizer *)pan
{
    CGFloat x = [pan translationInView:self.tview1].x;
    x /= 200;
    CFTimeInterval timeOffset = self.doorLayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    
    self.doorLayer.timeOffset = timeOffset;
    [pan setTranslation:CGPointZero inView:self.tview1];
    
}

- (CALayer *)doorLayer {
    if (!_doorLayer) {
        CALayer *shipLayer = [CALayer layer];
        shipLayer.frame = CGRectMake(0, 0, 128 , 128*2);
        shipLayer.position = CGPointMake(150, 150);
        shipLayer.contents = (__bridge id)[UIImage imageNamed:@"door.jpg"].CGImage;
        shipLayer.anchorPoint = CGPointMake(1, 0.5);
        
        _doorLayer = shipLayer;
    }
    return _doorLayer;
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [CATransaction begin];
//    [CATransaction setAnimationDuration:1.0];
//    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
//    self.colorLayer.position = [[touches anyObject] locationInView:self.tview1];
//    [CATransaction commit];
//}

// 缓冲测试

- (void)changeEffectTest
{
    CAKeyframeAnimation *keyAni = [CAKeyframeAnimation animation];
    keyAni.keyPath = @"backgroundColor";
    keyAni.duration = 2.0;
    keyAni.values = @[
                    (__bridge id)[UIColor blueColor].CGColor,
                    (__bridge id)[UIColor redColor].CGColor,
                    (__bridge id)[UIColor greenColor].CGColor,
                    (__bridge id)[UIColor blueColor].CGColor,
                    ];
    
    CAMediaTimingFunction  *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    keyAni.timingFunctions = @[fn, fn, fn];
    [self.colorLayer addAnimation:keyAni forKey:nil];
    
    
}


@end
