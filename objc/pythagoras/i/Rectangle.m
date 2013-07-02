//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: pythagoras/i/Rectangle.java
//
//  Created by Thomas on 7/1/13.
//

#import "IDimension.h"
#import "IPoint.h"
#import "IRectangle.h"
#import "java/lang/Math.h"
#import "Rectangle.h"

@implementation PythagorasIRectangle

@synthesize x_ = x__;
@synthesize y_ = y__;
@synthesize width_ = width__;
@synthesize height_ = height__;

- (id)init {
  return [super init];
}

- (id)initWithPythagorasIIPoint:(id<PythagorasIIPoint>)p {
  if ((self = [super init])) {
    [self setBoundsWithInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) x] withInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) y] withInt:0 withInt:0];
  }
  return self;
}

- (id)initWithPythagorasIIDimension:(id<PythagorasIIDimension>)d {
  if ((self = [super init])) {
    [self setBoundsWithInt:0 withInt:0 withInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) width] withInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) height]];
  }
  return self;
}

- (id)initWithPythagorasIIPoint:(id<PythagorasIIPoint>)p
      withPythagorasIIDimension:(id<PythagorasIIDimension>)d {
  if ((self = [super init])) {
    [self setBoundsWithInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) x] withInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) y] withInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) width] withInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) height]];
  }
  return self;
}

- (id)initWithInt:(int)x
          withInt:(int)y
          withInt:(int)width
          withInt:(int)height {
  if ((self = [super init])) {
    [self setBoundsWithInt:x withInt:y withInt:width withInt:height];
  }
  return self;
}

- (id)initWithPythagorasIIRectangle:(id<PythagorasIIRectangle>)r {
  if ((self = [super init])) {
    [self setBoundsWithInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) x] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) y] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) width] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) height]];
  }
  return self;
}

- (void)setLocationWithInt:(int)x
                   withInt:(int)y {
  self.x_ = x;
  self.y_ = y;
}

- (void)setLocationWithPythagorasIIPoint:(id<PythagorasIIPoint>)p {
  [self setLocationWithInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) x] withInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) y]];
}

- (void)setSizeWithInt:(int)width
               withInt:(int)height {
  self.width_ = width;
  self.height_ = height;
}

- (void)setSizeWithPythagorasIIDimension:(id<PythagorasIIDimension>)d {
  [self setSizeWithInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) width] withInt:[((id<PythagorasIIDimension>) NIL_CHK(d)) height]];
}

- (void)setBoundsWithInt:(int)x
                 withInt:(int)y
                 withInt:(int)width
                 withInt:(int)height {
  self.x_ = x;
  self.y_ = y;
  self.height_ = height;
  self.width_ = width;
}

- (void)setBoundsWithPythagorasIIRectangle:(id<PythagorasIIRectangle>)r {
  [self setBoundsWithInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) x] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) y] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) width] withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) height]];
}

- (void)growWithInt:(int)dx
            withInt:(int)dy {
  x__ -= dx;
  y__ -= dy;
  width__ += dx + dx;
  height__ += dy + dy;
}

- (void)translateWithInt:(int)mx
                 withInt:(int)my {
  x__ += mx;
  y__ += my;
}

- (void)addWithInt:(int)px
           withInt:(int)py {
  int x1 = [JavaLangMath minWithInt:x__ withInt:px];
  int x2 = [JavaLangMath maxWithInt:x__ + width__ withInt:px];
  int y1 = [JavaLangMath minWithInt:y__ withInt:py];
  int y2 = [JavaLangMath maxWithInt:y__ + height__ withInt:py];
  [self setBoundsWithInt:x1 withInt:y1 withInt:x2 - x1 withInt:y2 - y1];
}

- (void)addWithPythagorasIIPoint:(id<PythagorasIIPoint>)p {
  [self addWithInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) x] withInt:[((id<PythagorasIIPoint>) NIL_CHK(p)) y]];
}

- (void)addWithPythagorasIIRectangle:(id<PythagorasIIRectangle>)r {
  int x1 = [JavaLangMath minWithInt:x__ withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) x]];
  int x2 = [JavaLangMath maxWithInt:x__ + width__ withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) x] + [((id<PythagorasIIRectangle>) NIL_CHK(r)) width]];
  int y1 = [JavaLangMath minWithInt:y__ withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) y]];
  int y2 = [JavaLangMath maxWithInt:y__ + height__ withInt:[((id<PythagorasIIRectangle>) NIL_CHK(r)) y] + [((id<PythagorasIIRectangle>) NIL_CHK(r)) height]];
  [self setBoundsWithInt:x1 withInt:y1 withInt:x2 - x1 withInt:y2 - y1];
}

- (int)x {
  return x__;
}

- (int)y {
  return y__;
}

- (int)width {
  return width__;
}

- (int)height {
  return height__;
}

- (void)dealloc {
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  PythagorasIRectangle *typedCopy = (PythagorasIRectangle *) copy;
  typedCopy.x_ = x__;
  typedCopy.y_ = y__;
  typedCopy.width_ = width__;
  typedCopy.height_ = height__;
}

@end
