GDStore [![Build Status](https://travis-ci.org/goodow/GDStore.svg?branch=master)](https://travis-ci.org/goodow/GDStore)
=========
iOS and Mac OS X Client for realtime-store

## Adding GDStore to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add GDStore to your project.

1. Add these pods to your Podfile:
```ruby
pod 'J2ObjC', :git => 'https://github.com/goodow/j2objc.git', :tag => 'v0.9.2-lib'
pod 'GDJson', :git => 'https://github.com/goodow/GDJson.git'
pod 'GDChannel', :git => 'https://github.com/goodow/GDChannel.git'
pod 'GDStore', :git => 'https://github.com/goodow/GDStore.git'
```
2. Install the pod(s) by running `pod install`.
3. Include GDStore wherever you need it with `#import "GDStore.h"`.
