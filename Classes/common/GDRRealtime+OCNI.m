#import "GDRRealtime+OCNI.h"
#import "GDR.h"

@implementation GDRRealtime (OCNI)
+(void)load:(id)docId onLoaded:(GDRDocumentLoadedBlock)onLoaded
opt_initializer:(GDRModelInitializerBlock)opt_initializer
  opt_error:(GDRErrorBlock)opt_error {
  [self load__WithNSString:docId withGDRDocumentLoadedHandler:onLoaded withGDRModelInitializerHandler:opt_initializer withGDRErrorHandler:opt_error];
}
@end
