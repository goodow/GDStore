#import "com/goodow/realtime/Realtime.h"
@class GDRDocument;
@class GDRModel;
@class GDRError;

typedef void (^GDRDocumentLoadedBlock)(GDRDocument * document);
typedef void (^GDRModelInitializerBlock)(GDRModel * model);
typedef void (^GDRErrorBlock)(GDRError * error);

@interface GDRRealtime (OCNI)

+ (void)load:(NSString *)docId
    onLoaded:(GDRDocumentLoadedBlock)onLoaded
opt_initializer:(GDRModelInitializerBlock)opt_initializer
   opt_error:(GDRErrorBlock)opt_error;

@end
