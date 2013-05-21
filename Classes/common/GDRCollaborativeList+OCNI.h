#import "com/goodow/realtime/CollaborativeList.h"

@interface GDRCollaborativeList (OCNI)
@property int length;

-(void)addValuesAddedListener:(GDRValuesAddedBlock)handler;
-(void)addValuesRemovedListener:(GDRValuesRemovedBlock)handler;
-(void)addValuesSetListener:(GDRValuesSetBlock)handler;
-(void)removeListListener:(GDREventBlock)handler;

-(NSArray *)asArray;
-(int)indexOf:(id)value comparator:(NSComparator)opt_comparator;
-(void)insertAll:(int)index values:(NSArray *)values;
-(int)lastIndexOf:(id)value comparator:(NSComparator)opt_comparator;
-(void)pushAll:(NSArray *)values;
-(void)replaceRange:(int)index values:(NSArray *)values;
@end
