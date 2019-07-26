//
//  NSURL+ITUtility.h
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSURL (ITUtility)

- (BOOL)it_isInAppUrl;
- (BOOL)it_isITLink;
- (NSDictionary *)it_queryDictionary;

@end

NS_ASSUME_NONNULL_END
