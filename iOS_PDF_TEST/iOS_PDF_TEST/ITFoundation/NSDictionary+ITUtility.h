//
//  NSDictionary+ITUtility.h
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/15.
//  Copyright © 2019 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (ITUtility)
- (NSString *)it_stringForKey:(NSString *)keyPath;

- (NSDictionary *)it_dictionaryForKey:(NSString *)keyPath;

- (NSArray *)it_arrayForKey:(NSString *)keyPath;

- (NSNumber *)it_numberForKey:(NSString *)keyPath;

- (NSInteger)it_integerForKeyPath:(NSString *)keyPath;

- (NSUInteger)it_uintegerForKeyPath:(NSString *)keyPath;

- (BOOL)it_boolForKer:(NSString *)keyPath;


@end

NS_ASSUME_NONNULL_END
