//
//  UnitTest.m
//  UnitTest
//
//  Created by dev on 13-5-3.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "UnitTest.h"
#import "Realtime.h"

@implementation UnitTest

typedef void (^a)(id event);
typedef void (^b)(NSString * event);


- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testEvent{
  [GDRRealtime getToken];
}

- (void)testExample
{
  a a1 = ^(id e){
     NSLog(@"abc%@", e);
  };
  b b1 = ^(NSString * e){
     NSLog(@"rrrr%@", e);
  };
  id b2 = ^(NSString * e){
    NSLog(@"eeee%@", e);
  };
  a1(@42);
  b1(@"yyoo");
  ((b)b2)(@"ppp");
  ((a)b2)(@"nnn");
     
}

@end
