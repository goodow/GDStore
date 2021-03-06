//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/channel/OperationSucker.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/goodow/realtime/channel/Bus.h"
#include "com/goodow/realtime/json/Json.h"
#include "com/goodow/realtime/json/JsonObject.h"
#include "com/goodow/realtime/operation/Transformer.h"
#include "com/goodow/realtime/operation/impl/CollaborativeOperation.h"
#include "com/goodow/realtime/operation/impl/CollaborativeTransformer.h"
#include "com/goodow/realtime/store/Document.h"
#include "com/goodow/realtime/store/ErrorType.h"
#include "com/goodow/realtime/store/EventType.h"
#include "com/goodow/realtime/store/channel/Constants.h"
#include "com/goodow/realtime/store/channel/OperationChannel.h"
#include "com/goodow/realtime/store/channel/OperationSucker.h"
#include "com/goodow/realtime/store/impl/DocumentBridge.h"
#include "com/goodow/realtime/store/impl/DocumentSaveStateChangedEventImpl.h"
#include "com/goodow/realtime/store/impl/ErrorImpl.h"
#include "java/lang/Throwable.h"
#include "java/util/logging/Level.h"
#include "java/util/logging/Logger.h"

@interface ComGoodowRealtimeStoreChannelOperationSucker () {
 @public
  NSString *id__;
  ComGoodowRealtimeStoreChannelOperationChannel *channel_;
  id<ComGoodowRealtimeOperationTransformer> transformer_;
  id<ComGoodowRealtimeChannelBus> bus_;
  ComGoodowRealtimeStoreImplDocumentBridge *bridge_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker, id__, NSString *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker, channel_, ComGoodowRealtimeStoreChannelOperationChannel *)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker, transformer_, id<ComGoodowRealtimeOperationTransformer>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker, bus_, id<ComGoodowRealtimeChannelBus>)
J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker, bridge_, ComGoodowRealtimeStoreImplDocumentBridge *)

@interface ComGoodowRealtimeStoreChannelOperationSucker_$1 () {
 @public
  ComGoodowRealtimeStoreChannelOperationSucker *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ComGoodowRealtimeStoreChannelOperationSucker_$1, this$0_, ComGoodowRealtimeStoreChannelOperationSucker *)

BOOL ComGoodowRealtimeStoreChannelOperationSucker_initialized = NO;

@implementation ComGoodowRealtimeStoreChannelOperationSucker

JavaUtilLoggingLogger * ComGoodowRealtimeStoreChannelOperationSucker_logger_;

- (instancetype)initWithComGoodowRealtimeChannelBus:(id<ComGoodowRealtimeChannelBus>)bus
                                       withNSString:(NSString *)id_ {
  if (self = [super init]) {
    self->bus_ = bus;
    self->id__ = id_;
    transformer_ = [[ComGoodowRealtimeOperationImplCollaborativeTransformer alloc] init];
    channel_ = [[ComGoodowRealtimeStoreChannelOperationChannel alloc] initWithNSString:id_ withComGoodowRealtimeOperationTransformer:transformer_ withComGoodowRealtimeChannelBus:bus withComGoodowRealtimeStoreChannelOperationChannel_Listener:self];
  }
  return self;
}

- (void)load__WithComGoodowRealtimeStoreImplDocumentBridge:(ComGoodowRealtimeStoreImplDocumentBridge *)bridge
                                                withDouble:(jdouble)version_ {
  self->bridge_ = bridge;
  [((ComGoodowRealtimeStoreImplDocumentBridge *) nil_chk(bridge)) setOutputSinkWithComGoodowRealtimeStoreImplDocumentBridge_OutputSink:[[ComGoodowRealtimeStoreChannelOperationSucker_$1 alloc] initWithComGoodowRealtimeStoreChannelOperationSucker:self]];
  [((ComGoodowRealtimeStoreChannelOperationChannel *) nil_chk(channel_)) connectWithDouble:version_];
}

- (void)onAckWithId:(ComGoodowRealtimeOperationImplCollaborativeOperation *)serverHistoryOp
        withBoolean:(jboolean)clean {
}

- (void)onErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk(ComGoodowRealtimeStoreChannelOperationSucker_logger_)) logWithJavaUtilLoggingLevel:JavaUtilLoggingLevel_get_WARNING_() withNSString:@"Channel error occurs" withJavaLangThrowable:e];
  (void) [((id<ComGoodowRealtimeChannelBus>) nil_chk(bus_)) publishLocalWithNSString:JreStrcat("$C$C$", ComGoodowRealtimeStoreChannelConstants_Topic_get_STORE_(), '/', id__, '/', ComGoodowRealtimeStoreChannelConstants_Topic_get_DOCUMENT_ERROR_()) withId:[[ComGoodowRealtimeStoreImplErrorImpl alloc] initWithComGoodowRealtimeStoreErrorTypeEnum:ComGoodowRealtimeStoreErrorTypeEnum_get_SERVER_ERROR() withNSString:@"Channel error occurs" withBoolean:YES]];
}

- (void)onRemoteOpWithId:(ComGoodowRealtimeOperationImplCollaborativeOperation *)serverHistoryOp {
  while ([((ComGoodowRealtimeStoreChannelOperationChannel *) nil_chk(channel_)) peek] != nil) {
    [((ComGoodowRealtimeStoreImplDocumentBridge *) nil_chk(bridge_)) consumeWithComGoodowRealtimeOperationOperation:[channel_ receive]];
  }
}

- (void)onSaveStateChangedWithBoolean:(jboolean)isSaving
                          withBoolean:(jboolean)isPending {
  (void) [((id<ComGoodowRealtimeChannelBus>) nil_chk(bus_)) publishLocalWithNSString:JreStrcat("$C$C@", ComGoodowRealtimeStoreChannelConstants_Topic_get_STORE_(), '/', id__, '/', ComGoodowRealtimeStoreEventTypeEnum_get_DOCUMENT_SAVE_STATE_CHANGED()) withId:[[ComGoodowRealtimeStoreImplDocumentSaveStateChangedEventImpl alloc] initWithComGoodowRealtimeStoreDocument:[((ComGoodowRealtimeStoreImplDocumentBridge *) nil_chk(bridge_)) getDocument] withComGoodowRealtimeJsonJsonObject:[((id<ComGoodowRealtimeJsonJsonObject>) nil_chk([((id<ComGoodowRealtimeJsonJsonObject>) nil_chk(ComGoodowRealtimeJsonJson_createObject())) setWithNSString:@"isSaving" withBoolean:isSaving])) setWithNSString:@"isPending" withBoolean:isPending]]];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeStoreChannelOperationSucker *)other {
  [super copyAllFieldsTo:other];
  other->id__ = id__;
  other->channel_ = channel_;
  other->transformer_ = transformer_;
  other->bus_ = bus_;
  other->bridge_ = bridge_;
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeStoreChannelOperationSucker class]) {
    ComGoodowRealtimeStoreChannelOperationSucker_logger_ = JavaUtilLoggingLogger_getLoggerWithNSString_([ComGoodowRealtimeStoreChannelOperationSucker_class_() getName]);
    J2OBJC_SET_INITIALIZED(ComGoodowRealtimeStoreChannelOperationSucker)
  }
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithComGoodowRealtimeChannelBus:withNSString:", "OperationSucker", NULL, 0x1, NULL },
    { "load__WithComGoodowRealtimeStoreImplDocumentBridge:withDouble:", "load", "V", 0x1, NULL },
    { "onAckWithComGoodowRealtimeOperationImplCollaborativeOperation:withBoolean:", "onAck", "V", 0x1, NULL },
    { "onErrorWithJavaLangThrowable:", "onError", "V", 0x1, NULL },
    { "onRemoteOpWithComGoodowRealtimeOperationImplCollaborativeOperation:", "onRemoteOp", "V", 0x1, NULL },
    { "onSaveStateChangedWithBoolean:withBoolean:", "onSaveStateChanged", "V", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "logger_", NULL, 0x1a, "Ljava.util.logging.Logger;", &ComGoodowRealtimeStoreChannelOperationSucker_logger_,  },
    { "id__", "id", 0x12, "Ljava.lang.String;", NULL,  },
    { "channel_", NULL, 0x12, "Lcom.goodow.realtime.store.channel.OperationChannel;", NULL,  },
    { "transformer_", NULL, 0x12, "Lcom.goodow.realtime.operation.Transformer;", NULL,  },
    { "bus_", NULL, 0x12, "Lcom.goodow.realtime.channel.Bus;", NULL,  },
    { "bridge_", NULL, 0x2, "Lcom.goodow.realtime.store.impl.DocumentBridge;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeStoreChannelOperationSucker = { 1, "OperationSucker", "com.goodow.realtime.store.channel", NULL, 0x1, 6, methods, 6, fields, 0, NULL};
  return &_ComGoodowRealtimeStoreChannelOperationSucker;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeStoreChannelOperationSucker)

@implementation ComGoodowRealtimeStoreChannelOperationSucker_$1

- (void)close {
  [((ComGoodowRealtimeStoreChannelOperationChannel *) nil_chk(this$0_->channel_)) disconnect];
}

- (void)consumeWithComGoodowRealtimeOperationOperation:(ComGoodowRealtimeOperationImplCollaborativeOperation *)op {
  [((ComGoodowRealtimeStoreChannelOperationChannel *) nil_chk(this$0_->channel_)) sendWithComGoodowRealtimeOperationOperation:op];
}

- (instancetype)initWithComGoodowRealtimeStoreChannelOperationSucker:(ComGoodowRealtimeStoreChannelOperationSucker *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeStoreChannelOperationSucker_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "close", NULL, "V", 0x1, NULL },
    { "consumeWithComGoodowRealtimeOperationImplCollaborativeOperation:", "consume", "V", 0x1, NULL },
    { "initWithComGoodowRealtimeStoreChannelOperationSucker:", "init", NULL, 0x0, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "this$0_", NULL, 0x1012, "Lcom.goodow.realtime.store.channel.OperationSucker;", NULL,  },
  };
  static const J2ObjcClassInfo _ComGoodowRealtimeStoreChannelOperationSucker_$1 = { 1, "$1", "com.goodow.realtime.store.channel", "OperationSucker", 0x8000, 3, methods, 1, fields, 0, NULL};
  return &_ComGoodowRealtimeStoreChannelOperationSucker_$1;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeStoreChannelOperationSucker_$1)
