#import "GDRRealtime+OCNI.h"
#import "com/goodow/realtime/DocumentBridge.h"
#import "GDR.h"

@implementation GDRRealtime (OCNI)
+(void)load:(id)docId onLoaded:(GDRDocumentLoadedBlock)onLoaded initializer:(GDRModelInitializerBlock)opt_initializer error:(GDRErrorBlock)opt_error{
  GDRDocument * doc = [[GDRDocumentBridge new] createWithEMJsonArray:[EMJson createArray]];
  onLoaded(doc);
}
@end
