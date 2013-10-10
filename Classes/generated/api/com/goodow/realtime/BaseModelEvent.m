//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/BaseModelEvent.h"
#include "com/goodow/realtime/CollaborativeObject.h"
#include "com/goodow/realtime/DocumentBridge.h"
#include "com/goodow/realtime/EventType.h"
#include "com/goodow/realtime/Model.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation GDRBaseModelEvent

- (id)initWithGDREventTypeEnum:(GDREventTypeEnum *)type
    withGDRCollaborativeObject:(GDRCollaborativeObject *)target
                  withNSString:(NSString *)sessionId
                  withNSString:(NSString *)userId
                   withBoolean:(BOOL)bubbles {
  if (self = [super init]) {
    self->type_ = type;
    self->target_ = target;
    self->sessionId_ = sessionId;
    self->userId_ = userId;
    self->isLocal__ = [((GDRDocumentBridge *) nil_chk(((GDRModel *) nil_chk(((GDRCollaborativeObject *) nil_chk(target))->model_))->bridge_)) isLocalSessionWithNSString:sessionId];
    self->bubbles_ = bubbles;
  }
  return self;
}

- (NSString *)getSessionId {
  return sessionId_;
}

- (GDRCollaborativeObject *)getTarget {
  return target_;
}

- (GDREventTypeEnum *)getType {
  return type_;
}

- (NSString *)getUserId {
  return userId_;
}

- (BOOL)isBubbles {
  return bubbles_;
}

- (BOOL)isLocal {
  return isLocal__;
}

- (void)copyAllFieldsTo:(GDRBaseModelEvent *)other {
  [super copyAllFieldsTo:other];
  other->bubbles_ = bubbles_;
  other->isLocal__ = isLocal__;
  other->sessionId_ = sessionId_;
  other->target_ = target_;
  other->type_ = type_;
  other->userId_ = userId_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:false withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end