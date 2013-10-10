//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeOperationUndoUndoStack_H_
#define _ComGoodowRealtimeOperationUndoUndoStack_H_

@class ComGoodowRealtimeOperationUtilPair;
@protocol ComGoodowRealtimeOperationUndoUndoManagerImpl_Algorithms;
@protocol JavaUtilList;

#import "JreEmulation.h"

@interface ComGoodowRealtimeOperationUndoUndoStack : NSObject {
 @public
  id<ComGoodowRealtimeOperationUndoUndoManagerImpl_Algorithms> algorithms_;
  id<JavaUtilList> ops_;
  BOOL checkpointer_;
}

+ (int)MAX_CAPACITY;
+ (int *)MAX_CAPACITYRef;
- (id)initWithComGoodowRealtimeOperationUndoUndoManagerImpl_Algorithms:(id<ComGoodowRealtimeOperationUndoUndoManagerImpl_Algorithms>)algorithms;
- (void)checkpoint;
- (void)clear;
- (BOOL)isEmpty;
- (void)nonUndoableOperationWithId:(id)op;
- (ComGoodowRealtimeOperationUtilPair *)pop;
- (void)pushWithId:(id)op;
- (void)keepCapacityWithJavaUtilList:(id<JavaUtilList>)list;
- (int)popOneWithJavaUtilList:(id<JavaUtilList>)results;
- (void)copyAllFieldsTo:(ComGoodowRealtimeOperationUndoUndoStack *)other;
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeOperationUndoUndoStack, algorithms_, id<ComGoodowRealtimeOperationUndoUndoManagerImpl_Algorithms>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeOperationUndoUndoStack, ops_, id<JavaUtilList>)

#endif // _ComGoodowRealtimeOperationUndoUndoStack_H_