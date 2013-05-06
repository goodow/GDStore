#import "GDRCollaborativeMap+OCNI.h"
#import "GDR.h"

@implementation GDRCollaborativeMap (OCNI)
@dynamic size;

-(void)addValueChangedListener:(GDRValueChangedBlock)handler{
  [self addValueChangedListenerWithGDREventHandler:handler];
}
-(void)removeValueChangedListener:(GDRValueChangedBlock)handler{
  [self removeValueChangedListenerWithGDREventHandler:handler];
}

-(NSArray *)items {
  NSMutableArray * toRtn = [NSMutableArray array];
  IOSObjectArray * array = [self __keys];
  for(int i=0,len= self.size; i<len; i++){
    NSString * key = [array objectAtIndex:i];
    [toRtn addObject: @[key, [self get:key]]];
  }
  return toRtn;
}

-(NSArray *)keys {
  NSMutableArray * toRtn = [NSMutableArray array];
  IOSObjectArray * array = [self __keys];
  for(int i=0,len= self.size; i<len; i++){
    [toRtn addObject:[array objectAtIndex:i]];
  }
  return toRtn;
}

-(NSArray *)values {
  NSMutableArray * toRtn = [NSMutableArray array];
  IOSObjectArray * array = [self __keys];
  for(int i=0,len=self.size; i<len; i++){
    [toRtn addObject:[self get:[array objectAtIndex:i]]];
  }
  return toRtn;
}

@end
