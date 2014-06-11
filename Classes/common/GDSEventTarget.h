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
//  GDSEventTarget.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>

@protocol GDCRegistration;

/**
 * An event target which can dispatch events to interested listeners. Listeners subscribe via addEventListener.
 */
@protocol GDSEventTarget <NSObject>

/**
 * Adds an event listener to the event target. The same handler can only be added once per the
 * type. Even if you add the same handler multiple times using the same type then it will only be
 * called once when the event is dispatched.
 *
 * @param type The type of the event to listen for.
 * @param handler The function to handle the event. The handler can also be an object that
 *          implements the handle method which takes the event object as argument.
 * @param opt_capture In DOM-compliant browsers, this determines whether the listener is fired
 *          during the capture or bubble phase of the event.
 */
- (id<GDCRegistration>)addEventListener:(NSString *)type handler:(void (^)(id))handler opt_capture:(BOOL)opt_capture;

@end