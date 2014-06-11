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
//  GDSDocument.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>

@protocol GDCRegistration;
@protocol GDSCollaboratorLeftEvent;
@protocol GDSCollaboratorJoinedEvent;
@protocol GDSDocumentSaveStateChangedEvent;
@protocol GDSModel;

/**
 * A Realtime document. A document consists of a Realtime model and a set of collaborators. Listen
 * on the document for the following events:
 * <ul>
 * <li>{@link GDSEventType#COLLABORATOR_LEFT}
 * <li>{@link GDSEventType#COLLABORATOR_JOINED}
 * <li>{@link GDSEventType#DOCUMENT_SAVE_STATE_CHANGED}
 * </ul>
 * <p>
 * This class should not be instantiated directly. The document object is generated during the
 * document load process.
 */
@protocol GDSDocument

- (id<GDCRegistration>)onCollaboratorJoined:(void (^)(id<GDSCollaboratorJoinedEvent>))handler;

- (id<GDCRegistration>)onCollaboratorLeft:(void (^)(id<GDSCollaboratorLeftEvent>))handler;

- (id<GDCRegistration>)onDocumentSaveStateChanged:(void (^)(id<GDSDocumentSaveStateChangedEvent>))handler;

/**
 * Closes the document and disconnects from the server. After this function is called, event
 * listeners will no longer fire and attempts to access the document, model, or model objects will
 * throw a {@link GDSDocumentClosedError}. Calling this function after the
 * document has been closed will have no effect.
 *
 * @throws com.goodow.realtime.store.DocumentClosedError
 */
- (void)close;

/**
 * Gets an array of collaborators active in this session. Each collaborator has these properties:
 * sessionId, userId, displayName, color, isMe, isAnonymous, photoUrl.
 *
 * @return An array of collaborators.
 */
- (NSArray *)getCollaborators;

/**
 * Gets the collaborative model associated with this document.
 *
 * @return The collaborative model for this document.
 */
- (id<GDSModel>)getModel;

@end