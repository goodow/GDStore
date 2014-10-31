//
//  ViewController.m
//  Playground-iOS
//
//  Created by Honghao Zhang on 2014-10-31.
//  Copyright (c) 2014 HonghaoZ. All rights reserved.
//

#import "ViewController.h"
#import "GDStore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id<GDSStore> store = [[GDSStoreImpl alloc] initWithServerUri:@"ws://realtime.goodow.com:1986/channel/websocket" withOptions:nil];
    
    [store load:@"playground/0" onLoaded:^(id<GDSDocument> document) {
        id<GDSModel> model = [document getModel];
        id<GDSCollaborativeMap> root = [model getRoot];
        NSArray *collaborators = [document getCollaborators];
        
    } opt_initializer:^(id<GDSModel> model) {
        id<GDSCollaborativeMap> root = [model getRoot];
        id<GDSCollaborativeString> string = [model createString:@"Edit Me!"];
        [root set:@"demo_string" value:string];
        
        id<GDSCollaborativeList> list = [model createList:@[@"Cat", @"Dog", @"Sheep", @"Chicken"]];
        [root set:@"demo_list" value:list];
        
        id<GDSCollaborativeMap> map = [model createMap:@{@"Key 1": @"Value 1", @"Key 2": @"Value 2", @"Key 3": @"Value 3", @"Key 4": @"Value 4"}];
        [root set:@"demo_map" value:map];
    } opt_error:nil];
}

@end
