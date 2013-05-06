#import "com/goodow/realtime/CollaborativeObject.h"

@interface GDRCollaborativeObject (OCNI)

-(void)addObjectChangedListener:(GDRObjectChangedBlock)handler;
-(void)removeObjectChangedListener:(GDRObjectChangedBlock)handler;

@end
