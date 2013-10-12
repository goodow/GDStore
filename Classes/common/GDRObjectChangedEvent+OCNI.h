#import "com/goodow/realtime/ObjectChangedEvent.h"

@interface GDRObjectChangedEvent (OCNI)

+(NSArray *)arrayWithIOSArray:(IOSObjectArray *)array;

-(NSArray *)getEvents;

@end
