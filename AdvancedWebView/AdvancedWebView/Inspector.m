//
//  Inspector.m
//  AdvancedWebView
//
//  Created by Colin Teahan on 5/17/24.
//

#import "Inspector.h"
#import <objc/runtime.h>

@implementation Inspector

+ (void)selector:(id)obj {
    int i=0;
    unsigned int mc = 0;
    Method * mlist = class_copyMethodList([obj class], &mc);
    NSLog(@"-   -   -   -   -   -   -   -   -   -   -   -   -   -   -");
    NSLog(@"%@ contains %d methods", obj, mc);
    for (i=0; i<mc; i++) {
        NSLog(@"Method no #%d: %s", i, sel_getName(method_getName(mlist[i])));
    }
}

@end
