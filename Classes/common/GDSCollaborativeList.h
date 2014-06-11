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
//  GDSCollaborativeList.h
//  GDStore
//
//  Created by Larry Tin.
//

#import "GDSCollaborativeObject.h"

@protocol GDSIndexReference;
@protocol GDCRegistration;
@protocol GDSValuesAddedEvent;
@protocol GDSValuesRemovedEvent;
@protocol GDSValuesSetEvent;

/**
 * A collaborative list. A list can contain other Realtime collaborative objects, custom
 * collaborative objects, primitive values, or objects that can be serialized to JSON.
 * <p>
 * Changes to the list will automatically be synced with the server and other collaborators. To
 * listen for changes, add EventListeners for the following event types:
 * <ul>
 * <li>{@link GDSEventType#VALUES_ADDED}
 * <li>{@link GDSEventType#VALUES_REMOVED}
 * <li>{@link GDSEventType#VALUES_SET}
 * </ul>
 * <p>
 * This class should not be instantiated directly. To create a new list, use
 * {@link GDSModel#createList:(NSArray)}.
 */
@protocol GDSCollaborativeList <GDSCollaborativeObject>

- (id<GDCRegistration>)onValuesAdded:(void (^)(id<GDSValuesAddedEvent>))handler;

- (id<GDCRegistration>)onValuesRemoved:(void (^)(id<GDSValuesRemovedEvent>))handler;

- (id<GDCRegistration>)onValuesSet:(void (^)(id<GDSValuesSetEvent>))handler;

/**
 * Returns a copy of the contents of this collaborative list as a Json array. Changes to the returned
 * object will not affect the original collaborative list.
 *
 * @return A copy of the contents of this collaborative list.
 */
- (NSArray *)asArray;

/* Removes all values from the list. */
- (void)clear;

/**
 * Gets the value at the given index.
 *
 * @param index The index.
 * @return The value at the given index.
 */
- (id)get:(int)index;

/**
 * Returns the first index of the given value, or -1 if it cannot be found.
 *
 * @param value The value to find.
 * @param opt_comparator Optional comparator function used to determine the equality of two items.
 * @return The index of the given value, or -1 if it cannot be found.
 */
- (int)indexOf:(id)value opt_comparator:(NSComparator)opt_comparator;

/**
 * Inserts an item into the list at a given index.
 *
 * @param index The index to insert at.
 * @param value The value to add.
 */
- (void)insert:(int)index value:(id)value;

/**
 * Inserts a list of items into the list at a given index.
 *
 * @param index The index at which to insert.
 * @param values The values to insert.
 */
- (void)insertAll:(int)index values:(NSArray *)values;

/**
 * Returns the last index of the given value, or -1 if it cannot be found.
 *
 * @param value The value to find.
 * @param opt_comparator Optional comparator function used to determine the equality of two items.
 * @return The index of the given value, or -1 if it cannot be found.
 */
- (int)lastIndexOf:(id)value opt_comparator:(NSComparator)opt_comparator;

/**
 * Adds an item to the end of the list.
 *
 * @param value The value to add.
 * @return The new array length.
 */
- (void)push:(id)value;

/**
 * Adds an array of values to the end of the list.
 *
 * @param values The values to add.
 */
- (void)pushAll:(NSArray *)values;

/**
 * Creates an GDSIndexReference at the given index. If canBeDeleted is true, then a delete over the
 * index will delete the reference. Otherwise the reference will shift to the beginning of the
 * deleted range.
 *
 * @param index The index of the reference.
 * @param canBeDeleted Whether this index is deleted when there is a delete of a range covering
 *          this index.
 * @return The newly registered reference.
 */
- (id<GDSIndexReference>)registerReference:(int)index canBeDeleted:(BOOL)canBeDeleted;

/**
 * Removes the item at the given index from the list.
 *
 * @param index The index of the item to remove.
 */
- (void)remove:(int)index;

/**
 * Removes the items between startIndex (inclusive) and endIndex (exclusive).
 *
 * @param startIndex The start index of the range to remove (inclusive).
 * @param endIndex The end index of the range to remove (exclusive).
 */
- (void)removeRange:(int)startIndex endIndex:(int)endIndex;

/**
 * Removes the first instance of the given value from the list.
 *
 * @param value The value to remove.
 * @return Whether the item was removed.
 */
- (BOOL)removeValue:(id)value;

/**
 * Replaces items in the list with the given items, starting at the given index.
 *
 * @param index The index to set at.
 * @param values The values to insert.
 */
- (void)replaceRange:(int)index values:(NSArray *)values;

/**
 * Sets the item at the given index
 *
 * @param index The index to insert at.
 * @param value The value to set.
 */
- (void)set:(int)index value:(id)value;

/**
 * @return The number of entries in the list. Assign to this field to reduce the size of the list.
 *         Note that the length given must be < or equal to the current size. The length of a list
 *         cannot be extended in this way.
 */
- (int)length;

/**
 * @see #length()
 * @param length the new length of the array
 */
- (void)setLength:(int)length;

@end