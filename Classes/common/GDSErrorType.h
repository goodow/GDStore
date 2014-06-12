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
//  GDSErrorType.h
//  GDStore
//
//  Created by Larry Tin.
//

/**
 * Errors that can occur while loading or collaborating on a document.
 */
typedef enum {
  /* An internal error occurred in the Realtime API client. */
  GDS_CLIENT_ERROR                    = 0,

  /**
   * Another user created the document's initial state after GDSStore.load was called but
   * before the local creation was saved.
   */
  GDS_CONCURRENT_CREATION             = 1,

  /**
   * The user associated with the provided OAuth token is not authorized to access the provided
   * document ID.
   */
  GDS_FORBIDDEN                       = 2,

  /**
   * A compound operation was still open at the end of a synchronous block. Compound operations must
   * always be ended in the same synchronous block that they are started.
   */
  GDS_INVALID_COMPOUND_OPERATION      = 3,

  /* The provided document ID could not be found. */
  GDS_NOT_FOUND                       = 4,

  /* An internal error occurred in the Realtime API server. */
  GDS_SERVER_ERROR                    = 5,

  /* The provided OAuth token is no longer valid and must be refreshed. */
  GDS_TOKEN_REFRESH_REQUIRED          = 6,

} GDSErrorType;