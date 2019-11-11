//
//  ITProduct.h
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/9/11.
//  Copyright © 2019 母斌. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ITProduct : NSObject

@end

@interface ITPartE :NSObject

@property (nonatomic, copy) NSString * partA;
@property (nonatomic, copy) NSString * partB;

+ (instancetype)buildWithPartA:(NSString *)partA
                         partB:(NSString *)partB;

@end

@interface ITProductA :NSObject

@property (nonatomic, copy) NSString * partC;
@property (nonatomic, copy) NSString * partD;
@property (nonatomic, strong) ITPartE * partE;
+ (instancetype)buildWithPartC:(NSString *)partC
                         partD:(NSString *)partD
                       ITPartE:(ITPartE *)partE;


@end

@interface ITProductB :NSObject

@property (nonatomic, copy) NSString * partA;
@property (nonatomic, copy) NSString * partB;
@property (nonatomic, copy) NSString * partC;

+ (instancetype)buildWithPartA:(NSString *)partA
                         partB:(NSString *)partB
                         partC:(NSString *)partC;

@end


NS_ASSUME_NONNULL_END
