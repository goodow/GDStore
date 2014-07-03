//
//  test.m
//  test
//
//  Created by dev on 13-4-30.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "test.h"
#import "GDSBaseModelEvent.h"
#import "GDSCollaborativeList.h"

@implementation test

-(void)testA{
  #if defined(TARGET_OS_IPHONE) || defined(TARGET_OS_IPHONE_SIMULATOR)
    
  #else
    
  #endif
  NSLog(@"了");
  
  id<GDSCollaborativeList> evt;
  evt.length = 3;
}

@end
