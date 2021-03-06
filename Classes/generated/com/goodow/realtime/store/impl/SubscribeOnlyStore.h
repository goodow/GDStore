//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/impl/SubscribeOnlyStore.java
//

#ifndef _ComGoodowRealtimeStoreImplSubscribeOnlyStore_H_
#define _ComGoodowRealtimeStoreImplSubscribeOnlyStore_H_

@class ComGoodowRealtimeOperationImplCollaborativeOperation;
@class ComGoodowRealtimeStoreImplDocumentBridge;
@protocol ComGoodowRealtimeChannelBus;
@protocol ComGoodowRealtimeChannelMessage;
@protocol ComGoodowRealtimeCoreRegistration;
@protocol ComGoodowRealtimeJsonJsonObject;
@protocol ComGoodowRealtimeOperationTransformer;

#include "J2ObjC_header.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/store/impl/DocumentBridge.h"
#include "com/goodow/realtime/store/impl/MemoryStore.h"

@interface ComGoodowRealtimeStoreImplSubscribeOnlyStore : ComGoodowRealtimeStoreImplMemoryStore {
}

- (instancetype)initWithComGoodowRealtimeChannelBus:(id<ComGoodowRealtimeChannelBus>)bus;

- (instancetype)initWithNSString:(NSString *)serverUri
withComGoodowRealtimeJsonJsonObject:(id<ComGoodowRealtimeJsonJsonObject>)options;

- (void)load__WithNSString:(NSString *)id_
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)onLoaded
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)opt_initializer
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)opt_error;

- (void)onLoadedWithNSString:(NSString *)id_
withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)opt_initializer
                  withDouble:(jdouble)version_
withComGoodowRealtimeStoreImplDocumentBridge:(ComGoodowRealtimeStoreImplDocumentBridge *)bridge;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeStoreImplSubscribeOnlyStore)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeStoreImplSubscribeOnlyStore)

@interface ComGoodowRealtimeStoreImplSubscribeOnlyStore_$1 : NSObject < ComGoodowRealtimeCoreHandler > {
}

- (void)handleWithId:(id<ComGoodowRealtimeChannelMessage>)message;

- (instancetype)initWithComGoodowRealtimeStoreImplSubscribeOnlyStore:(ComGoodowRealtimeStoreImplSubscribeOnlyStore *)outer$
                                                        withNSString:(NSString *)capture$0
                                    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)capture$1
                                    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)capture$2
                                    withComGoodowRealtimeCoreHandler:(id<ComGoodowRealtimeCoreHandler>)capture$3;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$1)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$1)

@interface ComGoodowRealtimeStoreImplSubscribeOnlyStore_$2 : NSObject < ComGoodowRealtimeCoreHandler > {
 @public
  id<ComGoodowRealtimeOperationTransformer> transformer_;
}

- (void)handleWithId:(id<ComGoodowRealtimeChannelMessage>)message;

- (instancetype)initWithComGoodowRealtimeStoreImplDocumentBridge:(ComGoodowRealtimeStoreImplDocumentBridge *)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$2)

J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$2, transformer_, id<ComGoodowRealtimeOperationTransformer>)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$2)

@interface ComGoodowRealtimeStoreImplSubscribeOnlyStore_$3 : NSObject < ComGoodowRealtimeStoreImplDocumentBridge_OutputSink > {
}

- (void)close;

- (void)consumeWithComGoodowRealtimeOperationOperation:(ComGoodowRealtimeOperationImplCollaborativeOperation *)op;

- (instancetype)initWithComGoodowRealtimeCoreRegistration:(id<ComGoodowRealtimeCoreRegistration>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$3)

CF_EXTERN_C_BEGIN
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ComGoodowRealtimeStoreImplSubscribeOnlyStore_$3)

#endif // _ComGoodowRealtimeStoreImplSubscribeOnlyStore_H_
