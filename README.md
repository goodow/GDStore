GDStore [![Build Status](https://travis-ci.org/goodow/GDStore.svg?branch=master)](https://travis-ci.org/goodow/GDStore)
=========
iOS and Mac OS X Client for realtime-store

Visit [Google groups](https://groups.google.com/forum/#!forum/goodow-realtime) for discussions and announcements.

## Adding GDStore to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add GDStore to your project.

1. Add these pods to your Podfile:
```ruby
pod 'GDJson', :git => 'https://github.com/goodow/GDJson.git'
pod 'GDChannel', :git => 'https://github.com/goodow/GDChannel.git'
pod 'GDStore', :git => 'https://github.com/goodow/GDStore.git'
```
2. Install the pod(s) by running `pod install`.
3. Include GDStore wherever you need it with `#import "GDStore.h"`.

## Usage

```objc
id<GDSStore> store = [[GDSStoreImpl alloc]
    initWithServerUri:@"ws://localhost:1986/channel/websocket" withOptions:nil];

void (^onLoaded)(id<GDSDocument>) = ^(id<GDSDocument> document) {
  id<GDSModel> model = [document getModel];
  id<GDSCollaborativeMap> root = [model getRoot];
  id<GDSCollaborativeString> name = [root get:@"name"];
  NSLog(@"Name: %@", [name getText]);
};

void (^opt_initializer)(id<GDSModel>) = ^(id<GDSModel> model) {
  id<GDSCollaborativeMap> root = [model getRoot];
  id<GDSCollaborativeString> name = [model createString:@"Larry Tin"];
  [root set:@"name" value:name];
};

[store load:@"docType/docId" onLoaded:onLoaded opt_initializer:opt_initializer opt_error:nil];
```
