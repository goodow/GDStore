//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//
//  Created by Larry Tin <dev@goodow.com>
//

#include "IOSCharArray.h"
#include "com/goodow/realtime/operation/id/IdGenerator.h"
#include "java/lang/StringBuilder.h"
#include "java/util/Random.h"

@implementation ComGoodowRealtimeOperationIdIdGenerator

static IOSCharArray * ComGoodowRealtimeOperationIdIdGenerator_ALPHABET_;
static IOSCharArray * ComGoodowRealtimeOperationIdIdGenerator_NUMBERS_;

+ (IOSCharArray *)ALPHABET {
  return ComGoodowRealtimeOperationIdIdGenerator_ALPHABET_;
}

+ (IOSCharArray *)NUMBERS {
  return ComGoodowRealtimeOperationIdIdGenerator_NUMBERS_;
}

- (id)init {
  return [self initComGoodowRealtimeOperationIdIdGeneratorWithJavaUtilRandom:[[JavaUtilRandom alloc] init]];
}

- (id)initComGoodowRealtimeOperationIdIdGeneratorWithJavaUtilRandom:(JavaUtilRandom *)random {
  if (self = [super init]) {
    self->random_ = random;
  }
  return self;
}

- (id)initWithJavaUtilRandom:(JavaUtilRandom *)random {
  return [self initComGoodowRealtimeOperationIdIdGeneratorWithJavaUtilRandom:random];
}

- (NSString *)nextWithInt:(int)length {
  JavaLangStringBuilder *result = [[JavaLangStringBuilder alloc] initWithInt:length];
  for (int i = 0; i < length; i++) {
    (void) [result appendWithChar:IOSCharArray_Get(nil_chk(ComGoodowRealtimeOperationIdIdGenerator_ALPHABET_), [((JavaUtilRandom *) nil_chk(random_)) nextIntWithInt:36])];
  }
  return [result description];
}

- (NSString *)nextNumbersWithInt:(int)length {
  JavaLangStringBuilder *result = [[JavaLangStringBuilder alloc] initWithInt:length];
  for (int i = 0; i < length; i++) {
    (void) [result appendWithChar:IOSCharArray_Get(nil_chk(ComGoodowRealtimeOperationIdIdGenerator_NUMBERS_), [((JavaUtilRandom *) nil_chk(random_)) nextIntWithInt:10])];
  }
  return [result description];
}

+ (void)initialize {
  if (self == [ComGoodowRealtimeOperationIdIdGenerator class]) {
    ComGoodowRealtimeOperationIdIdGenerator_ALPHABET_ = [@"abcdefghijklmnopqrstuvwxyz0123456789" toCharArray];
    ComGoodowRealtimeOperationIdIdGenerator_NUMBERS_ = [@"0123456789" toCharArray];
  }
}

- (void)copyAllFieldsTo:(ComGoodowRealtimeOperationIdIdGenerator *)other {
  [super copyAllFieldsTo:other];
  other->random_ = random_;
}

@end