//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/retechretech/dev/workspace/realtime/realtime-store/src/main/java/com/goodow/realtime/store/IndexReference.java
//
//  Created by retechretech.
//

#include "IOSClass.h"
#include "com/goodow/realtime/core/Handler.h"
#include "com/goodow/realtime/core/Registration.h"
#include "com/goodow/realtime/store/CollaborativeObject.h"
#include "com/goodow/realtime/store/IndexReference.h"
#include "com/google/gwt/core/client/js/JsProperty.h"

@interface ComGoodowRealtimeStoreIndexReference : NSObject
@end

@implementation ComGoodowRealtimeStoreIndexReference

+ (J2ObjcClassInfo *)__metadata {
  static J2ObjcMethodInfo methods[] = {
    { "onReferenceShiftedWithComGoodowRealtimeCoreHandler:", "onReferenceShifted", "Lcom.goodow.realtime.core.Registration;", 0x401, NULL },
    { "canBeDeleted", NULL, "Z", 0x401, NULL },
    { "index", NULL, "I", 0x401, NULL },
    { "indexWithInt:", "index", "V", 0x401, NULL },
    { "referencedObject", NULL, "TT;", 0x401, NULL },
  };
  static J2ObjcClassInfo _ComGoodowRealtimeStoreIndexReference = { "IndexReference", "com.goodow.realtime.store", NULL, 0x201, 5, methods, 0, NULL, 0, NULL};
  return &_ComGoodowRealtimeStoreIndexReference;
}

@end