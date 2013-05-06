#import "GDRCollaborativeList+OCNI.h"
#import "GDR.h"

@implementation GDRCollaborativeList (OCNI)
@dynamic length;

-(void)addValuesAddedListener:(GDRValuesAddedBlock)handler{
  [self addValuesAddedListenerWithGDREventHandler:handler];
}
-(void)addValuesRemovedListener:(GDRValuesRemovedBlock)handler{
  [self addValuesRemovedListenerWithGDREventHandler:handler];
}
-(void)addValuesSetListener:(GDRValuesSetBlock)handler{
  [self addValuesSetListenerWithGDREventHandler:handler];
}
-(void)removeListListener:(GDREventBlock)handler{
  [self removeListListenerWithGDREventHandler:handler];
}

-(NSArray *)asArray {
  NSMutableArray * toRtn = [NSMutableArray array];
  for(int i=0,len= self.length; i<len; i++){
    [toRtn addObject: [self get:i]];
  }
  return toRtn;
}

-(int)indexOf:(id)value comparator:(GDRComparatorBlock)opt_comparator {
  return [self indexOfWithId:value withJavaUtilComparator:opt_comparator];
}

-(void)insertAll:(int)index values:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self insertAllWithInt:index withNSObjectArray:array];
}

-(IOSObjectArray *)toIOSObjectArray:(NSArray *) array {
  return [IOSObjectArray arrayWithNSArray:array type:[IOSClass classWithClass:[NSObject class]]];
}

-(int)lastIndexOf:(id)value comparator:(GDRComparatorBlock)opt_comparator {
  return [self lastIndexOfWithId:value withJavaUtilComparator:opt_comparator];
}

-(void)pushAll:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self pushAllWithNSObjectArray:array];
}

-(void)replaceRange:(int)index values:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self replaceRangeWithInt:index withNSObjectArray:array];
}
@end
