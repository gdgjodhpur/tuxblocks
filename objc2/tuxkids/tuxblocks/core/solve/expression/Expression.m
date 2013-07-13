//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/solve/expression/Expression.java
//
//  Created by Thomas on 7/10/13.
//

#import "playn/core/Canvas.h"
#import "playn/core/TextFormat.h"
#import "playn/core/TextLayout.h"
#import "pythagoras/f/Vector.h"
#import "tuxkids/tuxblocks/core/solve/expression/Expression.h"
#import "tuxkids/tuxblocks/core/solve/expression/ExpressionWriter.h"
#import "tuxkids/tuxblocks/core/solve/expression/Minus.h"
#import "tuxkids/tuxblocks/core/solve/expression/Over.h"
#import "tuxkids/tuxblocks/core/solve/expression/Plus.h"
#import "tuxkids/tuxblocks/core/solve/expression/Times.h"
#import "tuxkids/tuxblocks/core/utils/HashCode.h"

@implementation TuxkidsTuxblocksCoreSolveExpressionExpression

+ (int)PREC_ADD {
  return TuxkidsTuxblocksCoreSolveExpressionExpression_PREC_ADD;
}

+ (int)PREC_MULT {
  return TuxkidsTuxblocksCoreSolveExpressionExpression_PREC_MULT;
}

+ (int)PREC_NUM {
  return TuxkidsTuxblocksCoreSolveExpressionExpression_PREC_NUM;
}

- (NSString *)toMathString {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (BOOL)hasVariable {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (int)evaluate {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (TuxkidsTuxblocksCoreSolveExpressionExpression *)getSimplified {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (int)getPrecedence {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
  return 0;
}

- (TuxkidsTuxblocksCoreSolveExpressionExpression *)plusWithInt:(int)value {
  return [[TuxkidsTuxblocksCoreSolveExpressionPlus alloc] initWithTuxkidsTuxblocksCoreSolveExpressionExpression:self withInt:value];
}

- (TuxkidsTuxblocksCoreSolveExpressionExpression *)minusWithInt:(int)value {
  return [[TuxkidsTuxblocksCoreSolveExpressionMinus alloc] initWithTuxkidsTuxblocksCoreSolveExpressionExpression:self withInt:value];
}

- (TuxkidsTuxblocksCoreSolveExpressionExpression *)timesWithInt:(int)value {
  return [[TuxkidsTuxblocksCoreSolveExpressionTimes alloc] initWithTuxkidsTuxblocksCoreSolveExpressionExpression:self withInt:value];
}

- (TuxkidsTuxblocksCoreSolveExpressionExpression *)overWithInt:(int)value {
  return [[TuxkidsTuxblocksCoreSolveExpressionOver alloc] initWithTuxkidsTuxblocksCoreSolveExpressionExpression:self withInt:value];
}

- (TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *)getExpressionWriterWithPlaynCoreTextFormat:(PlaynCoreTextFormat *)textFormat {
  NSString *mathString = [self toMathString];
  return [[TuxkidsTuxblocksCoreSolveExpressionExpression_$1 alloc] initWithPlaynCoreTextFormat:textFormat withNSString:mathString];
}

- (NSString *)description {
  return [self toMathString];
}

- (void)addFieldsWithTuxkidsTuxblocksCoreUtilsHashCode:(TuxkidsTuxblocksCoreUtilsHashCode *)param0 {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (id)init {
  return [super init];
}

@end
@implementation TuxkidsTuxblocksCoreSolveExpressionExpression_$1

@synthesize layout = layout_;
@synthesize val$mathString = val$mathString_;

- (void)drawExpressionWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
                                  withInt:(int)childColor {
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) fillTextWithPlaynCoreTextLayout:layout_ withFloat:0 withFloat:0];
}

- (PythagorasFVector *)formatExpressionWithPlaynCoreTextFormat:(PlaynCoreTextFormat *)textFormat {
  layout_ = [self layoutWithNSString:val$mathString_ withPlaynCoreTextFormat:textFormat];
  return [[PythagorasFVector alloc] initWithFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout_)) width] withFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(layout_)) height]];
}

- (id)initWithPlaynCoreTextFormat:(PlaynCoreTextFormat *)arg$0
                     withNSString:(NSString *)capture$0 {
  if ((self = [super initWithPlaynCoreTextFormat:arg$0])) {
    val$mathString_ = capture$0;
  }
  return self;
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreSolveExpressionExpression_$1 *typedCopy = (TuxkidsTuxblocksCoreSolveExpressionExpression_$1 *) copy;
  typedCopy.layout = layout_;
  typedCopy.val$mathString = val$mathString_;
}

@end