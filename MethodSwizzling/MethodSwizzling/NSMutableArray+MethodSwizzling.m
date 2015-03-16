//
//  NSMutableArray+MethodSwizzling.m
//  MethodSwizzling
//
//  Created by Arlexovincy on 15/3/16.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import "NSMutableArray+MethodSwizzling.h"
#import <objc/runtime.h>

@implementation NSMutableArray (MethodSwizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzleMethod([NSClassFromString(@"__NSArrayM") class], @selector(addObject:), @selector(logAddObject:));
    });
}

static void swizzleMethod(Class class, SEL originSelector, SEL swizzledSelector) {
    Method originMethod = class_getInstanceMethod(class, originSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}

- (void)logAddObject:(id)object{
    
    NSLog(@"%@",object);
    [self logAddObject:object];
}

@end
