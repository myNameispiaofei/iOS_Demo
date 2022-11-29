//
//  TestVideoFullScreenViewController.h
//  iOS_PDF_TEST
//
//  Created by bytedance on 2022/11/4.
//  Copyright © 2022 母斌. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVKit/AVkit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TestVideoFullScreenViewController : UIViewController

@property (nonatomic, strong)AVPlayerLayer *playlayer;
@property (nonatomic, assign)BOOL disableAutoRotate;

- (instancetype)initWithAVPlayerLayer:(AVPlayerLayer*) playlayer;

@end

NS_ASSUME_NONNULL_END
