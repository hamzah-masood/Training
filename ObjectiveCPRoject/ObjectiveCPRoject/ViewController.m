//
//  ViewController.m
//  ObjectiveCPRoject
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theTitle;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  // Do any additional setup after loading the view.
  NSString* (^theBlock)(int, int) = ^(int int1, int int2) {
    return @"Taking in 2 numbers";
  };
  //NSLog(@"%d", theBlock(2,3));
  
  NSLog([self theBlockFunction:theBlock]);
  
}

- (NSString*) sayHelloWorld {
  return @"Hello World";
}

- (void) printHelloWorld {
  NSLog(@"Hello World");
}

- (NSString*) theBlockFunction: (NSString * (^) (int int1, int int2))block {
  return block(4,5);
}

@end
