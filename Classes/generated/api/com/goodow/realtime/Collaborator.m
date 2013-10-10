//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/Collaborator.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation GDRCollaborator

- (id)initWithNSString:(NSString *)userId
          withNSString:(NSString *)sessionId
          withNSString:(NSString *)displayName
          withNSString:(NSString *)color
           withBoolean:(BOOL)isMe
           withBoolean:(BOOL)isAnonymous
          withNSString:(NSString *)photoUrl {
  if (self = [super init]) {
    self->userId_ = userId;
    self->sessionId_ = sessionId;
    self->displayName_ = displayName;
    self->color_ = color;
    self->isMe__ = isMe;
    self->isAnonymous__ = isAnonymous;
    self->photoUrl_ = photoUrl;
  }
  return self;
}

- (NSString *)getColor {
  return color_;
}

- (NSString *)getDisplayName {
  return displayName_;
}

- (NSString *)getPhotoUrl {
  return photoUrl_;
}

- (NSString *)getSessionId {
  return sessionId_;
}

- (NSString *)getUserId {
  return userId_;
}

- (BOOL)isAnonymous {
  return isAnonymous__;
}

- (BOOL)isMe {
  return isMe__;
}

- (void)copyAllFieldsTo:(GDRCollaborator *)other {
  [super copyAllFieldsTo:other];
  other->color_ = color_;
  other->displayName_ = displayName_;
  other->isAnonymous__ = isAnonymous__;
  other->isMe__ = isMe__;
  other->photoUrl_ = photoUrl_;
  other->sessionId_ = sessionId_;
  other->userId_ = userId_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:false withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end