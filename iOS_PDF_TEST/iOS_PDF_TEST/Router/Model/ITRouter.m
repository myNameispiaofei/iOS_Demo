//
//  ITRouter.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITRouter.h"
#import "ITCommonTool.h"
#import "ITRouterRequest.h"

NSString *ITRouterDefaultpName = @"defaultpName";

@interface ITRouter()
    
@property (nonatomic, strong) NSMutableSet<id<ITRouterProtocol>> *protocols;
@property (nonatomic, strong) NSMutableSet<NSString *> *protocolTypes;
@property (nonatomic, strong) NSMutableDictionary<NSString*,NSMutableArray *> *schemeMapper;

@end

@implementation ITRouter

+ (instancetype)defaultRouter {
    static ITRouter *_router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_router) {
            _router = [[ITRouter alloc] init];
        }
    });
    return _router;
}
    
- (void)registerWithScheme:(NSString *)scheme handler:(Class<ITRouterProtocol>)handler {
    [self registerWithScheme:scheme pName:nil handler:handler];
}

- (void)registerWithpName:(NSString *)pName handler:(Class<ITRouterProtocol>)handler {
    [self registerWithScheme:ITRouterDefaultScheme pName:pName handler:handler];
}
    
- (void)registerWithScheme:(NSString *)scheme pName:(NSString *)pName handler:(Class<ITRouterProtocol>)handler {
    if (!scheme || !handler) {
        return;
    }
    if (!pName.length) {
        pName = ITRouterDefaultpName;
    }
    pName = [pName lowercaseString];  // 统一转化为小写
    @synchronized (_schemeMapper) {
        if ([self handlerForScheme:scheme pName:pName enableFuzzyMatch:NO]) {
            NSAssert(NO, @"同一scheme下pName需要唯一！！");
            return;
        }
        // 获得该scheme 下pName 列表
        NSMutableArray *someArray = [_schemeMapper valueForKey:scheme];
        if (!someArray) {
            someArray = [NSMutableArray array];
        }
        [someArray addObject:@{pName :NSStringFromClass(handler)}];
        [_schemeMapper setObject:someArray forKey:scheme];
    }
}

    
- (Class<ITRouterProtocol>)handlerForScheme:(NSString *)scheme pName:(nullable NSString *)pName enableFuzzyMatch:(BOOL)enableFuzzyMatch {
    if (!scheme.length) {
        return nil;
    }
    if (!pName.length) {
        pName = ITRouterDefaultpName;
    }
    @synchronized (_schemeMapper) {
        __block NSString *keyPath = [NSString stringWithFormat:@"%@.%@",scheme,pName];
        NSMutableArray *handlers = [[_schemeMapper valueForKey:keyPath] mutableCopy];
        [handlers removeObjectIdenticalTo:[NSNull null]]; // ?
        NSString *schemeHandler = [handlers lastObject];
        if (!schemeHandler & enableFuzzyMatch) {
            keyPath = nil;
            [_schemeMapper.allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([scheme hasPrefix:obj]) {
                    keyPath = [NSString stringWithFormat:@"%@.%@",obj,pName];
                    *stop = YES;
                }
            }];
        }
        if (keyPath) {
            handlers = [[_schemeMapper valueForKey:keyPath] mutableCopy];
            [handlers removeObjectIdenticalTo:[NSNull null]]; // ?
            schemeHandler = [handlers lastObject];
        }
        if (schemeHandler) {
            return NSClassFromString(schemeHandler);
        }
    }
    return nil;
}
    
    
- (BOOL)open:(NSString *)url target:(__kindof UIViewController *)target responseHandler:(id)callBackHandler {
    return [self open:url application:nil annotation:nil target:target responseHandler:callBackHandler];
}
    
- (BOOL)open:(NSString *)url application:(UIApplication *)application annotation:(id)annotation target:(__kindof UIViewController *)target responseHandler:(id)callBackHandler{
     if (kIsEmptyString(url)) return NO;
     return NO;
}
    
- (BOOL)open:(NSString *_Nullable)url
 application:(nullable UIApplication *)application
  annotation:(nullable id)annotation
      target:(nullable __kindof UIViewController *)target {
  return  [self open:url application:application annotation:annotation target:target responseHandler:nil];
}
    

    
@end
