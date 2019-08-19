//
//  ITTouchTestViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/8/5.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITTouchTestViewController.h"
#import "ITTouchTestView.h"
#import <Masonry/Masonry.h>
#import "ITCommonTool.h"


@interface ITTouchTestViewController ()

@property (nonatomic, strong) ITTouchTestView * containerView;
@property (nonatomic, strong) ITTouchTestView * subTestView;
@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) NSString *testStr;
@property (nonatomic,   copy) NSString *testStr1;
@property (nonatomic, strong) NSMutableString *muttestStr;
@property (nonatomic,   copy) NSMutableString *muttestStr1;
@property (nonatomic, strong) UIView *testView;

@end

@implementation ITTouchTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test2];
    [self  configUI];
    [self frameTest1];
    [self frameTest2];
}
// 不可变 赋值给 copy & strong
//- (void)test1 {
//    NSString *casasc = @"this is string!";
//    _testStr = casasc;
//    _testStr1 = casasc;
//
//
//    NSLog(@"_testStr:%p,_testStr1:%p ,tmp:casasc",&_testStr,&_testStr1,&casasc);
//
//}
//- (void)test2 {
//    NSString *casasc = @"this is string!dasdasdasdasdadasdasd";
//    NSMutableString * str = [[NSMutableString alloc] initWithString:casasc];
//    _muttestStr = str;
//    _muttestStr1 = str;
//    [_muttestStr1 insertString:@"d455555" atIndex:3 ];
//    [_muttestStr insertString:@"d455555" atIndex:3];
//
//    NSLog(@"_testStr:%p,_testStr1:%p ,tmp:casasc",&_testStr,&_testStr1,&str);
//
//}

- (void)frameTest1 {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(79.289321881345245, 179.28932188134524, 141.42135623730951, 141.42135623730951)];
    view2.backgroundColor = kRGBAColor(0x000000, 0.5);
     [self.view addSubview: view2];
    
    
    _testView = view;
    _testView.backgroundColor = [UIColor yellowColor];
    UITapGestureRecognizer * ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.view addSubview:_testView];
    [self.testView addGestureRecognizer:ges];
   
}


- (void)frameTest3 {
     NSLog(@"annBeg:%@  bounds:%@ ,anchor:%@",NSStringFromCGRect(self.testView.frame),NSStringFromCGRect(self.testView.bounds),NSStringFromCGPoint(self.testView.center));
    [UIView animateWithDuration:3 animations:^{
        self.testView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
          NSLog(@"annEnd:%@  bounds:%@ ,anchor:%@",NSStringFromCGRect(self.testView.frame),NSStringFromCGRect(self.testView.bounds),NSStringFromCGPoint(self.testView.center));
    }];
}

- (void)frameTest2 {
    NSLog(@"annBeg:%@  bounds:%@ ,anchor:%@",NSStringFromCGRect(self.testView.frame),NSStringFromCGRect(self.testView.bounds),NSStringFromCGPoint(self.testView.center));
    [UIView animateWithDuration:3 animations:^{
        //正的表示逆时针，负的表示顺时针
        self.testView.transform = CGAffineTransformRotate(self.testView.transform,-M_PI/6);
    } completion:^(BOOL finished) {
        NSLog(@"annEnd:%@  bounds:%@",NSStringFromCGRect(self.testView.frame),NSStringFromCGRect(self.testView.bounds));
    }];
    
    
    CGPoint p = CGPointMake(100, 200);
    CGPoint pCenter = CGPointMake(150, 250);
    float l = (float) ((M_PI) / 180 * 30);
    float cosv = (float) cos(l);
    float sinv = (float) sin(l);
    float newX = (float) ((p.x - pCenter.x) * cosv - (p.y - pCenter.y) * sinv + pCenter.x);
    float newY = (float) ((p.x - pCenter.x) * sinv + (p.y - pCenter.y) * cosv + pCenter.y);
    
   // p1 y正确
   CGPoint p1 = [self angle:30 point:p center:pCenter];
   NSLog(@"cal p1:%@ ",NSStringFromCGPoint(p1));
   //  p2 x正确
   CGPoint p2 = [self angle:-30 point:p center:pCenter];
   NSLog(@"cal p2:%@ ",NSStringFromCGPoint(p2));

    
}

- (CGPoint)angle:(float)angle point:(CGPoint)p  center:(CGPoint)pCenter {
    float l = (float) ((M_PI) / 180 * angle);
    float cosv = (float) cos(l);
    float sinv = (float) sin(l);
    float newX = (float) ((p.x - pCenter.x) * cosv - (p.y - pCenter.y) * sinv + pCenter.x);
    float newY = (float) ((p.x - pCenter.x) * sinv + (p.y - pCenter.y) * cosv + pCenter.y);
    CGPoint p1 = CGPointMake(newX, newY);
    return p1;
}



- (void)configUI {

    [self.view addSubview:self.containerView];
//    [self.containerView addSubview:self.subTestView];
//    [self.containerView addSubview:self.testButton];
//    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
//    [self.containerView addGestureRecognizer:tapGes];
//
//    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
//    }];
//
//    [self.subTestView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.containerView.mas_left).offset(70);
//        make.right.mas_equalTo(self.containerView.mas_right).offset(-70);
//        make.top.mas_equalTo(self.containerView.mas_top).offset(150);
//        make.height.mas_equalTo(200);
//    }];
//
//    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(self.containerView.mas_left).offset(70);
//        make.right.mas_equalTo(self.containerView.mas_right).offset(-70);
//        make.top.mas_equalTo(self.subTestView.mas_bottom).offset(150);
//        make.height.mas_equalTo(200);
//    }];
    
}


- (ITTouchTestView *)containerView {
    if (!_containerView) {
        _containerView = [[ITTouchTestView alloc] init];
        _containerView.backgroundColor = [UIColor grayColor];
        _containerView.name = @"container";
    }
    return _containerView;
}

- (ITTouchTestView *)subTestView {
    if (!_subTestView) {
        _subTestView = [[ITTouchTestView alloc] init];
        _subTestView.backgroundColor = [UIColor yellowColor];
        _subTestView.name = @"sub";
    }
    return _subTestView;
}

- (UIButton *)testButton {
    if (!_testButton) {
        _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_testButton addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside ];
        [_testButton setBackgroundColor:[UIColor redColor]];
    }
    return _testButton;
}


- (void)tapAction {
    NSLog(@"#mub_touchTest# tapAction");
}

- (void)clickBtn {
    NSLog(@"#mub_touchTest# testBtn click");
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"#mub_touchTest# touch vC: Began");
//}
//
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"#mub_touchTest# touch vC: Moved");
//}
//
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"#mub_touchTest# touch vC: Cancelled");
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"#mub_touchTest# touch vC: Ended");
//}
@end
