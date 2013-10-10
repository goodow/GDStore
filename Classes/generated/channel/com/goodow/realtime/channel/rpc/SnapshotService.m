//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/channel/constant/Constants.h"
#include "com/goodow/realtime/channel/rpc/Rpc.h"
#include "com/goodow/realtime/channel/rpc/RpcUtil.h"
#include "com/goodow/realtime/channel/rpc/SnapshotService.h"
#include "elemental/json/JsonObject.h"
#include "elemental/json/JsonValue.h"
#include "elemental/util/Collections.h"
#include "elemental/util/MapFromStringToString.h"
#include "java/lang/Boolean.h"
#include "java/lang/Throwable.h"
#include "java/util/logging/Level.h"
#include "java/util/logging/Logger.h"

@implementation ComGoodowRealtimeChannelRpcSnapshotService

static JavaUtilLoggingLogger * ComGoodowRealtimeChannelRpcSnapshotService_logger_;

+ (JavaUtilLoggingLogger *)logger {
  return ComGoodowRealtimeChannelRpcSnapshotService_logger_;
}

- (id)initWithComGoodowRealtimeChannelRpcRpc:(id<ComGoodowRealtimeChannelRpcRpc>)rpc {
  if (self = [super init]) {
    self->rpc_ = rpc;
  }
  return self;
}

- (void)load__WithNSString:(NSString *)id_
              withNSString:(NSString *)token
              withNSString:(NSString *)sessionId
               withBoolean:(BOOL)autoCreate
withComGoodowRealtimeChannelRpcSnapshotService_Callback:(id<ComGoodowRealtimeChannelRpcSnapshotService_Callback>)callback {
  id<ElementalUtilMapFromStringToString> params = [ElementalUtilCollections mapFromStringToString];
  [((id<ElementalUtilMapFromStringToString>) nil_chk(params)) putWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params ID] withNSString:id_];
  if (sessionId != nil) {
    [params putWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params SESSION_ID] withNSString:sessionId];
  }
  [params putWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params ACCESS_TOKEN] withNSString:token];
  [params putWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params AUTO_CREATE] withNSString:[NSString stringWithFormat:@"%@", [JavaLangBoolean toStringWithBoolean:autoCreate]]];
  (void) [((id<ComGoodowRealtimeChannelRpcRpc>) nil_chk(rpc_)) getWithNSString:[ComGoodowRealtimeChannelConstantConstants_Services SNAPSHOT] withElementalUtilMapFromStringToString:params withComGoodowRealtimeChannelRpcRpc_RpcCallback:[[ComGoodowRealtimeChannelRpcSnapshotService_$1 alloc] initWithNSString:id_ withComGoodowRealtimeChannelRpcSnapshotService_Callback:callback]];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeChannelRpcSnapshotService class]) {
    ComGoodowRealtimeChannelRpcSnapshotService_logger_ = [JavaUtilLoggingLogger getLoggerWithNSString:[[IOSClass classWithClass:[ComGoodowRealtimeChannelRpcSnapshotService class]] getName]];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeChannelRpcSnapshotService *)other {
  [super copyAllFieldsTo:other];
  other->rpc_ = rpc_;
}

@end
@implementation ComGoodowRealtimeChannelRpcSnapshotService_$1

- (void)onConnectionErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcSnapshotService logger])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel WARNING] withNSString:[NSString stringWithFormat:@"Connection Error when get snapshot for %@", val$id_] withJavaLangThrowable:e];
}

- (void)onFatalErrorWithJavaLangThrowable:(JavaLangThrowable *)e {
  [((JavaUtilLoggingLogger *) nil_chk([ComGoodowRealtimeChannelRpcSnapshotService logger])) logWithJavaUtilLoggingLevel:[JavaUtilLoggingLevel SEVERE] withNSString:[NSString stringWithFormat:@"Fatal Error when get snapshot for %@", val$id_] withJavaLangThrowable:e];
}

- (void)onSuccessWithNSString:(NSString *)data {
  id<GDRJsonObject> obj = [ComGoodowRealtimeChannelRpcRpcUtil evalPrefixedWithNSString:data];
  [((id<ComGoodowRealtimeChannelRpcSnapshotService_Callback>) nil_chk(val$callback_)) onSuccessWithGDRJsonValue:[((id<GDRJsonObject>) nil_chk(obj)) getWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params SNAPSHOT]] withNSString:nil withInt:(int) [obj getNumberWithNSString:[ComGoodowRealtimeChannelConstantConstants_Params REVISION]]];
}

- (id)initWithNSString:(NSString *)capture$0
withComGoodowRealtimeChannelRpcSnapshotService_Callback:(id<ComGoodowRealtimeChannelRpcSnapshotService_Callback>)capture$1 {
  val$id_ = capture$0;
  val$callback_ = capture$1;
  return [super init];
}

@end