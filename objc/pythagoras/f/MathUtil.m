//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/f/MathUtil.java
//
//  Created by Thomas on 7/1/13.
//

#import "FloatMath.h"
#import "java/lang/IllegalArgumentException.h"
#import "java/lang/Integer.h"
#import "java/lang/Math.h"
#import "java/lang/StringBuilder.h"
#import "MathUtil.h"

@implementation PythagorasFMathUtil

static int PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_;

+ (float)EPSILON {
  return PythagorasFMathUtil_EPSILON;
}

+ (float)TAU {
  return PythagorasFMathUtil_TAU;
}

+ (float)TWO_PI {
  return PythagorasFMathUtil_TWO_PI;
}

+ (float)HALF_PI {
  return PythagorasFMathUtil_HALF_PI;
}

+ (int)TO_STRING_DECIMAL_PLACES {
  return PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_;
}

+ (int *)TO_STRING_DECIMAL_PLACESRef {
  return &PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_;
}

+ (int)roundWithFloat:(float)v {
  return (v < 0.0f) ? (int) (v - 0.5f) : (int) (v + 0.5f);
}

+ (int)ifloorWithFloat:(float)v {
  int iv = (int) v;
  return (v >= 0.0f || iv == v || iv == JavaLangInteger_MIN_VALUE) ? iv : (iv - 1);
}

+ (int)iceilWithFloat:(float)v {
  int iv = (int) v;
  return (v <= 0.0f || iv == v || iv == JavaLangInteger_MAX_VALUE) ? iv : (iv + 1);
}

+ (float)clampWithFloat:(float)v
              withFloat:(float)lower
              withFloat:(float)upper {
  if (v < lower) return lower;
  else if (v > upper) return upper;
  else return v;
}

+ (float)roundNearestWithFloat:(float)v
                     withFloat:(float)target {
  target = [JavaLangMath absWithFloat:target];
  if (v >= 0) {
    return target * [PythagorasFFloatMath floorWithFloat:(v + 0.5f * target) / target];
  }
  else {
    return target * [PythagorasFFloatMath ceilWithFloat:(v - 0.5f * target) / target];
  }
}

+ (BOOL)isWithinWithFloat:(float)v
                withFloat:(float)lower
                withFloat:(float)upper {
  return v >= lower && v <= upper;
}

+ (float)normalWithFloat:(float)normal
               withFloat:(float)mean
               withFloat:(float)stddev {
  return stddev * normal + mean;
}

+ (float)exponentialWithFloat:(float)random
                    withFloat:(float)mean {
  return -[PythagorasFFloatMath logWithFloat:1.0f - random] * mean;
}

+ (float)lerpaWithFloat:(float)a1
              withFloat:(float)a2
              withFloat:(float)t {
  float ma1 = [PythagorasFMathUtil mirrorAngleWithFloat:a1], ma2 = [PythagorasFMathUtil mirrorAngleWithFloat:a2];
  float d = [JavaLangMath absWithFloat:a2 - a1], md = [JavaLangMath absWithFloat:ma1 - ma2];
  return (d < md) ? [PythagorasFMathUtil lerpWithFloat:a1 withFloat:a2 withFloat:t] : [PythagorasFMathUtil mirrorAngleWithFloat:[PythagorasFMathUtil lerpWithFloat:ma1 withFloat:ma2 withFloat:t]];
}

+ (float)lerpWithFloat:(float)v1
             withFloat:(float)v2
             withFloat:(float)t {
  return v1 + t * (v2 - v1);
}

+ (BOOL)epsilonEqualsWithFloat:(float)v1
                     withFloat:(float)v2 {
  return [JavaLangMath absWithFloat:v1 - v2] < PythagorasFMathUtil_EPSILON;
}

+ (float)angularDistanceWithFloat:(float)a1
                        withFloat:(float)a2 {
  float ma1 = [PythagorasFMathUtil mirrorAngleWithFloat:a1], ma2 = [PythagorasFMathUtil mirrorAngleWithFloat:a2];
  return [JavaLangMath minWithFloat:[JavaLangMath absWithFloat:a1 - a2] withFloat:[JavaLangMath absWithFloat:ma1 - ma2]];
}

+ (float)angularDifferenceWithFloat:(float)a1
                          withFloat:(float)a2 {
  float ma1 = [PythagorasFMathUtil mirrorAngleWithFloat:a1], ma2 = [PythagorasFMathUtil mirrorAngleWithFloat:a2];
  float diff = a1 - a2, mdiff = ma2 - ma1;
  return ([JavaLangMath absWithFloat:diff] < [JavaLangMath absWithFloat:mdiff]) ? diff : mdiff;
}

+ (float)normalizeAngleWithFloat:(float)a {
  while (a < -PythagorasFFloatMath_PI) {
    a += PythagorasFMathUtil_TWO_PI;
  }
  while (a >= PythagorasFFloatMath_PI) {
    a -= PythagorasFMathUtil_TWO_PI;
  }
  return a;
}

+ (float)normalizeAnglePositiveWithFloat:(float)a {
  while (a < 0.0f) {
    a += PythagorasFMathUtil_TWO_PI;
  }
  while (a >= PythagorasFMathUtil_TWO_PI) {
    a -= PythagorasFMathUtil_TWO_PI;
  }
  return a;
}

+ (float)mirrorAngleWithFloat:(float)a {
  return (a > 0.0f ? PythagorasFFloatMath_PI : -PythagorasFFloatMath_PI) - a;
}

+ (void)setToStringDecimalPlacesWithInt:(int)places {
  if (places < 0) @throw [[[JavaLangIllegalArgumentException alloc] initWithNSString:@"Decimal places must be >= 0."] autorelease];
  PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_ = places;
}

+ (NSString *)toStringWithFloat:(float)value {
  return [PythagorasFMathUtil toStringWithFloat:value withInt:PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_];
}

+ (NSString *)toStringWithFloat:(float)value
                        withInt:(int)decimalPlaces {
  JavaLangStringBuilder *buf = [[[JavaLangStringBuilder alloc] init] autorelease];
  if (value >= 0) (void) [((JavaLangStringBuilder *) NIL_CHK(buf)) appendWithNSString:@"+"];
  else {
    (void) [((JavaLangStringBuilder *) NIL_CHK(buf)) appendWithNSString:@"-"];
    value = -value;
  }
  int ivalue = (int) value;
  (void) [((JavaLangStringBuilder *) NIL_CHK(buf)) appendWithInt:ivalue];
  if (decimalPlaces > 0) {
    (void) [((JavaLangStringBuilder *) NIL_CHK(buf)) appendWithNSString:@"."];
    for (int ii = 0; ii < decimalPlaces; ii++) {
      value = (value - ivalue) * 10;
      ivalue = (int) value;
      (void) [((JavaLangStringBuilder *) NIL_CHK(buf)) appendWithInt:ivalue];
    }
    for (int ii = 0; ii < decimalPlaces - 1; ii++) {
      if ([((JavaLangStringBuilder *) NIL_CHK(buf)) charAtWithInt:[((JavaLangStringBuilder *) NIL_CHK(buf)) sequenceLength] - 1] == '0') {
        [((JavaLangStringBuilder *) NIL_CHK(buf)) setLengthWithInt:[((JavaLangStringBuilder *) NIL_CHK(buf)) sequenceLength] - 1];
      }
    }
  }
  return [((JavaLangStringBuilder *) NIL_CHK(buf)) description];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [PythagorasFMathUtil class]) {
    PythagorasFMathUtil_TO_STRING_DECIMAL_PLACES_ = 3;
  }
}

- (void)dealloc {
  [super dealloc];
}

@end
