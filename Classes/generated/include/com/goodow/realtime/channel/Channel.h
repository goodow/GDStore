//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ComGoodowRealtimeChannelChannel_H_
#define _ComGoodowRealtimeChannelChannel_H_

@protocol ComGoodowRealtimeChannelSocket;
@protocol ComGoodowRealtimeChannelSocketListener;

#import "JreEmulation.h"

@protocol ComGoodowRealtimeChannelChannel < NSObject, JavaObject >
- (id<ComGoodowRealtimeChannelSocket>)openWithComGoodowRealtimeChannelSocketListener:(id<ComGoodowRealtimeChannelSocketListener>)listener;
@end

#endif // _ComGoodowRealtimeChannelChannel_H_