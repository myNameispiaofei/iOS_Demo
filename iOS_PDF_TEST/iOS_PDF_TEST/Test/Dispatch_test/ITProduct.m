//
//  ITProduct.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/9/11.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITProduct.h"

@implementation ITProduct

@end

@implementation ITPartE

+ (instancetype)buildWithPartA:(NSString *)partA
                         partB:(NSString *)partB {
    ITPartE *pE = [[ITPartE alloc] init];
    pE.partB = partB;
    pE.partA = partA;
    return pE;
}

@end

@implementation ITProductA

+ (instancetype)buildWithPartC:(NSString *)partC
                         partD:(NSString *)partD
                       ITPartE:(ITPartE *)partE {
    ITProductA *pa = [[ITProductA alloc] init];
    pa.partC = partC;
    pa.partD = partD;
    pa.partE = partE;
    return pa;
}

@end

@implementation ITProductB

+ (instancetype)buildWithPartA:(NSString *)partA
                         partB:(NSString *)partB
                         partC:(NSString *)partC {
    ITProductB *pb =[[ ITProductB alloc] init];
    pb.partA = partA;
    pb.partB = partB;
    pb.partC = partC;
    return  pb;
}


- (NSString *)description {
    NSString *des = [NSString stringWithFormat:@"A:%@_B%@_C%@",self.partA,self.partB,self.partC];
    return des;
}

@end

