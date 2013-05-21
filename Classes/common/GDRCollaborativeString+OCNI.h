#import "com/goodow/realtime/CollaborativeString.h"

@interface GDRCollaborativeString (OCNI)
@property(readonly) int length;

-(void)addTextDeletedListener:(GDRTextDeletedBlock)handler;
-(void)addTextInsertedListener:(GDRTextInsertedBlock)handler;
-(void)removeStringListener:(GDREventBlock)handler;

@end
