//
//  ITRouter.h
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol ITRouterProtocol <NSObject>

@end

@protocol ITRouterDelegate <NSObject>
    
@optional
    
- (void)beforeHandingUrl:(NSString *_Nullable)url;

@end


@interface ITRouter : NSObject
    
+ (instancetype)defaultRouter;
@property (nonatomic, weak) id<ITRouterDelegate> delegate;


/**
 *  每个模块注册自己的路由跳转处理，pName为空，例如第三方SDK、HTTP链接
 *
 *  @param scheme URL Scheme
 *  @param handler 处理跳转的类
 */
- (void)registerWithScheme:(NSString *)scheme handler:(Class<ITRouterProtocol>)handler;

/**
 
 * 每个模块注册自己的路由跳转处理，scheme 使用默认 scheme
 @param pName 页面名称
 @param handler 跳转处理类
 */
- (void)registerWithpName:(NSString *)pName handler:(Class<ITRouterProtocol>)handler;
    
/**
 *  每个模块注册自己的路由跳转处理
 *
 *  @param scheme URL Scheme
 *  @param pName 页面名称
 *  @param handler 处理跳转的类
 */
- (void)registerWithScheme:(NSString *_Nullable)scheme
                     pName:(nullable NSString *)pName
                   handler:(Class<ITRouterProtocol>)handler;

    
    
    
- (BOOL)open:(NSString *_Nullable)url
 application:(nullable UIApplication *)application
  annotation:(nullable id)annotation
      target:(nullable __kindof UIViewController *)target;
    
- (BOOL)open:(NSString *_Nullable)url
      target:(nullable __kindof UIViewController *)target
responseHandler:(id _Nullable )callBackHandler;
    
- (BOOL)open:(NSString *_Nullable)url
 application:(nullable UIApplication *)application
  annotation:(nullable id)annotation
      target:(nullable __kindof UIViewController *)target
responseHandler:(id _Nullable )callBackHandler;
    
    
/**
 *  每个模块注册自己的路由跳转处理
 *
 *  @param protol 跳转处理
 */
- (void)registerRouter:(id<ITRouterProtocol>)protol DEPRECATED_ATTRIBUTE;
    
/**
 *  打开指定的url （在主线程调用）
 *
 * @return return 是否打开成功
 */
- (BOOL)open:(NSString *)url target:(nullable __kindof UIViewController *)target DEPRECATED_ATTRIBUTE;
    

@end


