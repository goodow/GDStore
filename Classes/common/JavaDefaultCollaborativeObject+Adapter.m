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
//  JavaDefaultCollaborativeObject+Adapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaDefaultCollaborativeObject+Adapter.h"

@implementation ComGoodowRealtimeStoreImplDefaultCollaborativeObject (Adapter)
- (id <GDCRegistration>)onObjectChanged:(void (^)(id <GDSObjectChangedEvent>))handler {
  return (id<GDCRegistration>)[self onObjectChangedWithComGoodowRealtimeCoreHandler:handler];
}

- (NSString *)id {
  return [self id__];
}

- (id <GDCRegistration>)addEventListener:(NSString *)type handler:(void (^)(id))handler opt_capture:(BOOL)opt_capture {
  return (id<GDCRegistration>)[self addEventListenerWithComGoodowRealtimeStoreEventTypeEnum:type
                                                           withComGoodowRealtimeCoreHandler:handler
                                                                                withBoolean:opt_capture];
}

@end