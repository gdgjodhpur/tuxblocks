//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/utils/HashCode.java
//
//  Created by Thomas on 7/10/13.
//

@protocol TuxkidsTuxblocksCoreUtilsHashCode_Hashable;

#import "JreEmulation.h"

#define TuxkidsTuxblocksCoreUtilsHashCode_prime 31

@interface TuxkidsTuxblocksCoreUtilsHashCode : NSObject {
 @public
  int result_;
  id<TuxkidsTuxblocksCoreUtilsHashCode_Hashable> hashable_;
  BOOL inHash_;
  BOOL inLeftEquals_;
  BOOL inRightEquals_;
  id lastObject_;
  int lastInt_;
  long long int lastLong_;
  short int lastShort_;
  double lastDouble_;
  float lastFloat_;
  char lastByte_;
  unichar lastChar_;
  BOOL lastBoolean_;
  BOOL equalSoFar_;
  int fieldIndex_;
  TuxkidsTuxblocksCoreUtilsHashCode *compareTo_;
  int desiredFieldIndex_;
}

@property (nonatomic, assign) int result;
@property (nonatomic, strong) id<TuxkidsTuxblocksCoreUtilsHashCode_Hashable> hashable;
@property (nonatomic, assign) BOOL inHash;
@property (nonatomic, assign) BOOL inLeftEquals;
@property (nonatomic, assign) BOOL inRightEquals;
@property (nonatomic, strong) id lastObject;
@property (nonatomic, assign) int lastInt;
@property (nonatomic, assign) long long int lastLong;
@property (nonatomic, assign) short int lastShort;
@property (nonatomic, assign) double lastDouble;
@property (nonatomic, assign) float lastFloat;
@property (nonatomic, assign) char lastByte;
@property (nonatomic, assign) unichar lastChar;
@property (nonatomic, assign) BOOL lastBoolean;
@property (nonatomic, assign) BOOL equalSoFar;
@property (nonatomic, assign) int fieldIndex;
@property (nonatomic, strong) TuxkidsTuxblocksCoreUtilsHashCode *compareTo;
@property (nonatomic, assign) int desiredFieldIndex;

- (id)initWithTuxkidsTuxblocksCoreUtilsHashCode_Hashable:(id<TuxkidsTuxblocksCoreUtilsHashCode_Hashable>)hashable;
- (NSUInteger)hash;
- (void)addHashWithId:(id)o;
- (void)addHashWithInt:(int)i;
- (void)addHashWithLongInt:(long long int)l;
- (void)addHashWithShortInt:(short int)s;
- (void)addHashWithFloat:(float)f;
- (void)addHashWithDouble:(double)d;
- (void)addHashWithChar:(char)b;
- (void)addHashWithUnichar:(unichar)c;
- (void)addHashWithBOOL:(BOOL)b;
- (void)addLeftEqualsWithId:(id)o;
- (void)addLeftEqualsWithInt:(int)i;
- (void)addLeftEqualsWithLongInt:(long long int)l;
- (void)addLeftEqualsWithShortInt:(short int)s;
- (void)addLeftEqualsWithFloat:(float)f;
- (void)addLeftEqualsWithDouble:(double)d;
- (void)addLeftEqualsWithChar:(char)b;
- (void)addLeftEqualsWithUnichar:(unichar)c;
- (void)addLeftEqualsWithBOOL:(BOOL)b;
- (void)addRightEqualsWithId:(id)o;
- (void)addRightEqualsWithInt:(int)i;
- (void)addRightEqualsWithLongInt:(long long int)l;
- (void)addRightEqualsWithShortInt:(short int)s;
- (void)addRightEqualsWithFloat:(float)f;
- (void)addRightEqualsWithDouble:(double)d;
- (void)addRightEqualsWithChar:(char)b;
- (void)addRightEqualsWithUnichar:(unichar)c;
- (void)addRightEqualsWithBOOL:(BOOL)b;
- (void)addFieldWithId:(id)o;
- (void)addFieldWithInt:(int)i;
- (void)addFieldWithLongInt:(long long int)l;
- (void)addFieldWithShortInt:(short int)s;
- (void)addFieldWithFloat:(float)f;
- (void)addFieldWithDouble:(double)d;
- (void)addFieldWithChar:(char)b;
- (void)addFieldWithUnichar:(unichar)c;
- (void)addFieldWithBOOL:(BOOL)b;
- (void)populateFieldWithInt:(int)index;
- (BOOL)equalsWithTuxkidsTuxblocksCoreUtilsHashCode:(TuxkidsTuxblocksCoreUtilsHashCode *)hash_;
@end

@protocol TuxkidsTuxblocksCoreUtilsHashCode_Hashable < NSObject >
- (void)addFieldsWithTuxkidsTuxblocksCoreUtilsHashCode:(TuxkidsTuxblocksCoreUtilsHashCode *)hashCode;
@end