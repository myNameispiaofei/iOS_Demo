//
//  MULifeViewController.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2020/3/26.
//  Copyright © 2020 母斌. All rights reserved.
//

#import "MULifeViewController.h"

@interface MULifeViewController ()
@property (nonatomic,assign) BOOL heee;
@property (nonatomic, assign) NSInteger ticketSurplusCount;
@property (nonatomic, strong) NSLock *lock;

@end

@implementation MULifeViewController

- (void)loadView {
//    NSLog(@"%@ --%@ -- %@",[self class],NSStringFromSelector(_cmd), self.view);
    [super loadView];
    NSLog(@"11%@ --%@ --",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
    self.lock = [[NSLock alloc] init];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
    //[self opreationTest];
    [self saleTicketTowAreas];
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



- (void)opreationTest {
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    //创建最后一个操作
    NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
        sleep(1);
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
        NSLog(@"最后的任务:%lld thread:%@",[NSThread isMainThread] ,[NSThread currentThread]);
    }];
//    for (int i=0; i<5-1; ++i) {
//        //创建多线程操作
//        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
//            sleep(i);
//            NSLog(@"第%d个任务 :%lld thread:%@",i,[NSThread isMainThread] ,[NSThread currentThread]);
//
//        }];
////        if (i == 1) {
////             [blockOperation addDependency:lastBlockOperation];
////        }
//        //设置依赖操作为最后一个操作
//        [blockOperation addDependency:lastBlockOperation];
//        [operationQueue addOperation:blockOperation];
//
//    }
    //将最后一个操作加入线程队列
    for (int i = 0 ; i< 10; i++) {
        [lastBlockOperation addExecutionBlock:^{
            sleep(1);
            NSLog(@"第%d个任务 :%lld thread:%@",i,[NSThread isMainThread] ,[NSThread currentThread]);
        }];
    }
//    [operationQueue addOperation:lastBlockOperation];
    [lastBlockOperation start];
    
}




- (void)saleTicketTowAreas {
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    self.ticketSurplusCount = 50;
    
    NSOperationQueue *queueBeijing = [[NSOperationQueue alloc] init];
    queueBeijing.maxConcurrentOperationCount = 1;
    
    NSOperationQueue *queueShangHai = [[NSOperationQueue alloc] init];
    queueBeijing.maxConcurrentOperationCount = 1;
    
    NSBlockOperation *o1 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicket];
    }];
    NSBlockOperation *o2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicket];
    }];
    [queueBeijing addOperation:o1];
    [queueShangHai addOperation:o2];
    
    
}

- (void)saleTicket{
    while (1) {
        [self.lock lock];
        if (self.ticketSurplusCount > 0) {
            self.ticketSurplusCount--;
             NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        }
         [self.lock unlock];
        if (self.ticketSurplusCount <= 0){
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}

@end
