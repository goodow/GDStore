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
//  GDSCollaborativeObject.h
//  GDStore
//
//  Created by Larry Tin.
//

#import "GDSEventTarget.h"

@protocol GDCRegistration;
@protocol GDSObjectChangedEvent;

/**
 * GDSCollaborativeObject contains behavior common to all built in collaborative types. This class
 * should not be instantiated directly. Use the create* methods on
 * {@link GDSModel} to create specific types of collaborative objects.
 */
@protocol GDSCollaborativeObject <GDSEventTarget>

- (id<GDCRegistration>)onObjectChanged:(void (^)(id<GDSObjectChangedEvent>))handler;

/**
 * Returns a string representation of this collaborative object.
 *
 * @return A string representation.
 */
- (NSString *)description;

/* The ID of the collaborative object. Readonly. */
- (NSString *)id;

- (id)toJson;

@end