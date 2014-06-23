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
//  JavaCollaborativeListImpl+Adapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaCollaborativeListImpl+Adapter.h"
#import "JavaCollaborativeObjectImpl+Adapter.h"
#import "NSArray+GDJsonArray.h"

@implementation ComGoodowRealtimeStoreImplCollaborativeListImpl (Adapter)
- (id<GDCRegistration>)onValuesAdded:(void (^)(id <GDSValuesAddedEvent>))handler {
  return (id<GDCRegistration>)[self onValuesAddedWithComGoodowRealtimeCoreHandler:handler];
}

- (id<GDCRegistration>)onValuesRemoved:(void (^)(id <GDSValuesRemovedEvent>))handler {
  return (id<GDCRegistration>)[self onValuesRemovedWithComGoodowRealtimeCoreHandler:handler];
}

- (id <GDCRegistration>)onValuesSet:(void (^)(id <GDSValuesSetEvent>))handler {
  return (id<GDCRegistration>)[self onValuesSetWithComGoodowRealtimeCoreHandler:handler];
}

- (id)get:(int)index {
  return [self getWithInt:index];
}

- (int)indexOf:(id)value opt_comparator:(NSComparator)opt_comparator {
  return [self indexOfWithId:value withJavaUtilComparator:opt_comparator];
}

- (void)insert:(int)index value:(id)value {
  [self insertWithInt:index withId:value];
}

- (void)insertAll:(int)index values:(NSArray *)values {
  [self insertAllWithInt:index withComGoodowRealtimeJsonJsonArray:values];
}

- (int)lastIndexOf:(id)value opt_comparator:(NSComparator)opt_comparator {
  return [self lastIndexOfWithId:value withJavaUtilComparator:opt_comparator];
}

- (void)pushAll:(NSArray *)values {
  [self pushAllWithComGoodowRealtimeJsonJsonArray:values];
}

- (id <GDSIndexReference>)registerReference:(int)index canBeDeleted:(BOOL)canBeDeleted {
  return (id <GDSIndexReference>)[self registerReferenceWithInt:index withBoolean:canBeDeleted];
}

- (void)remove:(int)index {
  [self removeWithInt:index];
}

- (void)removeRange:(int)startIndex endIndex:(int)endIndex {
  [self removeRangeWithInt:startIndex withInt:endIndex];
}

- (BOOL)removeValue:(id)value {
  return [self removeValueWithId:value];
}

- (void)replaceRange:(int)index values:(NSArray *)values {
  [self replaceRangeWithInt:index withComGoodowRealtimeJsonJsonArray:values];
}

- (void)set:(int)index value:(id)value {
  [self setWithInt:index withId:value];
}

- (void)setLength:(int)length {
  [self setLengthWithInt:length];
}

- (void)push:(id)value {
  [self pushWithId:value];
}

@end