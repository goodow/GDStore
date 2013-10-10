//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ElementalJsonImplJsonVisitor_H_
#define _ElementalJsonImplJsonVisitor_H_

@protocol GDRJsonArray;
@protocol GDRJsonObject;
@protocol GDRJsonValue;

#import "JreEmulation.h"
#include "elemental/json/impl/JsonContext.h"

@interface ElementalJsonImplJsonVisitor : NSObject {
}

- (void)acceptWithGDRJsonValue:(id<GDRJsonValue>)node;
- (void)acceptWithGDRJsonValue:(id<GDRJsonValue>)node
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)endVisitWithGDRJsonArray:(id<GDRJsonArray>)array
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)endVisitWithGDRJsonObject:(id<GDRJsonObject>)object
 withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)visitWithDouble:(double)number
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)visitWithNSString:(NSString *)string
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)visitWithBoolean:(BOOL)bool_
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (BOOL)visitWithGDRJsonArray:(id<GDRJsonArray>)array
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (BOOL)visitWithGDRJsonObject:(id<GDRJsonObject>)object
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (BOOL)visitIndexWithInt:(int)index
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (BOOL)visitKeyWithNSString:(NSString *)key
withElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (void)visitNullWithElementalJsonImplJsonContext:(ElementalJsonImplJsonContext *)ctx;
- (id)init;
@end

@interface ElementalJsonImplJsonVisitor_ImmutableJsonContext : ElementalJsonImplJsonContext {
}

- (id)initWithElementalJsonImplJsonVisitor:(ElementalJsonImplJsonVisitor *)outer$
                          withGDRJsonValue:(id<GDRJsonValue>)node;
- (void)removeMe;
- (void)replaceMeWithDouble:(double)d;
- (void)replaceMeWithNSString:(NSString *)d;
- (void)replaceMeWithBoolean:(BOOL)d;
- (void)replaceMeWithGDRJsonValue:(id<GDRJsonValue>)value;
- (void)immutableError;
@end

#endif // _ElementalJsonImplJsonVisitor_H_