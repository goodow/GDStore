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
//  GDSModel.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>

@protocol GDCRegistration;
@protocol GDSUndoRedoStateChangedEvent;
@protocol GDSCollaborativeList;
@protocol GDSCollaborativeMap;
@protocol GDSCollaborativeString;

/**
 * The collaborative model is the data model for a Realtime document. The document's object graph
 * should be added to the model under the root object. All objects that are part of the model must
 * be accessible from this root.
 * <p>
 * The model class is also used to create instances of built in and custom collaborative objects via
 * the appropriate create method.
 * <p>
 * Listen on the model for the following events:
 * <ul>
 * <li>{@link GDSEventType#UNDO_REDO_STATE_CHANGED}
 * </ul>
 * <p>
 * This class should not be instantiated directly. The collaborative model is generated during the
 * document load process. The model can be initialized by passing an initializer function to
 * {@link GDSStore#load:(NSString)
 *             onLoaded:(void (^)(id<GDSDocument>))
 *      opt_initializer:(void (^)(id<GDSModel>))
 *            opt_error:(void (^)(id<GDSError>))}.
 */
@protocol GDSModel

- (id<GDCRegistration>)onUndoRedoStateChanged:(void (^)(id<GDSUndoRedoStateChangedEvent>))handler;

/**
 * Creates a collaborative list.
 *
 * @param opt_initialValue Initial value for the list.
 * @return A collaborative list.
 */
- (id<GDSCollaborativeList>)createList:(NSArray *)opt_initialValue;

/**
 * Creates a collaborative map.
 *
 * @param opt_initialValue Initial value for the map.
 * @return A collaborative map.
 */
- (id<GDSCollaborativeMap>)createMap:(NSDictionary *)opt_initialValue;

/**
 * Creates a collaborative string.
 *
 * @param opt_initialValue Sets the initial value for this string.
 * @return A collaborative string.
 */
- (id<GDSCollaborativeString>)createString:(NSString *)opt_initialValue;

/**
 * @return The root of the object model.
 */
- (id<GDSCollaborativeMap>)getRoot;

/**
 * Redo the last thing the active collaborator undid.
 */
- (void)redo;

/**
 * Undo the last thing the active collaborator did.
 */
- (void)undo;

/**
 * @return True if the model can currently redo.
 */
- (BOOL)canRedo;

/**
 * @return True if the model can currently undo.
 */
- (BOOL)canUndo;

@end