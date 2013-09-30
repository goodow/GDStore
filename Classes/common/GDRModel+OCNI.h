#import "com/goodow/realtime/Model.h"

@interface GDRModel (OCNI)

-(GDRCollaborativeList *)createList:(NSArray *)opt_initialValue;
-(GDRCollaborativeMap *)createMap:(NSDictionary *)opt_initialValue;
@end
