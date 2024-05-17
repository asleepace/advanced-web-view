//
//  WebView.m
//  AdvancedWebView
//
//  Created by Colin Teahan on 5/15/24.
//

#import "WebView.h"
#import <objc/runtime.h>

@interface WebView()

@end

@implementation WebView

// WKScrollView
// WKContentView
// WKVisibilityPropagationView

- (void)addBackgroundNotification {
    NSLog(@"[wv] addBackgroundNotification!");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
}

- (void)didEnterBackground {
    NSLog(@"[wv] did enter background!");
}


- (void)listObservers {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
}

void SwizzleClassMethod(Class c, SEL orig, SEL new) {

    Method origMethod = class_getClassMethod(c, orig);
    Method newMethod = class_getClassMethod(c, new);

    c = object_getClass((id)c);

    if(class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    else
        method_exchangeImplementations(origMethod, newMethod);
}

-(void)_applicationDidEnterBackground:(NSNotification*)notification {
    NSLog(@"#");
    NSLog(@"# swizzled works!");
    NSLog(@"#");
}

- (void)proxy {
    NSLog(@"+ - + - + - + POXY CALLED + - + - + - + ");
}

- (void)listAllSubviews:(UIView *)view {
    for (UIView *subview in view.subviews) {
        NSLog(@"%@", subview.description);
        [self listAllSubviews:subview];
        Class class = [subview class];
    
        
        SEL enterBackground = NSSelectorFromString(@"_applicationDidEnterBackground:");

        if ([view respondsToSelector:enterBackground]) {
            NSLog(@"@");
            NSLog(@"@");
            NSLog(@"@ view responds to selector!");
            NSLog(@"@");
            NSLog(@"@");
            
            Method methodOld = class_getInstanceMethod(class, enterBackground);
            Method methodNew = class_getInstanceMethod(class, NSSelectorFromString(@"_applicationWillEnterForeground:"));
            
            IMP implementation = method_getImplementation(methodNew);
            method_setImplementation(methodOld, implementation);
            
            NSLog(@"methodOld %@", methodOld);
            NSLog(@"methodNew %@", methodNew);
            NSLog(@"implementation %@", implementation);
            
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            
            NSLog(@"observation info: %@", [view observationInfo]);
            
            [[NSNotificationCenter defaultCenter] removeObserver:view name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
            [[NSNotificationCenter defaultCenter] removeObserver:view name:UIApplicationDidEnterBackgroundNotification object:view];
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:view];
            [[NSNotificationCenter defaultCenter] removeObserver:view];
            
            SwizzleClassMethod(class, enterBackground, @selector(_applicationDidEnterBackground:));
            
            id method = (__bridge id)(class_getInstanceMethod(class, enterBackground));
            NSLog(@"method: %@", method);
        }

        NSLog(@"class: %@", class);
        if ([NSStringFromClass(class) isEqualToString:@"WKContentView"]) {
            // [self listSelectors:class];
            
            NSLog(@"observation info: %@", [view observationInfo]);
            NSLog(@"observation info: %@", [view debugDescription]);
            
            unsigned int outCount, i;

            objc_property_t *properties = class_copyPropertyList(class, &outCount);
            for(i = 0; i < outCount; i++) {
                objc_property_t property = properties[i];
                const char *propName = property_getName(property);
                NSLog(@"%s\n", propName);
//                if(propName) {
//                        const char *propType = getPropertyType(property);
//                        NSString *propertyName = [NSString stringWithUTF8String:propName];
//                        NSString *propertyType = [NSString stringWithUTF8String:propType];
//                }
            }
            free(properties);

            
            NSLog(@"===== FOUND WKCONTENT VIEW ======");
            [[NSNotificationCenter defaultCenter] removeObserver:subview];
            
            [[NSNotificationCenter defaultCenter] removeObserver:subview name:UIApplicationDidEnterBackgroundNotification object:[UIApplication sharedApplication]];
            NSLog(@"removed observers....");
            NSLog(@"=================================");
        }
        
//        Class class = [subview class];
//
//        if ([subview.description containsString:@"WK"]) {
//            NSLog(@"found wk class: %@", class);
//            [self listSelectors:class];
//        }
    }
}

- (void)listSelectors {
    // https://github.com/WebKit/WebKit/blob/main/Source/WebKit/UIProcess/ios/WKVisibilityPropagationView.mm
    // https://github.com/WebKit/WebKit/blob/main/Source/WebKit/UIProcess/ios/WKVisibilityPropagationView.h
    // [self listSelectors:[self class]];
    // [self listAllSubviews:self];
//    Class wkProp = NSClassFromString(@"WKVisibilityPropagationView");
//    [self listSelectors:wkProp];
    
    // NSLog(@"%@", [NSNotificationCenter defaultCenter]);
    // [self listAllSubviews:self];
}

- (void)listSelectors:(Class)class {
    int i=0;
    unsigned int mc = 0;
    Method * mlist = class_copyMethodList(class, &mc);
    NSLog(@"%d methods", mc);
    for (i=0; i<mc; i++) {
        NSLog(@"Method no #%d: %s", i, sel_getName(method_getName(mlist[i])));
    }
}

@end
