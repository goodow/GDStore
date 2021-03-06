//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/create/CreateComponent.java
//

#ifndef _ComGoodowRealtimeOperationCreateCreateComponent_H_
#define _ComGoodowRealtimeOperationCreateCreateComponent_H_

@class JavaLangVoid;
@protocol ComGoodowRealtimeJsonJsonArray;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/operation/impl/AbstractComponent.h"

#define ComGoodowRealtimeOperationCreateCreateComponent_INDEX_REFERENCE 4
#define ComGoodowRealtimeOperationCreateCreateComponent_LIST 1
#define ComGoodowRealtimeOperationCreateCreateComponent_MAP 0
#define ComGoodowRealtimeOperationCreateCreateComponent_STRING 2
#define ComGoodowRealtimeOperationCreateCreateComponent_TYPE 7

@interface ComGoodowRealtimeOperationCreateCreateComponent : ComGoodowRealtimeOperationImplAbstractComponent {
 @public
  jint subType_;
}

+ (ComGoodowRealtimeOperationCreateCreateComponent *)parseWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)serialized;

- (instancetype)initWithNSString:(NSString *)id_
                         withInt:(jint)type;

- (void)applyWithId:(id)target;

- (ComGoodowRealtimeOperationImplAbstractComponent *)invert;

- (void)toJsonWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)json;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeOperationCreateCreateComponent)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ComGoodowRealtimeOperationCreateCreateComponent *ComGoodowRealtimeOperationCreateCreateComponent_parseWithComGoodowRealtimeJsonJsonArray_(id<ComGoodowRealtimeJsonJsonArray> serialized);

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationCreateCreateComponent, TYPE, jint)

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationCreateCreateComponent, MAP, jint)

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationCreateCreateComponent, LIST, jint)

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationCreateCreateComponent, STRING, jint)

J2OBJC_STATIC_FIELD_GETTER(ComGoodowRealtimeOperationCreateCreateComponent, INDEX_REFERENCE, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeOperationCreateCreateComponent)

#endif // _ComGoodowRealtimeOperationCreateCreateComponent_H_
