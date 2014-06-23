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
//  GDSStore.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>

@protocol GDCBus;
@protocol GDSDocument;
@protocol GDSModel;
@protocol GDSError;

/**
 * The Goodow Realtime Store API.
 */
@protocol GDSStore

- (void)close;

- (id<GDCBus>)getBus;

/**
 * Loads the realtime data model associated with {@code docId}. If no realtime data model is
 * associated with {@code docId}, a new realtime document will be created and
 * {@code opt_initializer} will be called (if it is provided).
 *
 * @param id The ID of the document to load.
 * @param onLoaded A callback that will be called when the realtime document is ready. The created
 *          or opened realtime document object will be passed to this function.
 * @param opt_initializer An optional initialization function that will be called before
 *          {@code onLoaded} only the first time that the document is loaded. The document's
 *          {@link GDSModel} object will be passed to this function.
 * @param opt_error An optional error handling function that will be called if an error occurs
 *          while the document is being loaded or edited. A
 *          {@link GDSError} object describing the error will be passed to
 *          this function.
 */
- (void)          load:(NSString *)id
              onLoaded:(void (^)(id<GDSDocument>))onLoaded
       opt_initializer:(void (^)(id<GDSModel>))opt_initializer
             opt_error:(void (^)(id<GDSError>))opt_error;

@end