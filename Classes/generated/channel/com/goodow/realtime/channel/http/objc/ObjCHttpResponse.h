#import "JreEmulation.h"
#import "com/goodow/realtime/channel/http/HttpResponse.h"
#import "GTMHTTPFetcher/GTMHTTPFetcher.h"

@interface ComGoodowRealtimeChannelHttpObjcObjCHttpResponse : ComGoodowRealtimeChannelHttpHttpResponse {
}

- (NSString *)getContent;
- (NSString *)getContentEncoding;
- (long long int)getContentLength;
- (NSString *)getContentType;
- (int)getHeaderCount;
- (NSString *)getHeaderNameWithInt:(int)index;
- (NSString *)getHeaderValueWithInt:(int)index;
- (NSString *)getReasonPhrase;
- (int)getStatusCode;
- (NSString *)getStatusLine;
- (id)initWithGTMHTTPFetech:(GTMHTTPFetcher *)fetcher withNSData:(NSData *)data;
@end
