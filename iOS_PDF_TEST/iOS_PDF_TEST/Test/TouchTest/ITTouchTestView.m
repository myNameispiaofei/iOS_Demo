//
//  ITTouchTestView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/8/5.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITTouchTestView.h"
#include <objc/runtime.h>
//#import "ITProduct.h"
//#import "ITTestView.h"

@implementation ITTouchTestView
{
     
//     NSString * _name;  //1
//     NSString * _isName;  //2
//     NSString * name;    //3
//    NSString * isName;  //4
    
}


- (instancetype)init {
    if (self = [super init]) {
//        _isName = @"2";
//        _name = @"1";
//        isName = @"4";
//        name = @"3";
    }
    return self;
}


void dynamicMethodIMP(id self, SEL _cmd) {
    NSLog(@" >> 👩‍❤️‍👩我执行啦！！！");
}

// 给你一个判断sel ，并且可以动态注册IMP实现的机会
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    NSLog(@" >> Instance resolving %@", NSStringFromSelector(sel));
//    if (sel == @selector(test1)) {
//        class_addMethod([self class], sel, (IMP)dynamicMethodIMP, "v@:");
//        return NO;
//    }
      
    return [super resolveInstanceMethod:sel];
    
}

// 指定一个对象处理
- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    NSLog(@" >> forwardingTargetForSelector %@", NSStringFromSelector(aSelector));
//    if (aSelector == @selector(test1)) {
//        return  [[ITProduct alloc] init];
//    }

    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
     NSLog(@" >> methodSignatureForSelector %@", NSStringFromSelector(aSelector));
    if (aSelector == @selector(test4:)){
     return   [NSMethodSignature signatureWithObjCTypes:"v@:15"];
    }
     
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//  
//    SEL selector =[anInvocation selector];
//    
//    ITTestView *viwe1 = [[ITTestView alloc] init];
//    ITTestView *viwe2 = [[ITTestView alloc] init];
////    if (selector == @selector(test1) ) {
//        [anInvocation invokeWithTarget:viwe1];
//        [anInvocation invokeWithTarget:viwe2];
//        [viwe2 test2];
////    }
//    NSLog(@" >> forwardInvocation %@", NSStringFromSelector(anInvocation.selector));
//    
}

//- (NSString *)getName {
//    return @"1";
//}
//- (NSString *)name {
//    return @"2";
//}
//- (NSString *)isName {
//    return @"3";
//}
//- (NSString *)_getName {
//    return @"4";
//}
//- (NSString *)_name {
//    return @"5";
//}


//- (void)setName:(NSString *)name {
//    NSLog(@"laa1 %@",name);
//}
//
//- (void)_setName:(NSString *)name {
//    NSLog(@"laa1 %@",name);
//}
//- (void)setIsName:(NSString *)name {
//    NSLog(@"laa2 %@",name);
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"#mub_touchTest# touch %@: Began",self.name);
//    UIResponder *next = [self nextResponder];
//    while (next) {
//        NSLog(@"res is %@",[next class]);
//        next = [next nextResponder];
//    }
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//     NSLog(@"#mub_touchTest# touch %@: Moved",self.name);
//}
//
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//     NSLog(@"#mub_touchTest# touch %@: Cancelled",self.name);
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//     NSLog(@"#mub_touchTest# touch %@: Ended",self.name);
//}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *view = [super hitTest:point withEvent:event];
//    
//    if (view == self) {
//        return  nil;
//    }
//    return view;
//    
//}

@end
