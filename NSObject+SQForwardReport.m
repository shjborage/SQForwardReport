//
//  NSObject+SQForwardReport.m
//  test_NSObjectForward
//
//  Created by shihaijie on 3/17/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "NSObject+SQForwardReport.h"
#import <objc/objc-runtime.h>

@interface NSObject ()

@end

@implementation NSObject (SQForwardReport)

//+ (void)load {
//    Method sq_methodsig = class_getInstanceMethod([self class], @selector(sq_methodSignatureForSelector:));
//    Method methodsig = class_getInstanceMethod([self class], @selector(methodSignatureForSelector:));
//    if (methodsig) {
//        method_exchangeImplementations(sq_methodsig, methodsig);
//    } else {
//        // 异常
//    }
//    
//    Method sq_methodForward = class_getInstanceMethod([self class], @selector(sq_forwardInvocation:));
//    Method methodForward = class_getInstanceMethod([self class], @selector(forwardInvocation:));
//    if (methodsig) {
//        method_exchangeImplementations(sq_methodForward, methodForward);
//    } else {
//        // 异常
//    }
//}

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

/*!
 *  @author shi haijie, 16-03-17 23:03:21
 *
 *  @brief 消息转发原方法，如果有子类实现的话，这两个方法不会被调用。
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [NSMethodSignature signatureWithObjCTypes:"@@@"];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // Not forward or send log to server
    // NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__
    NSLog(@"============================forwardInvocation here:%@-%@ ============================", NSStringFromClass(self.class), NSStringFromSelector(anInvocation.selector));
}

#pragma mark - Overwrite and Exchange

//- (NSMethodSignature *)sq_methodSignatureForSelector:(SEL)aSelector {
//    if ([self respondsToSelector:@selector(sq_methodSignatureForSelector:)]) {
//        return [self sq_methodSignatureForSelector:aSelector];
//    } else {
//        return [NSMethodSignature signatureWithObjCTypes:"@"];
//    }
//}
//
//- (void)sq_forwardInvocation:(NSInvocation *)anInvocation {
//    if ([self respondsToSelector:@selector(sq_forwardInvocation:)]) {
//        [self sq_forwardInvocation:anInvocation];
//    } else {
//        // Not forward or send log to server
//        NSLog(@"%@:%@ [Line %d]-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, anInvocation.description);
//    }
//}

#pragma clang diagnostic pop

@end
