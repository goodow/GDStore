#import "com/goodow/realtime/Document.h"

@interface GDRDocument (OCNI)
-(void)addCollaboratorJoinedListener:(GDRCollaboratorJoinedBlock)handler;
-(void)addCollaboratorLeftListener:(GDRCollaboratorLeftBlock)handler;
-(void)addDocumentSaveStateListener:(GDRDocumentSaveStateChangedBlock)handler;
-(void)removeCollaboratorJoinedListener:(GDRCollaboratorJoinedBlock)handler;
-(void)removeCollaboratorLeftListener:(GDRCollaboratorLeftBlock)handler;

@end
