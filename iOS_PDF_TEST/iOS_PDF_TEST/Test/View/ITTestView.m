//
//  ITTestView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/11/11.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITTestView.h"

@implementation ITTestView


- (void)test1 {
     NSLog(@" >> ITTestView test1 call %@", self);
}
- (void)test2 {
     NSLog(@" >> ITTestView test2 call %@", self);
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return  self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"mub --%p--target:%ld",self,self.tag);
}

//- (void)displayLayer:(CALayer *)layer {
//    UIImage *image = [UIImage imageNamed:@"hello_image"];
//    layer.contents = (__bridge id)image.CGImage;
//    NSLog(@"mub --lalallsl");
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}


@end
