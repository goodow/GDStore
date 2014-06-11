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
//  GDSCollaborativeString.h
//  GDStore
//
//  Created by Larry Tin.
//

#import "GDSCollaborativeObject.h"

@protocol GDCRegistration;
@protocol GDSTextDeletedEvent;
@protocol GDSTextInsertedEvent;
@protocol GDSIndexReference;

/**
 * Creates a new collaborative string. Unlike regular strings, collaborative strings are mutable.
 * <p>
 * Changes to the string will automatically be synced with the server and other collaborators. To
 * listen for changes, add EventListeners for the following event types:
 * <ul>
 * <li>{@link GDSEventType#TEXT_INSERTED}
 * <li>{@link GDSEventType#TEXT_DELETED}
 * </ul>
 * <p>
 * This class should not be instantiated directly. To create a new collaborative string, use
 * {@link GDSModel#createString:(NSString)}
 */
@protocol GDSCollaborativeString <GDSCollaborativeObject>

- (id<GDCRegistration>)onTextDeleted:(void (^)(id<GDSTextDeletedEvent>))handler;

- (id<GDCRegistration>)onTextInserted:(void (^)(id<GDSTextInsertedEvent>))handler;

/**
 * Appends a string to the end of this one.
 *
 * @param text The new text to append.
 */
- (void)append:(NSString *)text;

/**
 * Gets a string representation of the collaborative string.
 *
 * @return A string representation of the collaborative string.
 */
- (NSString *)getText;

/**
 * Inserts a string into the collaborative string at a specific index.
 *
 * @param index The index to insert at.
 * @param text The new text to insert.
 */
- (void)insertString:(int)index text:(NSString *)text;

/**
 * Creates a GDSIndexReference at the given {@code index}. If {@code canBeDeleted} is set, then a
 * delete over the index will delete the reference. Otherwise the reference will shift to the
 * beginning of the deleted range.
 *
 * @param index The index of the reference.
 * @param canBeDeleted Whether this index is deleted when there is a delete of a range covering
 *          this index.
 * @return The newly registered reference.
 */
- (id<GDSIndexReference>)registerReference:(int)index canBeDeleted:(BOOL)canBeDeleted;

/**
 * Deletes the text between startIndex (inclusive) and endIndex (exclusive).
 *
 * @param startIndex The start index of the range to delete (inclusive).
 * @param endIndex The end index of the range to delete (exclusive).
 */
- (void)removeRange:(int)startIndex endIndex:(int)endIndex;

/**
 * Sets the contents of this collaborative string. Note that this method performs a text diff
 * between the current string contents and the new contents so that the string will be modified
 * using the minimum number of text inserts and deletes possible to change the current contents to
 * the newly-specified contents.
 *
 * @param text The new value of the string.
 */
- (void)setText:(NSString *)text;

/**
* @return The length of the string. Read only.
*/
- (int)length;

@end