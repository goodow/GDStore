//
//  test.m
//  test
//
//  Created by dev on 13-4-30.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "test.h"

@implementation test

-(void)testA{
  #if defined(TARGET_OS_IPHONE) || defined(TARGET_OS_IPHONE_SIMULATOR)
    
  #else
    
  #endif
  NSLog(@"了");
}

@end
