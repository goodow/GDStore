//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeOperationListJsonJsonInsertOperation_H_
#define _ComGoodowRealtimeOperationListJsonJsonInsertOperation_H_

@class ComGoodowRealtimeOperationListJsonJsonDeleteOperation;
@class ComGoodowRealtimeOperationListJsonJsonHelper;
@class IOSObjectArray;
@protocol GDRJsonArray;

#import "JreEmulation.h"
#include "com/goodow/realtime/operation/list/AbstractInsertOperation.h"

@interface ComGoodowRealtimeOperationListJsonJsonInsertOperation : ComGoodowRealtimeOperationListAbstractInsertOperation {
}

+ (ComGoodowRealtimeOperationListJsonJsonInsertOperation *)parseWithGDRJsonArray:(id<GDRJsonArray>)serialized;
- (id)initWithNSString:(NSString *)id_
               withInt:(int)startIndex
 withGDRJsonValueArray:(IOSObjectArray *)values;
- (ComGoodowRealtimeOperationListJsonJsonDeleteOperation *)invert;
- (ComGoodowRealtimeOperationListJsonJsonInsertOperation *)createWithInt:(int)startIndex
                                                                  withId:(IOSObjectArray *)values;
- (ComGoodowRealtimeOperationListJsonJsonHelper *)getHelper;
@end

#endif // _ComGoodowRealtimeOperationListJsonJsonInsertOperation_H_