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
//  GDSCollaborator.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>

/**
 * A collaborator on the document.
 */
@protocol GDSCollaborator <NSObject>

/* The color associated with the collaborator. */
- (NSString *)color;

/* The display name of the collaborator. */
- (NSString *)displayName;

/* True if the collaborator is anonymous, false otherwise. */
- (BOOL)isAnonymous;

/* True if the collaborator is the local user, false otherwise. */
- (BOOL)isMe;

/* A url that points to the profile photo of the user. */
- (NSString *)photoUrl;

/* The sessionId of the collaborator. */
- (NSString *)sessionId;

/* The userId of the collaborator. */
- (NSString *)userId;

@end