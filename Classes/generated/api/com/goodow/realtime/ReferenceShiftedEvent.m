//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/EventType.h"
#include "com/goodow/realtime/IndexReference.h"
#include "com/goodow/realtime/ReferenceShiftedEvent.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation GDRReferenceShiftedEvent

- (id)initWithGDRIndexReference:(GDRIndexReference *)target
                        withInt:(int)oldIndex
                        withInt:(int)newIndex
                   withNSString:(NSString *)sessionId
                   withNSString:(NSString *)userId {
  if (self = [super initWithGDREventTypeEnum:[GDREventTypeEnum REFERENCE_SHIFTED] withGDRCollaborativeObject:target withNSString:sessionId withNSString:userId withBoolean:NO]) {
    self->oldIndex_ = oldIndex;
    self->newIndex_ = newIndex;
  }
  return self;
}

- (int)getNewIndex {
  return newIndex_;
}

- (int)getOldIndex {
  return oldIndex_;
}

- (void)copyAllFieldsTo:(GDRReferenceShiftedEvent *)other {
  [super copyAllFieldsTo:other];
  other->newIndex_ = newIndex_;
  other->oldIndex_ = oldIndex_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:true withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end