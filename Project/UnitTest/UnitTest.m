//
//  UnitTest.m
//  UnitTest
//
//  Created by dev on 13-5-3.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "UnitTest.h"
#import "GDStore.h"

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
  __block BOOL testComplete = NO;
  id<GDSStore> store = [[GDSStoreImpl alloc] initWithServerUri:@"ws://realtime.goodow.com:1986/channel/websocket" withOptions:nil];
  
  [store load:@"playground/0" onLoaded:^(id<GDSDocument> document) {
    id<GDSModel> model = [document getModel];
    id<GDSCollaborativeMap> root = [model getRoot];
    NSArray *collaborators = [document getCollaborators];
    
    testComplete = YES;
  } opt_initializer:^(id<GDSModel> model) {
    id<GDSCollaborativeMap> root = [model getRoot];
    id<GDSCollaborativeString> string = [model createString:@"Edit Me!"];
    [root set:@"demo_string" value:string];
    
    id<GDSCollaborativeList> list = [model createList:@[@"Cat", @"Dog", @"Sheep", @"Chicken"]];
    [root set:@"demo_list" value:list];
    
    id<GDSCollaborativeMap> map = [model createMap:@{@"Key 1": @"Value 1", @"Key 2": @"Value 2", @"Key 3": @"Value 3", @"Key 4": @"Value 4"}];
    [root set:@"demo_map" value:map];
  } opt_error:nil];
  
  // Begin a run loop terminated when the testComplete it set to true
  while (!testComplete && [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.01]]);
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
