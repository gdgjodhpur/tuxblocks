//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/Points.java
//
//  Created by Thomas on 7/1/13.
//

#import "IPoint.h"
#import "MathUtil.h"
#import "Point.h"
#import "java/lang/Math.h"
#import "Points.h"

@implementation PythagorasDPoints

static id<PythagorasDIPoint> PythagorasDPoints_ZERO_;

+ (id<PythagorasDIPoint>)ZERO {
  return PythagorasDPoints_ZERO_;
}

+ (double)distanceSqWithDouble:(double)x1
                    withDouble:(double)y1
                    withDouble:(double)x2
                    withDouble:(double)y2 {
  x2 -= x1;
  y2 -= y1;
  return x2 * x2 + y2 * y2;
}

+ (double)distanceWithDouble:(double)x1
                  withDouble:(double)y1
                  withDouble:(double)x2
                  withDouble:(double)y2 {
  return [JavaLangMath sqrtWithDouble:[PythagorasDPoints distanceSqWithDouble:x1 withDouble:y1 withDouble:x2 withDouble:y2]];
}

+ (BOOL)epsilonEqualsWithPythagorasDIPoint:(id<PythagorasDIPoint>)p1
                     withPythagorasDIPoint:(id<PythagorasDIPoint>)p2 {
  return [PythagorasDPoints epsilonEqualsWithPythagorasDIPoint:p1 withPythagorasDIPoint:p2 withDouble:PythagorasDMathUtil_EPSILON];
}

+ (BOOL)epsilonEqualsWithPythagorasDIPoint:(id<PythagorasDIPoint>)p1
                     withPythagorasDIPoint:(id<PythagorasDIPoint>)p2
                                withDouble:(double)epsilon {
  return [JavaLangMath absWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p1)) x] - [((id<PythagorasDIPoint>) NIL_CHK(p2)) x]] < epsilon && [JavaLangMath absWithDouble:[((id<PythagorasDIPoint>) NIL_CHK(p1)) y] - [((id<PythagorasDIPoint>) NIL_CHK(p2)) y]] < epsilon;
}

+ (PythagorasDPoint *)transformWithDouble:(double)x
                               withDouble:(double)y
                               withDouble:(double)sx
                               withDouble:(double)sy
                               withDouble:(double)rotation
                               withDouble:(double)tx
                               withDouble:(double)ty
                     withPythagorasDPoint:(PythagorasDPoint *)result {
  return [PythagorasDPoints transformWithDouble:x withDouble:y withDouble:sx withDouble:sy withDouble:[JavaLangMath sinWithDouble:rotation] withDouble:[JavaLangMath cosWithDouble:rotation] withDouble:tx withDouble:ty withPythagorasDPoint:result];
}

+ (PythagorasDPoint *)transformWithDouble:(double)x
                               withDouble:(double)y
                               withDouble:(double)sx
                               withDouble:(double)sy
                               withDouble:(double)sina
                               withDouble:(double)cosa
                               withDouble:(double)tx
                               withDouble:(double)ty
                     withPythagorasDPoint:(PythagorasDPoint *)result {
  return [((PythagorasDPoint *) NIL_CHK(result)) setWithDouble:(x * cosa - y * sina) * sx + tx withDouble:(x * sina + y * cosa) * sy + ty];
}

+ (PythagorasDPoint *)inverseTransformWithDouble:(double)x
                                      withDouble:(double)y
                                      withDouble:(double)sx
                                      withDouble:(double)sy
                                      withDouble:(double)rotation
                                      withDouble:(double)tx
                                      withDouble:(double)ty
                            withPythagorasDPoint:(PythagorasDPoint *)result {
  x -= tx;
  y -= ty;
  double sinnega = [JavaLangMath sinWithDouble:-rotation], cosnega = [JavaLangMath cosWithDouble:-rotation];
  double nx = (x * cosnega - y * sinnega);
  double ny = (x * sinnega + y * cosnega);
  return [((PythagorasDPoint *) NIL_CHK(result)) setWithDouble:nx / sx withDouble:ny / sy];
}

+ (NSString *)pointToStringWithDouble:(double)x
                           withDouble:(double)y {
  return [NSString stringWithFormat:@"%@%@", [PythagorasDMathUtil toStringWithDouble:x], [PythagorasDMathUtil toStringWithDouble:y]];
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [PythagorasDPoints class]) {
    JreOperatorRetainedAssign(&PythagorasDPoints_ZERO_, self, [[[PythagorasDPoint alloc] initWithDouble:0.0f withDouble:0.0f] autorelease]);
  }
}

- (void)dealloc {
  [super dealloc];
}

@end
