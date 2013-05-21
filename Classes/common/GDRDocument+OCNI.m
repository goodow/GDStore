#import "GDRDocument+OCNI.h"
#import "GDR.h"

@implementation GDRDocument (OCNI)
-(void)addCollaboratorJoinedListener:(GDRCollaboratorJoinedBlock)handler{
  [self addCollaboratorJoinedListenerWithGDREventHandler:handler];
}
-(void)addCollaboratorLeftListener:(GDRCollaboratorLeftBlock)handler{
  [self addCollaboratorLeftListenerWithGDREventHandler:handler];
}
-(void)addDocumentSaveStateListener:(GDRDocumentSaveStateChangedBlock)handler{
  [self addDocumentSaveStateListenerWithGDREventHandler:handler];
}
-(void)removeCollaboratorJoinedListener:(GDRCollaboratorJoinedBlock)handler{
  [self removeCollaboratorJoinedListenerWithGDREventHandler:handler];
}
-(void)removeCollaboratorLeftListener:(GDRCollaboratorLeftBlock)handler{
  [self removeCollaboratorLeftListenerWithGDREventHandler:handler];
}

@end
