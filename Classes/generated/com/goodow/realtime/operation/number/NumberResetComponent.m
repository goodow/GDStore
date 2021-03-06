//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/larry/dev/workspace/realtime/realtime-operation/src/main/java/com/goodow/realtime/operation/number/NumberResetComponent.java
//

#include "J2ObjC_source.h"
#include "com/goodow/realtime/json/JsonArray.h"
#include "com/goodow/realtime/operation/Operation.h"
#include "com/goodow/realtime/operation/impl/AbstractComponent.h"
#include "com/goodow/realtime/operation/number/NumberAddComponent.h"
#include "com/goodow/realtime/operation/number/NumberResetComponent.h"
#include "com/goodow/realtime/operation/number/NumberTarget.h"
#include "java/lang/Double.h"

@interface ComGoodowRealtimeOperationNumberNumberResetComponent () {
 @public
  jdouble oldNumber_;
  jdouble newNumber_;
}
@end

@implementation ComGoodowRealtimeOperationNumberNumberResetComponent

- (instancetype)initWithNSString:(NSString *)id_
                      withDouble:(jdouble)oldNumber
                      withDouble:(jdouble)newNumber {
  if (self = [super initWithInt:ComGoodowRealtimeOperationNumberNumberResetComponent_TYPE withNSString:id_]) {
    NSAssert(!JavaLangDouble_isNaNWithDouble_(newNumber) && oldNumber != newNumber, @"com/goodow/realtime/operation/number/NumberResetComponent.java:28 condition failed: assert !Double.isNaN(newNumber) && oldNumber != newNumber;");
    self->oldNumber_ = oldNumber;
    self->newNumber_ = newNumber;
  }
  return self;
}

- (void)applyWithId:(id<ComGoodowRealtimeOperationNumberNumberTarget>)target {
  [((id<ComGoodowRealtimeOperationNumberNumberTarget>) nil_chk(target)) resetWithDouble:newNumber_];
}

- (ComGoodowRealtimeOperationNumberNumberResetComponent *)invert {
  NSAssert(!JavaLangDouble_isNaNWithDouble_(oldNumber_), @"com/goodow/realtime/operation/number/NumberResetComponent.java:40 condition failed: assert !Double.isNaN(oldNumber);");
  return [[ComGoodowRealtimeOperationNumberNumberResetComponent alloc] initWithNSString:id__ withDouble:newNumber_ withDouble:oldNumber_];
}

- (ComGoodowRealtimeOperationNumberNumberResetComponent *)transformWithComGoodowRealtimeOperationOperation:(id<ComGoodowRealtimeOperationOperation>)other
                                                                                               withBoolean:(jboolean)applied {
  NSAssert(([other isKindOfClass:[ComGoodowRealtimeOperationNumberNumberResetComponent class]] || [other isKindOfClass:[ComGoodowRealtimeOperationNumberNumberAddComponent class]]) && [self isSameIdWithComGoodowRealtimeOperationOperation:other], @"com/goodow/realtime/operation/number/NumberResetComponent.java:46 condition failed: assert (other instanceof NumberResetComponent || other instanceof NumberAddComponent)\n        && isSameId(other);");
  if ([other isKindOfClass:[ComGoodowRealtimeOperationNumberNumberResetComponent class]]) {
    ComGoodowRealtimeOperationNumberNumberResetComponent *op = ((ComGoodowRealtimeOperationNumberNumberResetComponent *) check_class_cast(other, [ComGoodowRealtimeOperationNumberNumberResetComponent class]));
    return applied || ((ComGoodowRealtimeOperationNumberNumberResetComponent *) nil_chk(op))->newNumber_ == newNumber_ ? nil : [[ComGoodowRealtimeOperationNumberNumberResetComponent alloc] initWithNSString:id__ withDouble:op->newNumber_ withDouble:newNumber_];
  }
  else {
    return [[ComGoodowRealtimeOperationNumberNumberResetComponent alloc] initWithNSString:id__ withDouble:oldNumber_ + ((ComGoodowRealtimeOperationNumberNumberAddComponent *) nil_chk(((ComGoodowRealtimeOperationNumberNumberAddComponent *) check_class_cast(other, [ComGoodowRealtimeOperationNumberNumberAddComponent class]))))->number_ withDouble:newNumber_];
  }
}

- (void)toJsonWithComGoodowRealtimeJsonJsonArray:(id<ComGoodowRealtimeJsonJsonArray>)json {
  (void) [((id<ComGoodowRealtimeJsonJsonArray>) nil_chk(json)) pushWithDouble:newNumber_];
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeOperationNumberNumberResetComponent *)other {
  [super copyAllFieldsTo:other];
  other->oldNumber_ = oldNumber_;
  other->newNumber_ = newNumber_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithNSString:withDouble:withDouble:", "NumberResetComponent", NULL, 0x1, NULL },
    { "applyWithComGoodowRealtimeOperationNumberNumberTarget:", "apply", "V", 0x1, NULL },
    { "invert", NULL, "Lcom.goodow.realtime.operation.number.NumberResetComponent;", 0x1, NULL },
    { "transformWithComGoodowRealtimeOperationOperation:withBoolean:", "transform", "Lcom.goodow.realtime.operation.number.NumberResetComponent;", 0x1, NULL },
    { "toJsonWithComGoodowRealtimeJsonJsonArray:", "toJson", "V", 0x4, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "TYPE_", NULL, 0x19, "I", NULL, .constantValue.asInt = ComGoodowRealtimeOperationNumberNumberResetComponent_TYPE },
    { "oldNumber_", NULL, 0x12, "D", NULL,  },
    { "newNumber_", NULL, 0x12, "D", NULL,  },
  };
  static const char *superclass_type_args[] = {"Lcom.goodow.realtime.operation.number.NumberTarget;"};
  static const J2ObjcClassInfo _ComGoodowRealtimeOperationNumberNumberResetComponent = { 1, "NumberResetComponent", "com.goodow.realtime.operation.number", NULL, 0x1, 5, methods, 3, fields, 1, superclass_type_args};
  return &_ComGoodowRealtimeOperationNumberNumberResetComponent;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComGoodowRealtimeOperationNumberNumberResetComponent)
