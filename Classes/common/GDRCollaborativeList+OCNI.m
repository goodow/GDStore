#import "GDRCollaborativeList+OCNI.h"
#import "GDR.h"
#import "IOSClass.h"

@implementation GDRCollaborativeList (OCNI)

-(NSArray *)asArray {
  IOSObjectArray * array = [self __asArray];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}

-(void)insertAll:(int)index values:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self insertAllWithInt:index withNSObjectArray:array];
}

-(void)pushAll:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self pushAllWithNSObjectArray:array];
}

-(void)replaceRange:(int)index values:(NSArray *)values {
  IOSObjectArray * array = [self toIOSObjectArray:values];
  return [self replaceRangeWithInt:index withNSObjectArray:array];
}

-(IOSObjectArray *)toIOSObjectArray:(NSArray *) array {
  return [IOSObjectArray arrayWithNSArray:array type:[IOSClass classWithClass:[NSObject class]]];
}
@end
