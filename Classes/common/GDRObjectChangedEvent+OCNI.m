#import "GDRObjectChangedEvent+OCNI.h"

@implementation GDRObjectChangedEvent (OCNI)

+(NSArray *)arrayWithIOSArray:(IOSObjectArray *)array {
  NSMutableArray * toRtn = [NSMutableArray array];
  for(int i=0,len=[array count]; i<len; i++){
    [toRtn addObject:[array objectAtIndex:i]];
  }
  return toRtn;
}

-(NSArray *)getEvents {
  IOSObjectArray * array = [self __getEvents];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}
@end
