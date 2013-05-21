#import "GDRIndexReference+OCNI.h"
#import "GDR.h"

@implementation GDRIndexReference (OCNI)
@dynamic canBeDeleted, index, referencedObject;

-(void)addReferenceShiftedListener:(GDRReferenceShiftedBlock)handler{
  [self addReferenceShiftedListenerWithGDREventHandler:handler];
}
-(void)removeReferenceShiftedListener:(GDRReferenceShiftedBlock)handler{
  [self removeReferenceShiftedListenerWithGDREventHandler:handler];
}
@end
