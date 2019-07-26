//
//  NSURL+ITUtility.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/7/8.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "NSURL+ITUtility.h"

@implementation NSURL (ITUtility)

- (BOOL)it_isInAppUrl {
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
        NSRange range = [self.absoluteString rangeOfString:@"://"];
        NSRange finalRange = NSMakeRange(range.location+range.length,
                                         self.absoluteString.length - (range.location+range.length));
        paramsString = [self.absoluteString substringWithRange:finalRange];
        
    } else {
        paramsString = [self query];
    }
    NSArray *paths = [paramsString componentsSeparatedByString:@"?"];
    if ([paths count] > 1) {
        paramsString = paths[1];
    }
    NSArray *urlComponents = [paramsString componentsSeparatedByString:@"&"];
    
    for (NSString *keyValuePair in urlComponents) {
        NSArray *pairComponents = [keyValuePair componentsSeparatedByString:@"="];
        if (pairComponents && [pairComponents count] == 2) {
            NSString *key = [[pairComponents firstObject] stringByRemovingPercentEncoding];
            NSString *value = [[pairComponents lastObject] stringByRemovingPercentEncoding];
            if(key != nil && value != nil){
                [params setObject:value forKey:key];
            }
        } else if ([pairComponents count] >= 3) {
            NSString *key = [pairComponents firstObject];
            NSMutableArray *valueArr = [pairComponents mutableCopy];
            [valueArr removeObject:key];
            NSString *value = [valueArr componentsJoinedByString:@"="];
            
            key = [key stringByRemovingPercentEncoding];
            value = [value stringByRemovingPercentEncoding];
            if (key != nil && value != nil) {
                [params setObject:value forKey:key];
            }
        }
    }
    return params;
    
}
    
@end
