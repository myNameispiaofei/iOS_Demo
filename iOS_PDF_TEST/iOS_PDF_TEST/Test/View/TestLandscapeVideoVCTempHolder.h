//
//  TestLandscapeVideoVCTempHolder.h
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestLandscapeVideoVCTempHolder : NSObject

@property (nonatomic, strong, nullable) UIImage *screenShotImage;

+ (instancetype _Nonnull)sharedInstance;

@end

NS_ASSUME_NONNULL_END
