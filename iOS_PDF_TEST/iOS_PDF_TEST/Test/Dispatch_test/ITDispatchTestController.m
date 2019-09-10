
//
//  ITDispatchTestController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/8/23.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITDispatchTestController.h"
#import <Masonry/Masonry.h>

@interface ITDispatchTestController ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSCondition  *condition;
@end

@implementation ITDispatchTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lock = [[NSLock alloc] init];
    _condition = [[NSCondition alloc] init];
    self.textLabel = [[UILabel alloc] init];
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
    self.textLabel.text = @"测试文案1";
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.backgroundColor = [UIColor redColor];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self dispatchTest1];
//    [self dispatchTest2];
//    [self dispatchTest3];
//    [self dispatchTest4];
//    [self dispatchTest5];
//      [self dispatchTest6];
//  [self dispatchTest7];
    [self dispatchTest8];
}


- (void)dispatchTest1 {
    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger i = 1;
        while (i) {
            usleep(30 * 1000);
            NSLog(@"mub_dispatchTest#%ld",i);
            i++;
            if (i == 100) {
                wself.textLabel.text = @"你好！！！";
            }
        }
    });
}


- (void)dispatchTest2 {
    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger i = 1;
        while (i) {
            usleep(30 * 1000);
            NSLog(@"mub_dispatchTest#%ld",i);
            i++;
            if (i == 100) {
                wself.textLabel.text = @"你好！！！";
                i = 0;
            }
        }
    });
}

- (void)dispatchTest3 {
    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger i = 1;
        while (i) {
            usleep(30 * 1000);
            NSLog(@"mub_dispatchTest#%ld",i);
            i++;
            if (i == 100) {
                wself.textLabel.text = @"你好！！！";
            }
            if (i == 150) {
                i = 0;
            }
        }
    });
}


- (void)dispatchTest4 {
    __weak typeof(self) wself = self;
    NSLog(@"mub_dispatchTest#sMain:%d",[NSThread isMainThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSInteger i = 1;
        while (i) {
            usleep(3000 *10);
            i++;
            if (i== 100) {
                dispatch_async(dispatch_get_main_queue(), ^{
                   wself.textLabel.text = @"你好！！！";
                });
            }
            if (i == 130) {
                i = 0;
            }
            NSLog(@"mub_dispatchTest#%ld isMain:%d",i,[NSThread isMainThread]);
        }
    });
     NSLog(@"mub_dispatchTest#sMain:%d",[NSThread isMainThread]);
}


- (void)dispatchTest5 {
    __block NSInteger i = 10;
    __block BOOL cc = NO;
//    [self.condition lock];
    NSLog(@"mub_dispatchTest#a i:%ld",i);
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"mub_dispatchTest#block i:%ld",i);
//    });
//    dispatch_async(dispatch_get_main_queue(), ^{
//        NSLog(@"mub_dispatchTest#global_block i:%ld",i);
//        NSLog(@"mub_dispatchTest# 5555isMain:%d",[NSThread isMainThread]);
//    });
    // 同一个？？？
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        cc = YES;
        NSLog(@"mub_dispatchTest#global_block i:%ld",i);
        NSLog(@"mub_dispatchTest#3isMain:%p",[NSThread currentThread]);
//        [self.condition broadcast];
        
    });
//    while (!cc) {
//        [_condition wait];
//    }
    i = 20;
//    [self.condition unlock];
    NSLog(@"mub_dispatchTest#b i:%ld",i);
}

- (void)dispatchTest6 {
    NSLog(@"mub_dispatchTest# isMain:%d",[NSThread isMainThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"mub_dispatchTest#isMain:%p",[NSThread currentThread]);
        [self dispatchTest5];
    });
}


- (void)dispatchTest7 {
    __block NSInteger i = 10;
    // dispatch_get_global_queue 未切线程， 主线程
    NSLog(@"isMain:%d",[NSThread isMainThread]);
    NSLog(@"mub_dispatchTest#7s i:%ld, isMain:%p",i,[NSThread currentThread]);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"mub_dispatchTest#global_block i:%ld, isMain:%p",i,[NSThread currentThread]);
        NSLog(@"isMain:%d",[NSThread isMainThread]);
        while (1) {
            NSLog(@"isMain:%d",[NSThread isMainThread]);
        }
    });
    i = 20;
    NSLog(@"mub_dispatchTest#7e i:%ld, isMain:%p",i,[NSThread currentThread]);
    NSLog(@"isMain:%d",[NSThread isMainThread]);
}


- (void)dispatchTest8 {
    __block NSInteger i = 10;
    // dispatch_get_global_queue 未切线程， 主线程
    NSLog(@"isMain:%d",[NSThread isMainThread]);
    NSLog(@"mub_dispatchTest#7s i:%ld, isMain:%p",i,[NSThread currentThread]);
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSLog(@"mub_dispatchTest#global_block i:%ld, isMain:%p",i,[NSThread currentThread]);
        NSLog(@"isMain:%d",[NSThread isMainThread]);
        NSInteger i = 1;
        while (i) {
            i++;
            if (i == 100) {
                i = 0;
            }
            NSLog(@"isMain:%d",[NSThread isMainThread]);
        }
    });
    i = 20;
    NSLog(@"mub_dispatchTest#7e i:%ld, isMain:%p",i,[NSThread currentThread]);
    NSLog(@"isMain:%d",[NSThread isMainThread]);
}



@end
