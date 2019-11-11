
//
//  ITDispatchTestController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/8/23.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITDispatchTestController.h"
#import <Masonry/Masonry.h>
#import "ITProduct.h"

static NSInteger a= 0,b= 0,c= 0,d= 0,e= 0,pa= 0,pb= 0;
static NSInteger count = 1;

@interface ITDispatchTestController ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) NSLock *lock;
@property (nonatomic, strong) NSCondition  *condition;
@property (nonatomic, assign) UIStatusBarStyle oldStatusBarStyle;
@property (nonatomic, strong) NSMutableArray<NSString *> *partAArr;
@property (nonatomic, strong) NSMutableArray<NSString *> *partBArr;
@property (nonatomic, strong) NSMutableArray<NSString *> *partCArr;
@property (nonatomic, strong) NSMutableArray<NSString *> *partDArr;
@property (nonatomic, strong) NSMutableArray<ITPartE *> *partEArr;
@property (nonatomic, strong) NSMutableArray<ITProductB*> *productBArr;
@property (nonatomic, strong) NSMutableArray<ITProductA*> *productAArr;
@property (nonatomic, strong) dispatch_queue_t product_queue;
@property (nonatomic, strong) NSConditionLock *conditinLock;
@property (nonatomic, strong) dispatch_group_t group;
@property (nonatomic, assign) __block BOOL flag;
@property (nonatomic,   weak) NSObject * ptr ;


@end

@implementation ITDispatchTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject *oc = [NSObject new];
    _ptr = oc;
    _lock = [[NSLock alloc] init];
    _conditinLock = [[NSConditionLock alloc] initWithCondition:1];
    _condition = [[NSCondition alloc] init];
    self.textLabel = [[UILabel alloc] init];
    // 并发
    self.group = dispatch_group_create();
    [self.view addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(200);
    }];
    self.textLabel.text = @"测试文案1";
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.backgroundColor = [UIColor redColor];
    self.oldStatusBarStyle = [UIApplication sharedApplication].statusBarStyle;
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle:self.oldStatusBarStyle animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self dispatchTest1];
//    [self dispatchTest2];
//    [self dispatchTest3];
//    [self dispatchTest4];
//    [self dispatchTest5];
//    [self dispatchTest6];
//    [self dispatchTest7];
//    [self dispatchTest8];
//    [self dispatchTest9];
//    [self dispatchTest10];
//      [self dispatchTest11];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [self configArrs];
//    self.flag = YES;
//    while (_flag) {
//       [self buildPB];
//    }
}

- (void)dispatchTest1 {
    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger i = 1;
        while (i) {
            usleep(30 * 1000);
            NSLog(@"mub_dispatchTest#%ld",(long)i);
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
            NSLog(@"mub_dispatchTest#%ld",(long)i);
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
            NSLog(@"mub_dispatchTest#%ld",(long)i);
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
    NSLog(@"mub_dispatchTest#a i:%ld",(long)i);
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
        NSLog(@"mub_dispatchTest#global_block i:%ld",(long)i);
        NSLog(@"mub_dispatchTest#3isMain:%p",[NSThread currentThread]);
//        [self.condition broadcast];
        
    });
//    while (!cc) {
//        [_condition wait];
//    }
    i = 20;
//    [self.condition unlock];
    NSLog(@"mub_dispatchTest#b i:%ld",(long)i);
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

// 串行队列死锁crash的例子（在同个线程的串行队列任务执行过程中，再次发送dispatch_sync 任务到串行队列，会crash）
- (void)dispatchTest9{
    dispatch_queue_t sQ1 = dispatch_queue_create("stq01", 0);
    dispatch_async(sQ1, ^{
        NSLog(@"enter sq1");
        dispatch_sync(sQ1, ^{
            NSLog(@"sync sq1");
        });
    });
}


//串行死锁的例子（这里不会crash，在线程A执行串行任务task1的过程中，又在线程B中投递了一个task2到串行队列同时使用dispatch_sync等待，死锁，但GCD不会测出）
- (void)dispatchTest10 {
    dispatch_queue_t sQ1 = dispatch_queue_create("stq01", 0);
    dispatch_async(sQ1, ^{
        NSLog(@"enter sq1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            dispatch_sync(sQ1, ^{
                NSArray *a = [NSArray new];
                NSLog(@"Enter again %@", a);
            });
        });
        NSLog(@"Done");
    });
}

//  会崩溃
- (void)dispatchTest11 {
    dispatch_queue_t sQ1 = dispatch_queue_create("stq01", 0);
    dispatch_queue_t sQ2 = dispatch_queue_create("com.lai.www", 0);
    dispatch_async(sQ1, ^{
        NSLog(@"mub_dispatchTest#e1  current:%p",[NSThread currentThread]);
        dispatch_sync(sQ2, ^{
            NSLog(@"mub_dispatchTest#e2  current:%p",[NSThread currentThread]);
            NSLog(@"Enter2");
            dispatch_sync(sQ1, ^{
                NSLog(@"mub_dispatchTest#e3 current:%p",[NSThread currentThread]);
                NSArray *a = [NSArray new];
                NSLog(@"Enter again %@", a);
            });
        });
        NSLog(@"Done");
    });
}

// 多任务同时执行
//  需求场景 生产零件A 生产零件B 生产零件C
//  组装产品 A+B+C = PB

- (void)buildPB {
    
    // 生产PB
//    dispatch_async(self.product_queue, ^{
//        [self buildAPb];
//    });
//     生产A
    dispatch_async(self.product_queue, ^{
        [self buildPartA];

    });
    // 生产B
    dispatch_async(self.product_queue, ^{
         [self buildPartB];
    });
    // 生产C
    dispatch_async(self.product_queue, ^{
        [self buildPartC];
    });

    // 生产PB
    dispatch_async(self.product_queue, ^{
        [self buildAPb];
    });
    
  
//    dispatch_group_async(self.group, self.product_queue, ^{
//        [self buildPartA];
//    });
//    dispatch_group_async(self.group, self.product_queue, ^{
//        [self buildPartB];
//    });
//    dispatch_group_async(self.group, self.product_queue, ^{
//        [self buildPartC];
//    });
//    dispatch_group_async(self.group, self.product_queue, ^{
//        [self buildAPb];
//    });
    
}



- (void)buildPartA {

    NSString * partA = [NSString stringWithFormat:@"PartA_%ld",a];
    NSLog(@"mub --A *%@",partA);
    a++;
    [self.partAArr addObject:partA];
  
}
- (void)buildPartB {

    NSString * partB = [NSString stringWithFormat:@"PartB_%ld",b];
    NSLog(@"mub --B *%@",partB);
    b++;
    [self.partBArr addObject:partB];
    
}
- (void)buildPartC {
    NSString * partC = [NSString stringWithFormat:@"PartC_%ld",c];
      NSLog(@"mub --C *%@",partC);
    c++;
    [self.partCArr addObject:partC];
}
- (void)buildPartD {
    NSString * partA = [NSString stringWithFormat:@"PartD_%ld",d];
    d++;
    [self.partDArr addObject:partA];
}

- (void)buildPartE {
    
}

- (void)buildAPb {
    
    if ([self canBuildPb]) {
        pb ++;
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"mub -- isMain%ll" ,[NSThread isMainThread]);
            self.flag = NO;
        });
//        ITProductB *pB = [ITProductB buildWithPartA:self.partAArr.firstObject partB:self.partBArr.firstObject partC:self.partCArr.firstObject];
//        [self.partAArr removeObjectAtIndex:0];
//        [self.partBArr removeObjectAtIndex:0];
//        [self.partCArr removeObjectAtIndex:0];
//        [self.productBArr addObject:pB];
//        NSLog(@"mub -- makePb:%ld [pbContext:%@]",pb,[pB description]);
//        if (self.productBArr.count > 25) {
//
//
//        } else {
//
//        }
    }
}


- (BOOL)canBuildPb {
    return self.partAArr.count && self.partBArr.count && self.partCArr.count;
}

- (void)configArrs {
    self.product_queue = dispatch_queue_create("stq01", DISPATCH_QUEUE_CONCURRENT);
    self.partAArr = [NSMutableArray array];
    self.partBArr = [NSMutableArray array];
    self.partCArr = [NSMutableArray array];
    self.partDArr = [NSMutableArray array];
    self.partEArr = [NSMutableArray array];
    self.productAArr = [NSMutableArray array];
    self.productBArr = [NSMutableArray array];
}

// 多任务同时执行
//  需求场景 生产零件A 生产零件B 生产零件C 生产零件D
//  组装A+B 得到零件E
//  组装 E + C + D  得到产品 PA






// runtime应用
// runloop 应用
// 渲染原理  代码
// 包大小优化 原理
// APP 启动流程、优化
// 编译原理
// 动画区别优点、常见动画
// 自动释放池
// 字典、数组的原理
// hash 表如何实现，如何解决冲突

@end
