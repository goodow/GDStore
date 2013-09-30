#import "com/goodow/realtime/CollaborativeList.h"

@interface GDRCollaborativeList (OCNI)

-(NSArray *)asArray;
-(void)insertAll:(int)index values:(NSArray *)values;
-(void)pushAll:(NSArray *)values;
-(void)replaceRange:(int)index values:(NSArray *)values;
@end
