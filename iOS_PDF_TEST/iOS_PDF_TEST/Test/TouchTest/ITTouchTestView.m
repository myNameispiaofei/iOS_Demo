//
//  ITTouchTestView.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/8/5.
//  Copyright © 2019 母斌. All rights reserved.
//

#import "ITTouchTestView.h"

@implementation ITTouchTestView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"#mub_touchTest# touch %@: Began",self.name);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"#mub_touchTest# touch %@: Moved",self.name);
}


- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"#mub_touchTest# touch %@: Cancelled",self.name);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     NSLog(@"#mub_touchTest# touch %@: Ended",self.name);
}

@end
