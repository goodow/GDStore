#import "com/goodow/realtime/channel/http/HttpRequestCallback.h"
#import "com/goodow/realtime/channel/http/objc/ObjCHttpRequest.h"
#import "com/goodow/realtime/channel/http/objc/ObjCHttpResponse.h"
#import "GTMHTTPFetcher/GTMHTTPFetcher.h"
#import "java/io/IOException.h"

@implementation ComGoodowRealtimeChannelHttpObjcObjCHttpRequest {
  NSMutableURLRequest *request;
}

- (id)initWithNSString:(NSString *)method
          withNSString:(NSString *)url {
  NSURL *url_ = [NSURL URLWithString:url];
  request = [[NSMutableURLRequest alloc] initWithURL:url_];
  [request setHTTPMethod:method];
  [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
  return [super init];
}

- (void)executeAsyncWithComGoodowRealtimeChannelHttpHttpRequestCallback:(id<ComGoodowRealtimeChannelHttpHttpRequestCallback>)callback
                                                           withNSString:(NSString *)content {
  GTMHTTPFetcher* fetcher = [GTMHTTPFetcher fetcherWithRequest:request];
  if(content){
    fetcher.postData = [content dataUsingEncoding:NSUTF8StringEncoding];
  }
  [fetcher beginFetchWithCompletionHandler:^(NSData *retrievedData, NSError *error) {
    if (error != nil) {
      NSData *data = [[error userInfo] valueForKey:@"data"];
      NSString *errorDataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      // status code or network error
      [callback onFailureWithJavaLangThrowable:[[JavaIoIOException alloc] initWithNSString:errorDataString]];
    } else {
      // succeeded
      [callback onResponseWithComGoodowRealtimeChannelHttpHttpResponse:[[ComGoodowRealtimeChannelHttpObjcObjCHttpResponse alloc] initWithGTMHTTPFetech:fetcher withNSData:retrievedData]];
    }
  }];
}

@end
