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
//  GDSEventType.h
//  GDStore
//
//  Created by Larry Tin.
//

/**
 * Events fired by the document or collaborative objects.
 */
typedef enum {
  /* A new collaborator joined the document. Listen on the GDSDocument for these changes. */
  GDS_COLLABORATOR_JOINED           = 0,

  /* A collaborator left the document. Listen on the GDSDocument for these changes. */
  GDS_COLLABORATOR_LEFT             = 1,

  /* The document save state changed. Listen on the GDSDocument for these changes. */
  GDS_DOCUMENT_SAVE_STATE_CHANGED   = 2,

  /* A collaborative object has changed. This event wraps a specific event, and bubbles to ancestors. */
  GDS_OBJECT_CHANGED                = 3,

  /* An index reference changed. */
  GDS_REFERENCE_SHIFTED             = 4,

  /* Text has been removed from a string. */
  GDS_TEXT_DELETED                  = 5,

  /* Text has been inserted into a string. */
  GDS_TEXT_INSERTED                 = 6,

  /* New values have been added to the list. */
  GDS_VALUES_ADDED                  = 7,

  /* Values have been removed from the list. */
  GDS_VALUES_REMOVED                = 8,

  /* Values in a list are changed in place. */
  GDS_VALUES_SET                    = 9,

  /* A map or custom object value has changed. Note this could be a new value or deleted value. */
  GDS_VALUE_CHANGED                 = 10,

  GDS_UNDO_REDO_STATE_CHANGED       = 11,

} GDSEventType;