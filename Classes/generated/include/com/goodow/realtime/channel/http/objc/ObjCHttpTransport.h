//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelHttpObjcObjCHttpTransport_H_
#define _ComGoodowRealtimeChannelHttpObjcObjCHttpTransport_H_

@protocol ComGoodowRealtimeChannelHttpHttpRequest;

#import "JreEmulation.h"
#include "com/goodow/realtime/channel/http/HttpTransport.h"

@interface ComGoodowRealtimeChannelHttpObjcObjCHttpTransport : ComGoodowRealtimeChannelHttpHttpTransport {
}

- (id<ComGoodowRealtimeChannelHttpHttpRequest>)buildRequestWithNSString:(NSString *)method
                                                           withNSString:(NSString *)url;
- (id)init;
@end

#endif // _ComGoodowRealtimeChannelHttpObjcObjCHttpTransport_H_