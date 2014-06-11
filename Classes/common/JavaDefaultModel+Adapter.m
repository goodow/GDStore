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
//  JavaDefaultModel+Adapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaDefaultModel+Adapter.h"

@implementation ComGoodowRealtimeStoreImplDefaultModel (Adapter)
- (id<GDCRegistration>)onUndoRedoStateChanged:(void (^)(id <GDSUndoRedoStateChangedEvent>))handler {
  return (id<GDCRegistration>)[self onUndoRedoStateChangedWithComGoodowRealtimeCoreHandler:handler];
}

- (id<GDSCollaborativeList>)createList:(NSArray *)opt_initialValue {
  return [self createListWithComGoodowRealtimeJsonJsonArray:opt_initialValue];
}

- (id<GDSCollaborativeMap>)createMap:(NSDictionary *)opt_initialValue {
  return [self createMapWithComGoodowRealtimeJsonJsonObject:opt_initialValue];
}

- (id<GDSCollaborativeString>)createString:(NSString *)opt_initialValue {
  return [self createStringWithNSString:opt_initialValue];
}

@end