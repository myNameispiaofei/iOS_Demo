//
//  ITRouterRequest.h
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kITRouterPageName @"pname"
#define kIKRouterSourceApplication @"it_src_app"

UIKIT_EXTERN NSString *const ITRouterDefaultScheme;

typedef void(^ITRouterResultCallback)(NSError *error, NSDictionary *responseObject);


NS_ASSUME_NONNULL_BEGIN

@interface ITRouterRequest : NSObject
    
@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, copy) ITRouterResultCallback resultCallBack;
@property (nonatomic, copy, readonly) NSString *pName;
@property (nonatomic, copy, readonly) NSString *scheme;
@property (nonatomic, copy, readonly) NSString *sourceApplication;
@property (nonatomic, strong, readonly) NSDictionary *options;

+ (instancetype)requestWithURLString:(NSString *)URLString resultCallback:(ITRouterResultCallback)resultCallback;


@end

NS_ASSUME_NONNULL_END
