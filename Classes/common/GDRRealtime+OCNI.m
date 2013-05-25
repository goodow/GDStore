#import "GDRRealtime+OCNI.h"
#import "GDR.h"

@implementation GDRRealtime (OCNI)
+(void)load:(id)docId onLoaded:(GDRDocumentLoadedBlock)onLoaded initializer:(GDRModelInitializerBlock)opt_initializer error:(GDRErrorBlock)opt_error {
  [self load__WithNSString:docId withGDRDocumentLoadedHandler:onLoaded withGDRModelInitializerHandler:opt_initializer withGDRError_ErrorHandler:opt_error];
}
@end
