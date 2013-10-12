#import "GDRValuesSetEvent+OCNI.h"
#import "GDR.h"

@implementation GDRValuesSetEvent (OCNI)

-(NSArray *)getNewValues {
  IOSObjectArray * array = [self __getNewValues];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}
-(NSArray *)getOldValues {
  IOSObjectArray * array = [self __getOldValues];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}
@end
