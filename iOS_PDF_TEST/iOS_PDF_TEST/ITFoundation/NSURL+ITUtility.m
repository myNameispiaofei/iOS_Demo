//
//  NSURL+ITUtility.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "NSURL+ITUtility.h"

@implementation NSURL (ITUtility)

- (BOOL)ik_isInAppUrl {
    BOOL result = NO;
    if ((self.scheme && [[self.scheme lowercaseString] isEqualToString:@"ittest"]) || [self it_isITLink]) {
        result = YES;
    }
    return result;
}

- (BOOL)it_isITLink {
    BOOL result = NO;
    if ([self.absoluteString containsString:@"link=ittest"]||[self.absoluteString containsString:@"isITLink=1"]||![self.absoluteString containsString:@"isNotITAppUrl=1"]) {
        result = YES;
    }
    return result;
}
- (NSDictionary *)it_queryDictionary {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    NSString *paramsString = nil;
    if (!([self.absoluteString hasPrefix:@"http://"]||[self.absoluteString hasPrefix:@"https://"])) {
        return nil;
    }
    return nil;
}
    
@end
