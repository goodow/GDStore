// Copyright 2014 Goodow.com. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  JavaToIOSStoreAdapter.m
//  GDStore
//
//  Created by Larry Tin.
//

#import "JavaToIOSStoreAdapter.h"
#import "com/goodow/realtime/store/Store.h"
#import "JavaToIOSBusAdapter.h"

@implementation JavaToIOSStoreAdapter

-(id)initWithJavaStore:(id<ComGoodowRealtimeStoreStore>)store {
  if ((self = [super init])) {
    delegate_ = store;
  }
  return self;
}

+ (JavaToIOSStoreAdapter *)fromJavaStore:(id <ComGoodowRealtimeStoreStore>)store {
  return [[JavaToIOSStoreAdapter alloc] initWithJavaStore:store];
}

- (void)close {
  [delegate_ close];
}

- (id <GDCBus>)getBus {
  return [JavaToIOSBusAdapter fromJavaBus:[delegate_ getBus]];
}

- (void)            load:(NSString *)id
                onLoaded:(void (^)(id<GDSDocument>))onLoaded
         opt_initializer:(void (^)(id<GDSModel>))opt_initializer
               opt_error:(void (^)(id<GDSError>))opt_error {
         [delegate_ load__WithNSString:id
      withComGoodowRealtimeCoreHandler:onLoaded
      withComGoodowRealtimeCoreHandler:opt_initializer
      withComGoodowRealtimeCoreHandler:opt_error];
}

@end