//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/list/AbstractInsertComponent.java
//

#ifndef _ComGoodowRealtimeOperationListAbstractInsertComponent_H_
#define _ComGoodowRealtimeOperationListAbstractInsertComponent_H_

@protocol ComGoodowRealtimeOperationListListTarget;
@protocol ComGoodowRealtimeOperationOperation;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/operation/list/AbstractListComponent.h"

#define ComGoodowRealtimeOperationListAbstractInsertComponent_TYPE 5

@interface ComGoodowRealtimeOperationListAbstractInsertComponent : ComGoodowRealtimeOperationListAbstractListComponent {
}

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)startIndex
                          withId:(id)values;

- (void)applyWithId:(id<ComGoodowRealtimeOperationListListTarget>)target;

- (ComGoodowRealtimeOperationListAbstractInsertComponent *)transformWithComGoodowRealtimeOperationOperation:(id<ComGoodowRealtimeOperationOperation>)other
                                                                                                withBoolean:(jboolean)applied;

- (jint)transformIndexReferenceWithInt:(jint)index
                           withBoolean:(jboolean)rigthSide
                           withBoolean:(jboolean)canBeDeleted;

- (ComGoodowRealtimeOperationListAbstractInsertComponent *)createWithInt:(jint)startIndex
                                                                  withId:(id)values;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeOperationListAbstractInsertComponent)

CF_EXTERN_C_BEGIN

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationListAbstractInsertComponent, TYPE, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeOperationListAbstractInsertComponent)

#endif // _ComGoodowRealtimeOperationListAbstractInsertComponent_H_
