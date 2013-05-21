#import "com/goodow/realtime/channel/http/HttpRequestCallback.h"
#import "com/goodow/realtime/channel/http/objc/ObjCHttpRequest.h"
#import "GTMHTTPFetcher/GTMHTTPFetcher.h"

@implementation ComGoodowRealtimeChannelHttpObjcObjCHttpRequest {
  NSMutableURLRequest *request;
}

- (id)initWithNSString:(NSString *)method
          withNSString:(NSString *)url {
  NSURL *url_ = [NSURL URLWithString:url];
  request = [[NSMutableURLRequest alloc] initWithURL:url_];
  [request setHTTPMethod:method];
  
  return [super init];
}

- (void)addHeaderWithNSString:(NSString *)name
                 withNSString:(NSString *)value {
  [request addValue:value forHTTPHeaderField:name];
}

- (void)executeAsyncWithComGoodowRealtimeChannelHttpHttpRequestCallback:(id<ComGoodowRealtimeChannelHttpHttpRequestCallback>)callback {
  GTMHTTPFetcher* myFetcher = [GTMHTTPFetcher fetcherWithRequest:request];
  [myFetcher beginFetchWithCompletionHandler:^(NSData *retrievedData, NSError *error) {
    if (error != nil) {
      // status code or network error
    } else {
      // succeeded
    }
  }];
}

@end
