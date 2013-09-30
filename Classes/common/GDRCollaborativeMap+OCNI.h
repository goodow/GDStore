#import "com/goodow/realtime/CollaborativeMap.h"

@interface GDRCollaborativeMap (OCNI)

-(NSArray *)items;
-(NSArray *)keys;
-(NSArray *)values;

+ (NSArray *)arrayWithIOSArray:(IOSObjectArray *)array;
@end
