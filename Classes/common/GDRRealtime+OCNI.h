#import "com/goodow/realtime/Realtime.h"
#import "GDRError+OCNI.h"
typedef void (^GDRDocumentLoadedBlock)(GDRDocument * document);
typedef void (^GDRModelInitializerBlock)(GDRModel * model);

@interface GDRRealtime (OCNI)

+ (void)load:(NSString *)docId
    onLoaded:(GDRDocumentLoadedBlock)onLoaded
 initializer:(GDRModelInitializerBlock)opt_initializer
       error:(GDRErrorBlock)opt_error;

@end
