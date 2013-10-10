//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "IOSObjectArray.h"
#include "com/goodow/realtime/CollaborativeList.h"
#include "com/goodow/realtime/EventType.h"
#include "com/goodow/realtime/ValuesRemovedEvent.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportAfterCreateMethod.h"
#include "org/timepedia/exporter/client/ExportPackage.h"
#include "org/timepedia/exporter/client/NoExport.h"

@implementation GDRValuesRemovedEvent

- (id)initWithGDRCollaborativeList:(GDRCollaborativeList *)target
                      withNSString:(NSString *)sessionId
                      withNSString:(NSString *)userId
                           withInt:(int)index
                 withNSObjectArray:(IOSObjectArray *)values {
  if (self = [super initWithGDREventTypeEnum:[GDREventTypeEnum VALUES_REMOVED] withGDRCollaborativeObject:target withNSString:sessionId withNSString:userId withBoolean:NO]) {
    self->index_ = index;
    self->values_ = values;
  }
  return self;
}

- (int)getIndex {
  return index_;
}

- (IOSObjectArray *)getValues {
  return values_;
}

- (void)copyAllFieldsTo:(GDRValuesRemovedEvent *)other {
  [super copyAllFieldsTo:other];
  other->index_ = index_;
  other->values_ = values_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:true withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations___jsniRunAfter__ {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportAfterCreateMethodImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

+ (IOSObjectArray *)__annotations_getValues {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientNoExportImpl alloc] init] } count:1 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end