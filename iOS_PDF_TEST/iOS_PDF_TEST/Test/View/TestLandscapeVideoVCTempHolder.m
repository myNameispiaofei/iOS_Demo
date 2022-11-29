//
//  TestLandscapeVideoVCTempHolder.m
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import "TestLandscapeVideoVCTempHolder.h"

@implementation TestLandscapeVideoVCTempHolder

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static TestLandscapeVideoVCTempHolder *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TestLandscapeVideoVCTempHolder alloc] init];
    });
    return sharedInstance;
}

@end
