#import "GDRModel+OCNI.h"
#import "GDR.h"
#import "java/util/HashMap.h"

@implementation GDRModel (OCNI)
@dynamic canRedo, canUndo, isReadOnly;

-(void)addUndoRedoStateChangedListener:(GDRUndoRedoStateChangedBlock)handler{
  [self addUndoRedoStateChangedListenerWithGDREventHandler:handler];
}

-(GDRCollaborativeList *)createList:(NSArray *)opt_initialValue {
  IOSObjectArray * array = nil;
  if(opt_initialValue != nil){
    array = [IOSObjectArray arrayWithNSArray:opt_initialValue type:[IOSClass classWithClass:[NSObject class]]];
  }
  return [self createListWithNSObjectArray:array];
}

-(GDRCollaborativeMap *)createMap:(NSDictionary *)opt_initialValue {
  id<JavaUtilMap> map = nil;
  if(opt_initialValue != nil){
    map = [[JavaUtilHashMap alloc] init];
    for(NSString *key in opt_initialValue){
      [map putWithId:key withId:opt_initialValue[key]];
    }
  }
  return [self createMapWithJavaUtilMap:map];
}

@end
