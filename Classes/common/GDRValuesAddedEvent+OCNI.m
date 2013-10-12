#import "GDRValuesAddedEvent+OCNI.h"
#import "GDR.h"

@implementation GDRValuesAddedEvent (OCNI)

-(NSArray *)getValues {
  IOSObjectArray * array = [self __getValues];
  return [GDRObjectChangedEvent arrayWithIOSArray:array];
}
@end
