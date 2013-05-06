#import "com/goodow/realtime/IndexReference.h"

@interface GDRIndexReference (OCNI)
@property(readonly) BOOL canBeDeleted;
@property int index;
@property(readonly) GDRCollaborativeObject * referencedObject;

-(void)addReferenceShiftedListener:(GDRReferenceShiftedBlock)handler;
-(void)removeReferenceShiftedListener:(GDRReferenceShiftedBlock)handler;
@end
