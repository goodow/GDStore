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
//  JavaDefaultCollaborativeString+Adapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaDefaultCollaborativeString+Adapter.h"
#import "JavaDefaultCollaborativeObject+Adapter.h"

@implementation ComGoodowRealtimeStoreImplDefaultCollaborativeString (Adapter)
- (id<GDCRegistration>)onTextDeleted:(void (^)(id <GDSTextDeletedEvent>))handler {
  return (id<GDCRegistration>)[self onTextDeletedWithComGoodowRealtimeCoreHandler:handler];
}

- (id<GDCRegistration>)onTextInserted:(void (^)(id <GDSTextInsertedEvent>))handler {
  return (id<GDCRegistration>)[self onTextInsertedWithComGoodowRealtimeCoreHandler:handler];
}

- (void)append:(NSString *)text {
  [self appendWithNSString:text];
}

- (void)insertString:(int)index text:(NSString *)text {
  [self insertStringWithInt:<#(int)index#> withNSString:<#(NSString *)text#>];
}

- (id <GDSIndexReference>)registerReference:(int)index canBeDeleted:(BOOL)canBeDeleted {
  return [self registerReferenceWithInt:index withBoolean:canBeDeleted];
}

- (void)removeRange:(int)startIndex endIndex:(int)endIndex {
  [self removeRangeWithInt:startIndex withInt:endIndex];
}

- (void)setText:(NSString *)text {
  [self setTextWithNSString:text];
}

@end