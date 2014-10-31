//
//  ViewController.m
//  Playground-iOS
//
//  Created by Honghao Zhang on 2014-10-31.
//  Copyright (c) 2014 HonghaoZ. All rights reserved.
//

#import "ViewController.h"
#import "GDStore.h"

static NSString * STR_KEY = @"demo_string";

@interface ViewController () <UITextViewDelegate>

@property (nonatomic, strong) id<GDSStore> store;
@property (nonatomic, strong) id<GDSDocument> document;
@property (nonatomic, strong) id<GDSModel> model;
@property (nonatomic, strong) id<GDSCollaborativeMap> root;
@property (nonatomic, strong) id<GDSCollaborativeString> collaboratingString;
@property (nonatomic, strong) NSArray *collaborators;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.textView.text = @"Demo";
    [self loadDocuments];
}

- (void)loadDocuments {
    self.store = [[GDSStoreImpl alloc] initWithServerUri:@"ws://realtime.goodow.com:1986/channel/websocket" withOptions:nil];
    
    [self.store load:@"playground/0" onLoaded:^(id<GDSDocument> document) {
        self.document = document;
        self.model = [document getModel];
        self.root = [self.model getRoot];
        self.collaborators = [document getCollaborators];
        [self connectString];
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

- (void)connectString {
    self.collaboratingString = [self.root get:STR_KEY];
    self.textView.text = [self.collaboratingString getText];
    [self.collaboratingString onTextInserted:^(id<GDSTextInsertedEvent> insertEvent) {
        self.textView.text = [self.collaboratingString getText];
    }];
    
    [self.collaboratingString onTextDeleted:^(id<GDSTextDeletedEvent> deleteEvent) {
        self.textView.text = [self.collaboratingString getText];
    }];
}

#pragma mark - UITextView Delegate

- (void)textViewDidChange:(UITextView *)textView {
    [self.collaboratingString setText:textView.text];
}

@end
