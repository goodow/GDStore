#import "GDRValuesRemovedEvent+OCNI.h"
#import "GDR.h"

@implementation GDRValuesRemovedEvent (OCNI)

-(NSArray *)getValues {
  IOSObjectArray * array = [self __getValues];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}
@end
