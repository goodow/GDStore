//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelHttpObjcObjCHttpRequest_H_
#define _ComGoodowRealtimeChannelHttpObjcObjCHttpRequest_H_

@protocol ComGoodowRealtimeChannelHttpHttpRequestCallback;

#import "JreEmulation.h"
#include "com/goodow/realtime/channel/http/HttpRequest.h"

@interface ComGoodowRealtimeChannelHttpObjcObjCHttpRequest : NSObject < ComGoodowRealtimeChannelHttpHttpRequest > {
}

- (id)initWithNSString:(NSString *)method
          withNSString:(NSString *)url;
- (void)executeAsyncWithComGoodowRealtimeChannelHttpHttpRequestCallback:(id<ComGoodowRealtimeChannelHttpHttpRequestCallback>)callback
                                                           withNSString:(NSString *)content;
@end

#endif // _ComGoodowRealtimeChannelHttpObjcObjCHttpRequest_H_