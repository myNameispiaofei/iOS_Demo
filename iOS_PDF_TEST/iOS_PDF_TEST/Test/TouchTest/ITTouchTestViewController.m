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


@interface ITTouchTestViewController ()

@property (nonatomic, strong) ITTouchTestView * containerView;
@property (nonatomic, strong) ITTouchTestView * subTestView;
@property (nonatomic, strong) UIButton *testButton;

@end

@implementation ITTouchTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  configUI];
    
}


- (void)configUI {
    [self.view addSubview:self.containerView];
    [self.containerView addSubview:self.subTestView];
    [self.containerView addSubview:self.testButton];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [self.containerView addGestureRecognizer:tapGes];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [self.subTestView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).offset(70);
        make.right.mas_equalTo(self.containerView.mas_right).offset(-70);
        make.top.mas_equalTo(self.containerView.mas_top).offset(150);
        make.height.mas_equalTo(200);
    }];
    
    [self.testButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containerView.mas_left).offset(70);
        make.right.mas_equalTo(self.containerView.mas_right).offset(-70);
        make.top.mas_equalTo(self.subTestView.mas_bottom).offset(150);
        make.height.mas_equalTo(200);
    }];
    
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
