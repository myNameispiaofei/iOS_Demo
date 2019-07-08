//
//  ITRouterRequest.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITRouterRequest.h"
#import "ITCommonTool.h"
#import "NSURL+ITUtility.h"

NSString *const ITRouterDefaultScheme = @"ittest";

@implementation ITRouterRequest

- (void)setURLString:(NSString *)URLString {
    _URLString = URLString;
    if (kIsEmptyString(URLString)) {
        _pName = nil;
        _scheme = nil;
        _options = nil;
        _sourceApplication = nil;
    } else {
        [self handleURLString:URLString];
    }
}
    
- (void)handleURLString:(NSString *)URLString {
    NSURL *url = [NSURL URLWithString:URLString];
    if (url == nil) {
        NSString *urlStr = [[URLString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:urlStr];
    }
    if ([url it_isInAppUrl]) {
        _scheme = ITRouterDefaultScheme;
    } else {
        _scheme = [url scheme];
    }
    _options = [url it_queryDictionary];
    _pName = [[_options it_stringForKey:kITRouterPageName] lowercaseString];
    _sourceApplication = [_options ik_stringForKey:kITRouterSourceApplication];
    
}

@end
