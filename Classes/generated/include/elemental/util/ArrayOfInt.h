//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#ifndef _ElementalUtilArrayOfInt_H_
#define _ElementalUtilArrayOfInt_H_

@protocol ElementalUtilCanCompareInt;

#import "JreEmulation.h"

@protocol ElementalUtilArrayOfInt < NSObject, JavaObject >
- (id<ElementalUtilArrayOfInt>)concatWithElementalUtilArrayOfInt:(id<ElementalUtilArrayOfInt>)values;
- (BOOL)containsWithInt:(int)value;
- (int)getWithInt:(int)index;
- (int)indexOfWithInt:(int)value;
- (void)insertWithInt:(int)index
              withInt:(int)value;
- (BOOL)isEmpty;
- (BOOL)isSetWithInt:(int)index;
- (NSString *)join;
- (NSString *)joinWithNSString:(NSString *)separator;
- (int)length;
- (int)peek;
- (int)pop;
- (void)pushWithInt:(int)value;
- (void)removeWithInt:(int)value;
- (void)removeByIndexWithInt:(int)index;
- (void)setWithInt:(int)index
           withInt:(int)value;
- (void)setLengthWithInt:(int)length;
- (int)shift;
- (void)sort;
- (void)sortWithElementalUtilCanCompareInt:(id<ElementalUtilCanCompareInt>)comparator;
- (id<ElementalUtilArrayOfInt>)spliceWithInt:(int)index
                                     withInt:(int)count;
- (void)unshiftWithInt:(int)value;
@end

#endif // _ElementalUtilArrayOfInt_H_