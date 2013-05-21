#import "com/goodow/realtime/Model.h"

@interface GDRModel (OCNI)
@property(readonly) BOOL canRedo;
@property(readonly) BOOL canUndo;
@property(readonly) BOOL isReadOnly;

-(void)addUndoRedoStateChangedListener:(GDRUndoRedoStateChangedBlock)handler;

-(GDRCollaborativeList *)createList:(NSArray *)opt_initialValue;
-(GDRCollaborativeMap *)createMap:(NSDictionary *)opt_initialValue;
@end
