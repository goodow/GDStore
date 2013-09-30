#import "com/goodow/realtime/channel/http/objc/ObjCHttpResponse.h"

@implementation ComGoodowRealtimeChannelHttpObjcObjCHttpResponse {
  GTMHTTPFetcher *fetcher_;
  NSData *data_;
}

- (NSString *)getContent {
  return [[NSString alloc] initWithData:data_ encoding:NSUTF8StringEncoding];
}

- (int)getStatusCode {
  return fetcher_.statusCode;
}

- (id)initWithGTMHTTPFetech:(GTMHTTPFetcher *)fetcher withNSData:(NSData *)data {
  fetcher_ = fetcher;
  data_ = data;
  return [super init];
}

@end