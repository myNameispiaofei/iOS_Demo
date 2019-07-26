//
//  NSDictionary+ITUtility.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/15.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "NSDictionary+ITUtility.h"

@implementation NSDictionary (ITUtility)

- (NSString *)it_stringForKey:(NSString *)keyPath {
    return [self _valueFromDictionary:self
                          withKeyPath:keyPath
                          classVerify:[NSString class]];
}

- (NSDictionary *)it_dictionaryForKey:(NSString *)keyPath {
    return [self _valueFromDictionary:self
                          withKeyPath:keyPath
                          classVerify:[NSDictionary class]];
}

- (NSArray *)it_arrayForKey:(NSString *)keyPath {
    return [self _valueFromDictionary:self
                          withKeyPath:keyPath
                          classVerify:[NSArray class]];
}


- (NSNumber *)it_numberForKey:(NSString *)keyPath {
    return [self _valueFromDictionary:self
                          withKeyPath:keyPath
                          classVerify:[NSNumber class]];
}


- (NSInteger)it_integerForKeyPath:(NSString *)keyPath {
    return [[self it_numberForKey:keyPath] integerValue];
}

- (NSUInteger)it_uintegerForKeyPath:(NSString *)keyPath {
    return [[self it_numberForKey:keyPath] unsignedIntegerValue];
}

- (BOOL)it_boolForKer:(NSString *)keyPath {
    NSNumber *num = [self it_numberForKey:keyPath];
    if (num) {
        return [num boolValue];
    }
    return [[self it_stringForKey:keyPath] boolValue];
}



#pragma mark private
- (id)_valueFromDictionary:(NSDictionary *)dict
               withKeyPath:(NSString *)keyPath
               classVerify:(Class)cl {
    if (!dict || !keyPath) {
        return nil;
    }
    id p;
    @try {
        p = [dict valueForKeyPath:keyPath];
        if (![p isKindOfClass:cl]) {
            p = nil;
        }
    } @catch (NSException *exception) {
        p = nil;
    } @finally {
        return p;
    }
}

@end
