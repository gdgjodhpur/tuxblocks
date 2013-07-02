//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/d/AbstractRoundRectangle.java
//
//  Created by Thomas on 7/1/13.
//

#import "IOSDoubleArray.h"
#import "IOSIntArray.h"
#import "IOSObjectArray.h"
#import "IRectangularShape.h"
#import "IRoundRectangle.h"
#import "PathIterator.h"
#import "RectangularShape.h"
#import "RoundRectangle.h"
#import "Transform.h"
#import "java/lang/Math.h"
#import "java/util/NoSuchElementException.h"
#import "AbstractRoundRectangle.h"

@implementation PythagorasDAbstractRoundRectangle

static IOSIntArray * PythagorasDAbstractRoundRectangle_TYPES_;
static double PythagorasDAbstractRoundRectangle_U_;
static IOSObjectArray * PythagorasDAbstractRoundRectangle_POINTS_;

+ (IOSIntArray *)TYPES {
  return PythagorasDAbstractRoundRectangle_TYPES_;
}

+ (double)U {
  return PythagorasDAbstractRoundRectangle_U_;
}

+ (IOSObjectArray *)POINTS {
  return PythagorasDAbstractRoundRectangle_POINTS_;
}

- (PythagorasDRoundRectangle *)clone {
  return [[[PythagorasDRoundRectangle alloc] initWithDouble:[self x] withDouble:[self y] withDouble:[self width] withDouble:[self height] withDouble:[self arcWidth] withDouble:[self arcHeight]] autorelease];
}

- (BOOL)containsWithDouble:(double)px
                withDouble:(double)py {
  if ([self isEmpty]) return NO;
  double rx1 = [self x], ry1 = [self y];
  double rx2 = rx1 + [self width], ry2 = ry1 + [self height];
  if (px < rx1 || px >= rx2 || py < ry1 || py >= ry2) {
    return NO;
  }
  double aw = [self arcWidth] / 2.0f, ah = [self arcHeight] / 2.0f;
  double cx, cy;
  if (px < rx1 + aw) {
    cx = rx1 + aw;
  }
  else if (px > rx2 - aw) {
    cx = rx2 - aw;
  }
  else {
    return YES;
  }
  if (py < ry1 + ah) {
    cy = ry1 + ah;
  }
  else if (py > ry2 - ah) {
    cy = ry2 - ah;
  }
  else {
    return YES;
  }
  px = (px - cx) / aw;
  py = (py - cy) / ah;
  return px * px + py * py <= 1.0f;
}

- (BOOL)containsWithDouble:(double)rx
                withDouble:(double)ry
                withDouble:(double)rw
                withDouble:(double)rh {
  if ([self isEmpty] || rw <= 0.0f || rh <= 0.0f) return NO;
  double rx1 = rx, ry1 = ry, rx2 = rx + rw, ry2 = ry + rh;
  return [self containsWithDouble:rx1 withDouble:ry1] && [self containsWithDouble:rx2 withDouble:ry1] && [self containsWithDouble:rx2 withDouble:ry2] && [self containsWithDouble:rx1 withDouble:ry2];
}

- (BOOL)intersectsWithDouble:(double)rx
                  withDouble:(double)ry
                  withDouble:(double)rw
                  withDouble:(double)rh {
  if ([self isEmpty] || rw <= 0.0f || rh <= 0.0f) return NO;
  double x1 = [self x], y1 = [self y], x2 = x1 + [self width], y2 = y1 + [self height];
  double rx1 = rx, ry1 = ry, rx2 = rx + rw, ry2 = ry + rh;
  if (rx2 < x1 || x2 < rx1 || ry2 < y1 || y2 < ry1) {
    return NO;
  }
  double cx = (x1 + x2) / 2.0f, cy = (y1 + y2) / 2.0f;
  double nx = cx < rx1 ? rx1 : (cx > rx2 ? rx2 : cx);
  double ny = cy < ry1 ? ry1 : (cy > ry2 ? ry2 : cy);
  return [self containsWithDouble:nx withDouble:ny];
}

- (id<PythagorasDPathIterator>)pathIteratorWithPythagorasDTransform:(id<PythagorasDTransform>)at {
  return [[[PythagorasDAbstractRoundRectangle_Iterator alloc] initWithPythagorasDIRoundRectangle:self withPythagorasDTransform:at] autorelease];
}

- (double)arcHeight {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (double)arcWidth {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (double)height {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (double)width {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (double)x {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (double)y {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [PythagorasDAbstractRoundRectangle class]) {
    JreOperatorRetainedAssign(&PythagorasDAbstractRoundRectangle_TYPES_, self, [IOSIntArray arrayWithInts:(int[]){ PythagorasDPathIterator_SEG_MOVETO, PythagorasDPathIterator_SEG_LINETO, PythagorasDPathIterator_SEG_CUBICTO, PythagorasDPathIterator_SEG_LINETO, PythagorasDPathIterator_SEG_CUBICTO, PythagorasDPathIterator_SEG_LINETO, PythagorasDPathIterator_SEG_CUBICTO, PythagorasDPathIterator_SEG_LINETO, PythagorasDPathIterator_SEG_CUBICTO } count:9]);
    PythagorasDAbstractRoundRectangle_U_ = 0.5f - 2.0f / 3.0f * ([JavaLangMath sqrtWithDouble:2.0f] - 1.0f);
    JreOperatorRetainedAssign(&PythagorasDAbstractRoundRectangle_POINTS_, self, [IOSObjectArray arrayWithObjects:(id[]){ [IOSDoubleArray arrayWithDoubles:(double[]){ 0.0f, 0.5f, 0.0f, 0.0f } count:4], [IOSDoubleArray arrayWithDoubles:(double[]){ 1.0f, -0.5f, 0.0f, 0.0f } count:4], [IOSDoubleArray arrayWithDoubles:(double[]){ 1.0f, -PythagorasDAbstractRoundRectangle_U_, 0.0f, 0.0f, 1.0f, 0.0f, 0.0f, PythagorasDAbstractRoundRectangle_U_, 1.0f, 0.0f, 0.0f, 0.5f } count:12], [IOSDoubleArray arrayWithDoubles:(double[]){ 1.0f, 0.0f, 1.0f, -0.5f } count:4], [IOSDoubleArray arrayWithDoubles:(double[]){ 1.0f, 0.0f, 1.0f, -PythagorasDAbstractRoundRectangle_U_, 1.0f, -PythagorasDAbstractRoundRectangle_U_, 1.0f, 0.0f, 1.0f, -0.5f, 1.0f, 0.0f } count:12], [IOSDoubleArray arrayWithDoubles:(double[]){ 0.0f, 0.5f, 1.0f, 0.0f } count:4], [IOSDoubleArray arrayWithDoubles:(double[]){ 0.0f, PythagorasDAbstractRoundRectangle_U_, 1.0f, 0.0f, 0.0f, 0.0f, 1.0f, -PythagorasDAbstractRoundRectangle_U_, 0.0f, 0.0f, 1.0f, -0.5f } count:12], [IOSDoubleArray arrayWithDoubles:(double[]){ 0.0f, 0.0f, 0.0f, 0.5f } count:4], [IOSDoubleArray arrayWithDoubles:(double[]){ 0.0f, 0.0f, 0.0f, PythagorasDAbstractRoundRectangle_U_, 0.0f, PythagorasDAbstractRoundRectangle_U_, 0.0f, 0.0f, 0.0f, 0.5f, 0.0f, 0.0f } count:12] } count:9 type:[IOSClass classWithClass:[IOSDoubleArray class]]]);
  }
}

- (id)copyWithZone:(NSZone *)zone {
  return [[self clone] retain];
}

- (void)dealloc {
  [super dealloc];
}

@end
@implementation PythagorasDAbstractRoundRectangle_Iterator

@synthesize x = x_;
@synthesize y = y_;
@synthesize width = width_;
@synthesize height = height_;
@synthesize aw = aw_;
@synthesize ah = ah_;
- (id<PythagorasDTransform>)t {
  return t_;
}
- (void)setT:(id<PythagorasDTransform>)t {
  JreOperatorRetainedAssign(&t_, self, t);
}
@synthesize t = t_;
@synthesize index = index_;

- (id)initWithPythagorasDIRoundRectangle:(id<PythagorasDIRoundRectangle>)rr
                withPythagorasDTransform:(id<PythagorasDTransform>)at {
  if ((self = [super init])) {
    self.x = [((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) x];
    self.y = [((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) y];
    self.width = [((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) width];
    self.height = [((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) height];
    self.aw = [JavaLangMath minWithDouble:width_ withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) arcWidth]];
    self.ah = [JavaLangMath minWithDouble:height_ withDouble:[((id<PythagorasDIRoundRectangle>) NIL_CHK(rr)) arcHeight]];
    self.t = at;
    if (width_ < 0.0f || height_ < 0.0f || aw_ < 0.0f || ah_ < 0.0f) {
      index_ = (int) [((IOSObjectArray *) NIL_CHK([PythagorasDAbstractRoundRectangle POINTS])) count];
    }
  }
  return self;
}

- (int)windingRule {
  return PythagorasDPathIterator_WIND_NON_ZERO;
}

- (BOOL)isDone {
  return index_ > (int) [((IOSObjectArray *) NIL_CHK([PythagorasDAbstractRoundRectangle POINTS])) count];
}

- (void)next {
  index_++;
}

- (int)currentSegmentWithJavaLangDoubleArray:(IOSDoubleArray *)coords {
  if ([self isDone]) {
    @throw [[[JavaUtilNoSuchElementException alloc] initWithNSString:@"Iterator out of bounds"] autorelease];
  }
  if (index_ == (int) [((IOSObjectArray *) NIL_CHK([PythagorasDAbstractRoundRectangle POINTS])) count]) {
    return PythagorasDPathIterator_SEG_CLOSE;
  }
  int j = 0;
  IOSDoubleArray *p = ((IOSDoubleArray *) [((IOSObjectArray *) NIL_CHK([PythagorasDAbstractRoundRectangle POINTS])) objectAtIndex:index_]);
  for (int i = 0; i < (int) [((IOSDoubleArray *) NIL_CHK(p)) count]; i += 4) {
    [((IOSDoubleArray *) NIL_CHK(coords)) replaceDoubleAtIndex:j++ withDouble:x_ + [((IOSDoubleArray *) NIL_CHK(p)) doubleAtIndex:i + 0] * width_ + [((IOSDoubleArray *) NIL_CHK(p)) doubleAtIndex:i + 1] * aw_];
    [((IOSDoubleArray *) NIL_CHK(coords)) replaceDoubleAtIndex:j++ withDouble:y_ + [((IOSDoubleArray *) NIL_CHK(p)) doubleAtIndex:i + 2] * height_ + [((IOSDoubleArray *) NIL_CHK(p)) doubleAtIndex:i + 3] * ah_];
  }
  if (t_ != nil) {
    [t_ transformWithJavaLangDoubleArray:coords withInt:0 withJavaLangDoubleArray:coords withInt:0 withInt:j / 2];
  }
  return [((IOSIntArray *) NIL_CHK([PythagorasDAbstractRoundRectangle TYPES])) intAtIndex:index_];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&t_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasDAbstractRoundRectangle_Iterator *typedCopy = (PythagorasDAbstractRoundRectangle_Iterator *) copy;
  typedCopy.x = x_;
  typedCopy.y = y_;
  typedCopy.width = width_;
  typedCopy.height = height_;
  typedCopy.aw = aw_;
  typedCopy.ah = ah_;
  typedCopy.t = t_;
  typedCopy.index = index_;
}

@end
