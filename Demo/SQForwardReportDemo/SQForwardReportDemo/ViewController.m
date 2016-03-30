//
//  ViewController.m
//  SQForwardReportDemo
//
//  Created by shihaijie on 3/30/16.
//  Copyright © 2016 Saick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    return [NSMethodSignature signatureWithObjCTypes:"@"];
//}
//
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    NSLog(@"1");
//    //    [self doesNotRecognizeSelector:anInvocation.selector];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(xx) withObject:self afterDelay:0.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
