//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/impl/DefaultTextDeletedEvent.java
//
//  Created by retechretech.
//

#ifndef _ComGoodowRealtimeStoreImplDefaultTextDeletedEvent_H_
#define _ComGoodowRealtimeStoreImplDefaultTextDeletedEvent_H_

@protocol ComGoodowRealtimeJsonJsonObject;

#import "JreEmulation.h"
#include "com/goodow/realtime/store/TextDeletedEvent.h"
#include "com/goodow/realtime/store/impl/DefaultBaseModelEvent.h"

@interface ComGoodowRealtimeStoreImplDefaultTextDeletedEvent : ComGoodowRealtimeStoreImplDefaultBaseModelEvent < ComGoodowRealtimeStoreTextDeletedEvent > {
 @public
  int index__;
  NSString *text__;
}

- (id)initWithComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)serialized;

- (int)index;

- (NSString *)text;

- (void)copyAllFieldsTo:(ComGoodowRealtimeStoreImplDefaultTextDeletedEvent *)other;

@end

__attribute__((always_inline)) inline void ComGoodowRealtimeStoreImplDefaultTextDeletedEvent_init() {}

J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreImplDefaultTextDeletedEvent, text__, NSString *)

#endif // _ComGoodowRealtimeStoreImplDefaultTextDeletedEvent_H_