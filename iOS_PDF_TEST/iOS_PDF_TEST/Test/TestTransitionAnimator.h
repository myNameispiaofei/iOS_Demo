//
//  TestTransitionAnimator.h
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>


typedef NS_ENUM(NSInteger,TestTransitionAnimatorType) {
    TestTransitionAnimatorPresent,
    TestTransitionAnimatorDismiss
};

NS_ASSUME_NONNULL_BEGIN



@protocol TestTransitionAnimatorDataSourec <NSObject>

- (UIView *)originVideoPlayerContainerView;

- (CGFloat)videoHeightWidthRatio;

- (CGFloat)videoDefaultHeight;

@end

@interface TestTransitionAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, weak) id<TestTransitionAnimatorDataSourec> dataSource;

- (instancetype) init NS_UNAVAILABLE;

- (instancetype)initWithTransitionAnimatorType:(TestTransitionAnimatorType)type  NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
