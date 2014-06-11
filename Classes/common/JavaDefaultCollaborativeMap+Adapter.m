// Copyright 2014 Goodow.com. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  JavaDefaultCollaborativeMap+Adapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaDefaultCollaborativeMap+Adapter.h"
#import "JavaDefaultCollaborativeObject+Adapter.h"

@implementation ComGoodowRealtimeStoreImplDefaultCollaborativeMap (Adapter)

- (id)set:(NSString *)key value:(id)value {
  return [self setWithNSString:key withId:value];
}

- (id)remove:(NSString *)key {
  return [self removeWithNSString:key];
}

- (BOOL)has:(NSString *)key {
  return [self hasWithNSString:key];
}

- (id)get:(NSString *)key {
  return [self getWithNSString:key];
}

- (id <GDCRegistration>)onValueChanged:(void (^)(id <GDSValueChangedEvent>))handler {
  return (id<GDCRegistration>)[self onValueChangedWithComGoodowRealtimeCoreHandler:handler];
}

@end