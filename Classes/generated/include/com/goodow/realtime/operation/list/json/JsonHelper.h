//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeOperationListJsonJsonHelper_H_
#define _ComGoodowRealtimeOperationListJsonJsonHelper_H_

@class IOSObjectArray;
@class JavaLangStringBuilder;
@protocol GDRJsonArray;

#import "JreEmulation.h"
#include "com/goodow/realtime/operation/list/ListHelper.h"

#define ComGoodowRealtimeOperationListJsonJsonHelper_TYPE 0

@interface ComGoodowRealtimeOperationListJsonJsonHelper : NSObject < ComGoodowRealtimeOperationListListHelper > {
}

+ (int)TYPE;
+ (ComGoodowRealtimeOperationListJsonJsonHelper *)INSTANCE;
- (int)lengthWithId:(IOSObjectArray *)values;
- (IOSObjectArray *)parseValuesWithGDRJsonArray:(id<GDRJsonArray>)serialized;
- (IOSObjectArray *)replaceWithWithId:(IOSObjectArray *)values
                              withInt:(int)startIndex
                              withInt:(int)length
                               withId:(IOSObjectArray *)replacement;
- (JavaLangStringBuilder *)serializeWithId:(IOSObjectArray *)values;
- (IOSObjectArray *)subsetWithId:(IOSObjectArray *)values
                         withInt:(int)startIndex
                         withInt:(int)length;
- (IOSObjectArray *)subsetWithId:(IOSObjectArray *)values
                         withInt:(int)startIndex0
                         withInt:(int)length0
                         withInt:(int)startIndex1
                         withInt:(int)length1;
- (IOSObjectArray *)subsetWithId:(IOSObjectArray *)values0
                         withInt:(int)startIndex0
                         withInt:(int)length0
                          withId:(IOSObjectArray *)values1
                         withInt:(int)startIndex1
                         withInt:(int)length1;
- (IOSObjectArray *)createWithInt:(int)length;
- (id)init;
@end

#endif // _ComGoodowRealtimeOperationListJsonJsonHelper_H_