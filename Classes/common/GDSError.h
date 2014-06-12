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
//  GDSError.h
//  GDStore
//
//  Created by Larry Tin.
//

#import <Foundation/Foundation.h>
#import "GDSErrorType.h"

/**
 * An error affecting the realtime document.
 */
@protocol GDSError <NSObject>

/* Whether the error is fatal. Fatal errors cannot be recovered from and require the document to be reloaded. */
- (BOOL)isFatal;

/* A message describing the error. */
- (NSString *)message;

/* The type of the error that occurred. */
- (GDSErrorType)type;

@end