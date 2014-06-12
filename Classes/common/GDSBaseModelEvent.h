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
//  GDSBaseModelEvent.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>
#import "GDSEventType.h"

/* A base class for model events. */
@protocol GDSBaseModelEvent

/* Whether this event bubbles. */
- (BOOL)bubbles;

/* Whether this event originated in the local session. */
- (BOOL)isLocal;

/* The ID of the session that initiated the event. */
- (NSString *)sessionId;

/* The user ID of the user that initiated the event. */
- (NSString *)userId;

/* Event type. */
- (GDSEventType)type;

@end