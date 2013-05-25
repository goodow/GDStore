#import "com/goodow/realtime/channel/http/objc/ObjCHttpResponse.h"

@implementation ComGoodowRealtimeChannelHttpObjcObjCHttpResponse {
  GTMHTTPFetcher *fetcher_;
  NSData *data_;
  NSMutableArray *headerNames;
  NSMutableArray *headerValues;
  NSString *contentEncoding;
  NSString *contentType;
  long long int contentLength;
}

- (NSString *)getContent {
  return [[NSString alloc] initWithData:data_ encoding:NSUTF8StringEncoding];
}

- (NSString *)getContentEncoding {
  return contentEncoding;
}

- (long long int)getContentLength {
  return contentLength;
}

- (NSString *)getContentType {
  return contentType;
}

- (int)getHeaderCount {
  return [fetcher_ responseHeaders].count;
}

- (NSString *)getHeaderNameWithInt:(int)index {
  return [headerNames objectAtIndex:index];
}

- (NSString *)getHeaderValueWithInt:(int)index {
  return [headerValues objectAtIndex:index];
}

- (NSString *)getReasonPhrase {
  return nil;
}

- (int)getStatusCode {
  return fetcher_.statusCode;
}

- (NSString *)getStatusLine {
  return nil;
}

- (id)initWithGTMHTTPFetech:(GTMHTTPFetcher *)fetcher withNSData:(NSData *)data {
  headerNames = [[NSMutableArray alloc] init];
  headerValues = [[NSMutableArray alloc] init];
  fetcher_ = fetcher;
  data_ = data;
  NSDictionary *headers = fetcher_.responseHeaders;
  for(NSString *name in headers){
    NSString *value = [headers valueForKey:name];
    if (name != nil && value != nil) {
      [headerNames addObject:name];
      [headerValues addObject:value];
      if ([@"content-type" caseInsensitiveCompare:name] == 0) {
        contentType = value;
      } else if ([@"content-encoding" caseInsensitiveCompare:name] == 0) {
        contentEncoding = value;
      } else if ([@"content-length" caseInsensitiveCompare:name] == 0) {
        contentLength = [value longLongValue];
      }
    }
  }
  return [super init];
}

@end
