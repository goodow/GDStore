#import "GDRCollaborativeString+OCNI.h"
#import "GDR.h"

@implementation GDRCollaborativeString (OCNI)
@dynamic length;

-(void)addTextDeletedListener:(GDRTextDeletedBlock)handler{
  [self addTextDeletedListenerWithGDREventHandler:handler];
}
-(void)addTextInsertedListener:(GDRTextInsertedBlock)handler{
  [self addTextInsertedListenerWithGDREventHandler:handler];
}
-(void)removeStringListener:(GDREventBlock)handler{
  [self removeStringListenerWithGDREventHandler:handler];
}
@end
