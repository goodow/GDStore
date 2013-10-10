//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSClass.h"
#include "com/goodow/realtime/databinding/AlreadyBoundError.h"
#include "com/goodow/realtime/model/util/ModelFactory.h"
#include "org/timepedia/exporter/client/Export.h"
#include "org/timepedia/exporter/client/ExportPackage.h"

@implementation GDRAlreadyBoundError

- (id)initWithId:(id)domElement {
  if (self = [super init]) {
    self->domElement_ = domElement;
  }
  return self;
}

- (id)getDomElement {
  return domElement_;
}

- (NSString *)getName {
  return name_;
}

- (void)copyAllFieldsTo:(GDRAlreadyBoundError *)other {
  [super copyAllFieldsTo:other];
  other->domElement_ = domElement_;
  other->name_ = name_;
}

+ (IOSObjectArray *)__annotations {
  return [IOSObjectArray arrayWithObjects:(id[]) { [[OrgTimepediaExporterClientExportPackageImpl alloc] initWithValue:@"good.realtime.databinding"], [[OrgTimepediaExporterClientExportImpl alloc] initWithAll:false withValue:@""] } count:2 type:[IOSClass classWithProtocol:@protocol(JavaLangAnnotationAnnotation)]];
}

@end