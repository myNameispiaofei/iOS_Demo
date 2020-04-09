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
@property (nonatomic, strong) dispatch_queue_t serialTestQueue;
@property (nonatomic, strong) dispatch_queue_t concurrentTestQueue;
@property (nonatomic, strong) dispatch_queue_t serialTestQueue1;
@property (nonatomic, strong) dispatch_queue_t concurrentTestQueue1;

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
    self.serialTestQueue = dispatch_queue_create("dis_serial_test_queue", DISPATCH_QUEUE_SERIAL);
    self.serialTestQueue1 = dispatch_queue_create("dis_serial_test_queue1", DISPATCH_QUEUE_SERIAL);
    self.concurrentTestQueue = dispatch_queue_create("dis_concurrent_test_queue", DISPATCH_QUEUE_CONCURRENT);
    self.concurrentTestQueue1 = dispatch_queue_create("dis_concurrent_test_queue1", DISPATCH_QUEUE_CONCURRENT);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
    //[self opreationTest];
//    [self saleTicketTowAreas];
//    [self serialTaskTest2];
//    [self  tset222222];
    
}





//- (void)tset222222 {
//     NSLog(@"tset222222开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//     dispatch_sync(self.serialTestQueue, ^{
//        NSLog(@"before isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//        [self serialTaskTest3];
//        NSLog(@"end isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//     NSLog(@"tset222222结束 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//}
//
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
//}
//
//
//- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//     NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
//}
//
//
//- (void)viewWillLayoutSubviews {
//    [super viewWillLayoutSubviews];
//    NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
//}
//
//- (void)dealloc {
//  NSLog(@"%@ --%@",[self class],NSStringFromSelector(_cmd));
//}
//
//
//
//- (void)opreationTest {
//    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
//    //创建最后一个操作
//    NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
//        sleep(1);
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
//            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
//        }
//        NSLog(@"最后的任务:%lld thread:%@",[NSThread isMainThread] ,[NSThread currentThread]);
//    }];
////    for (int i=0; i<5-1; ++i) {
////        //创建多线程操作
////        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
////            sleep(i);
////            NSLog(@"第%d个任务 :%lld thread:%@",i,[NSThread isMainThread] ,[NSThread currentThread]);
////
////        }];
//////        if (i == 1) {
//////             [blockOperation addDependency:lastBlockOperation];
//////        }
////        //设置依赖操作为最后一个操作
////        [blockOperation addDependency:lastBlockOperation];
////        [operationQueue addOperation:blockOperation];
////
////    }
//    //将最后一个操作加入线程队列
//    for (int i = 0 ; i< 10; i++) {
//        [lastBlockOperation addExecutionBlock:^{
//            sleep(1);
//            NSLog(@"第%d个任务 :%lld thread:%@",i,[NSThread isMainThread] ,[NSThread currentThread]);
//        }];
//    }
////    [operationQueue addOperation:lastBlockOperation];
//    [lastBlockOperation start];
//
//}
//
//
//
//
//- (void)saleTicketTowAreas {
//    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
//    self.ticketSurplusCount = 50;
//
//    NSOperationQueue *queueBeijing = [[NSOperationQueue alloc] init];
//    queueBeijing.maxConcurrentOperationCount = 1;
//
//    NSOperationQueue *queueShangHai = [[NSOperationQueue alloc] init];
//    queueBeijing.maxConcurrentOperationCount = 1;
//
//    NSBlockOperation *o1 = [NSBlockOperation blockOperationWithBlock:^{
//        [self saleTicket];
//    }];
//    NSBlockOperation *o2 = [NSBlockOperation blockOperationWithBlock:^{
//        [self saleTicket];
//    }];
//    [queueBeijing addOperation:o1];
//    [queueShangHai addOperation:o2];
//
//
//}
//
//- (void)saleTicket{
//    while (1) {
//        [self.lock lock];
//        if (self.ticketSurplusCount > 0) {
//            self.ticketSurplusCount--;
//             NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", self.ticketSurplusCount, [NSThread currentThread]]);
//            [NSThread sleepForTimeInterval:0.2];
//        }
//         [self.lock unlock];
//        if (self.ticketSurplusCount <= 0){
//            NSLog(@"所有火车票均已售完");
//            break;
//        }
//    }
//}
//
/////dispatch test
//
////  同步 + 串行队列 未开启新线程  串行执行，等待任务结束依次执行， 不开启新线程
//- (void)serialTaskTest1{
//     NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    dispatch_sync(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_sync(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_sync(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
////    020-03-31 22:00:53.988032+0800 iOS_PDF_TEST[598:102716] 测试开始 isMain:1 thread:<NSThread: 0x281b7ef80>{number = 1, name = main}
////    2020-03-31 22:00:55.989576+0800 iOS_PDF_TEST[598:102716] 任务结束 isMain:1 thread:<NSThread: 0x281b7ef80>{number = 1, name = main}
////    2020-03-31 22:00:57.991125+0800 iOS_PDF_TEST[598:102716] 任务结束2 isMain:1 thread:<NSThread: 0x281b7ef80>{number = 1, name = main}
////    2020-03-31 22:00:59.992609+0800 iOS_PDF_TEST[598:102716] 任务结束3 isMain:1 thread:<NSThread: 0x281b7ef80>{number = 1, name = main}
////    2020-03-31 22:00:59.992897+0800 iOS_PDF_TEST[598:102716] 测试结束 isMain:1 thread:<NSThread: 0x281b7ef80>{number = 1, name = main}
//}
//
////  异步 + 串行队列  不阻塞当前线程  开启一条子线程
//- (void)serialTaskTest2{
//     NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//
//    dispatch_async(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(1);
//        NSLog(@"任务结束1 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_async(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//
//    dispatch_async(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(3);
//        NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_async(self.serialTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
//
////2020-03-31 22:04:07.082814+0800 iOS_PDF_TEST[601:103567] 测试开始 isMain:1 thread:<NSThread: 0x28290f140>{number = 1, name = main}
////2020-03-31 22:04:07.083065+0800 iOS_PDF_TEST[601:103567] 测试结束 isMain:1 thread:<NSThread: 0x28290f140>{number = 1, name = main}
////2020-03-31 22:04:09.089078+0800 iOS_PDF_TEST[601:103754] 任务结束 isMain:0 thread:<NSThread: 0x282952740>{number = 3, name = (null)}
////2020-03-31 22:04:11.092976+0800 iOS_PDF_TEST[601:103754] 任务结束1 isMain:0 thread:<NSThread: 0x282952740>{number = 3, name = (null)}
////2020-03-31 22:04:13.098584+0800 iOS_PDF_TEST[601:103754] 任务结束2 isMain:0 thread:<NSThread: 0x282952740>{number = 3, name = (null)}
////2020-03-31 22:04:15.104200+0800 iOS_PDF_TEST[601:103754] 任务结3 isMain:0 thread:<NSThread: 0x282952740>{number = 3, name = (null)}
//
//}
//
//
//
//// 异步 + 并发队列  开启子线程。并发执行
//
//- (void)serialTaskTest3{
//     NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    dispatch_async(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_async(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(4);
//        NSLog(@"任务结束1 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_async(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(1);
//        NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_async(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
//
////    2020-04-02 15:48:11.033667+0800 iOS_PDF_TEST[1169:528217] 测试开始 isMain:1 thread:<NSThread: 0x283383140>{number = 1, name = main}
////    2020-04-02 15:48:11.033847+0800 iOS_PDF_TEST[1169:528217] 测试结束 isMain:1 thread:<NSThread: 0x283383140>{number = 1, name = main}
////    2020-04-02 15:48:13.038500+0800 iOS_PDF_TEST[1169:528418] 任务结束 isMain:0 thread:<NSThread: 0x2833df580>{number = 3, name = (null)}
////    2020-04-02 15:48:13.039708+0800 iOS_PDF_TEST[1169:528533] 任务结束1 isMain:0 thread:<NSThread: 0x2833e6ec0>{number = 9, name = (null)}
////    2020-04-02 15:48:13.039782+0800 iOS_PDF_TEST[1169:528538] 任务结束2 isMain:0 thread:<NSThread: 0x2833ff580>{number = 10, name = (null)}
////    2020-04-02 15:48:13.039882+0800 iOS_PDF_TEST[1169:528539] 任务结3 isMain:0 thread:<NSThread: 0x2833dc900>{number = 11, name = (null)}
//
//
//}
//
//
//
////  同步 + 并发队列  （未开启 新线程 串行执行）
//- (void)serialTaskTest4 {
//    NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    dispatch_sync(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束001 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_sync(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束1 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_sync(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    dispatch_sync(self.concurrentTestQueue, ^{
//        // 模拟 耗时操作
//        sleep(2);
//        NSLog(@"任务结3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//    });
//    NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
////    2020-04-02 14:40:01.814442+0800 iOS_PDF_TEST[1130:510884] 测试开始 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
////    2020-04-02 14:40:03.816005+0800 iOS_PDF_TEST[1130:510884] 任务结束001 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
////    2020-04-02 14:40:05.817581+0800 iOS_PDF_TEST[1130:510884] 任务结束1 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
////    2020-04-02 14:40:07.819411+0800 iOS_PDF_TEST[1130:510884] 任务结束2 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
////    2020-04-02 14:40:09.821039+0800 iOS_PDF_TEST[1130:510884] 任务结3 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
////    2020-04-02 14:40:09.821458+0800 iOS_PDF_TEST[1130:510884] 测试结束 isMain:1 thread:<NSThread: 0x281c1b180>{number = 1, name = main}
//
//}
//
//
//// 异步 + 主队列  未开启新线程 串行执行
//- (void)serialTaskTest5 {
//       NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       dispatch_async(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束001 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_async(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束1 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_async(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_async(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//       NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
//
////    2020-04-02 15:42:51.019039+0800 iOS_PDF_TEST[1166:526779] 测试开始 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
////    2020-04-02 15:42:51.019202+0800 iOS_PDF_TEST[1166:526779] 测试结束 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
////    2020-04-02 15:42:53.020216+0800 iOS_PDF_TEST[1166:526779] 任务结束001 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
////    2020-04-02 15:42:55.021569+0800 iOS_PDF_TEST[1166:526779] 任务结束1 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
////    2020-04-02 15:42:57.022850+0800 iOS_PDF_TEST[1166:526779] 任务结束2 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
////    2020-04-02 15:42:59.024137+0800 iOS_PDF_TEST[1166:526779] 任务结3 isMain:1 thread:<NSThread: 0x280002780>{number = 1, name = main}
//
//}
//
//
//// 同步 + 主队列  死锁
//- (void)serialTaskTest6 {
//       NSLog(@"测试开始 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       dispatch_sync(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束001 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_sync(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束1 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_sync(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结束2 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//
//       dispatch_sync(dispatch_get_main_queue(), ^{
//           // 模拟 耗时操作
//           sleep(2);
//           NSLog(@"任务结3 isMain:%@ thread:%@",@([NSThread isMainThread]) ,[NSThread currentThread]);
//       });
//       NSLog(@"测试结束 isMain:%@ thread:%@",@([NSThread isMainThread]),[NSThread currentThread]);
//}



@end
