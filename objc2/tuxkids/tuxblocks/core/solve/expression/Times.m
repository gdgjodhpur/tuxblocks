//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/solve/expression/Times.java
//
//  Created by Thomas on 7/10/13.
//

#import "IOSObjectArray.h"
#import "java/lang/Integer.h"
#import "playn/core/Canvas.h"
#import "playn/core/Color.h"
#import "playn/core/Font.h"
#import "playn/core/Graphics.h"
#import "playn/core/PlayN.h"
#import "playn/core/TextFormat.h"
#import "playn/core/TextLayout.h"
#import "pythagoras/f/Vector.h"
#import "tuxkids/tuxblocks/core/solve/expression/Expression.h"
#import "tuxkids/tuxblocks/core/solve/expression/ExpressionWriter.h"
#import "tuxkids/tuxblocks/core/solve/expression/ModificationOperation.h"
#import "tuxkids/tuxblocks/core/solve/expression/Over.h"
#import "tuxkids/tuxblocks/core/solve/expression/Times.h"
#import "tuxkids/tuxblocks/core/utils/Formatter.h"

@implementation TuxkidsTuxblocksCoreSolveExpressionTimes

- (id)initWithTuxkidsTuxblocksCoreSolveExpressionExpression:(TuxkidsTuxblocksCoreSolveExpressionExpression *)base
                                                    withInt:(int)value {
  return [super initWithTuxkidsTuxblocksCoreSolveExpressionExpression:base withInt:value];
}

- (NSString *)toMathString {
  if ([((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) getPrecedence] < [self getPrecedence]) {
    return [TuxkidsTuxblocksCoreUtilsFormatter formatWithNSString:@"%d(%s)" withNSObjectArray:[IOSObjectArray arrayWithType:[IOSClass classWithClass:[NSObject class]] count:2, [JavaLangInteger valueOfWithInt:value_], [((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) toMathString] ]];
  }
  else {
    return [TuxkidsTuxblocksCoreUtilsFormatter formatWithNSString:@"%s %s %d" withNSObjectArray:[IOSObjectArray arrayWithType:[IOSClass classWithClass:[NSObject class]] count:3, [((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) toMathString], [self getSymbol], [JavaLangInteger valueOfWithInt:value_] ]];
  }
}

- (int)evaluate {
  return value_ * [((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) evaluate];
}

- (int)getPrecedence {
  return TuxkidsTuxblocksCoreSolveExpressionExpression_PREC_MULT;
}

- (NSString *)getSymbol {
  return @"*";
}

- (BOOL)isCommutative {
  return YES;
}

- (int)getColor {
  return [PlaynCoreColor rgbWithInt:255 withInt:211 withInt:0];
}

- (TuxkidsTuxblocksCoreSolveExpressionModificationOperation *)getInverse {
  return [[TuxkidsTuxblocksCoreSolveExpressionOver alloc] initWithTuxkidsTuxblocksCoreSolveExpressionExpression:operand_ withInt:value_];
}

- (TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *)getExpressionWriterWithPlaynCoreTextFormat:(PlaynCoreTextFormat *)textFormat {
  if ([((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) getPrecedence] >= [self getPrecedence]) return (TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *) [super getExpressionWriterWithPlaynCoreTextFormat:textFormat];
  TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *childWriter = [((TuxkidsTuxblocksCoreSolveExpressionExpression *) NIL_CHK(operand_)) getExpressionWriterWithPlaynCoreTextFormat:textFormat];
  return [[TuxkidsTuxblocksCoreSolveExpressionTimes_$1 alloc] initWithTuxkidsTuxblocksCoreSolveExpressionTimes:self withPlaynCoreTextFormat:textFormat withTuxkidsTuxblocksCoreSolveExpressionExpressionWriter:childWriter];
}

@end
@implementation TuxkidsTuxblocksCoreSolveExpressionTimes_$1

@synthesize this$0 = this$0_;
@synthesize leftParenLayout = leftParenLayout_;
@synthesize rightParenLayout = rightParenLayout_;
@synthesize factorLayout = factorLayout_;
@synthesize val$childWriter = val$childWriter_;

- (PythagorasFVector *)formatExpressionWithPlaynCoreTextFormat:(PlaynCoreTextFormat *)textFormat {
  id<PlaynCoreFont> font = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) createFontWithNSString:[((id<PlaynCoreFont>) NIL_CHK(textFormat.font)) name] withPlaynCoreFont_StyleEnum:[((id<PlaynCoreFont>) NIL_CHK(textFormat.font)) style] withFloat:[((TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *) NIL_CHK(val$childWriter_)) height] * 1.0f];
  PlaynCoreTextFormat *bigFormat = [((PlaynCoreTextFormat *) [[PlaynCoreTextFormat alloc] init]) withFontWithPlaynCoreFont:font];
  leftParenLayout_ = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) layoutTextWithNSString:@"(" withPlaynCoreTextFormat:bigFormat];
  rightParenLayout_ = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) layoutTextWithNSString:@")" withPlaynCoreTextFormat:bigFormat];
  factorLayout_ = [((id<PlaynCoreGraphics>) [PlaynCorePlayN graphics]) layoutTextWithNSString:[NSString stringWithFormat:@"%d", this$0_.value] withPlaynCoreTextFormat:textFormat];
  return [[PythagorasFVector alloc] initWithFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(factorLayout_)) width] + [((id<PlaynCoreTextLayout>) NIL_CHK(leftParenLayout_)) width] + [((TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *) NIL_CHK(val$childWriter_)) width] + [((id<PlaynCoreTextLayout>) NIL_CHK(rightParenLayout_)) width] + TuxkidsTuxblocksCoreSolveExpressionExpressionWriter_SPACING * 2 withFloat:[((TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *) NIL_CHK(val$childWriter_)) height]];
}

- (void)drawExpressionWithPlaynCoreCanvas:(id<PlaynCoreCanvas>)canvas
                                  withInt:(int)childColor {
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) save];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) translateWithFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(leftParenLayout_)) width] + [((id<PlaynCoreTextLayout>) NIL_CHK(factorLayout_)) width] + TuxkidsTuxblocksCoreSolveExpressionExpressionWriter_SPACING withFloat:0];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) setFillColorWithInt:childColor];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) setStrokeColorWithInt:childColor];
  [((TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *) NIL_CHK(val$childWriter_)) drawExpressionWithPlaynCoreCanvas:canvas withInt:childColor];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) restore];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) fillTextWithPlaynCoreTextLayout:factorLayout_ withFloat:0 withFloat:([self height] - [((id<PlaynCoreTextLayout>) NIL_CHK(factorLayout_)) height]) / 2];
  float ph = [((id<PlaynCoreTextLayout>) NIL_CHK(leftParenLayout_)) height];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) fillTextWithPlaynCoreTextLayout:leftParenLayout_ withFloat:[((id<PlaynCoreTextLayout>) NIL_CHK(factorLayout_)) width] withFloat:([self height] - ph) / 2];
  (void) [((id<PlaynCoreCanvas>) NIL_CHK(canvas)) fillTextWithPlaynCoreTextLayout:rightParenLayout_ withFloat:[self width] - [((id<PlaynCoreTextLayout>) NIL_CHK(rightParenLayout_)) width] withFloat:([self height] - ph) / 2];
}

- (id)initWithTuxkidsTuxblocksCoreSolveExpressionTimes:(TuxkidsTuxblocksCoreSolveExpressionTimes *)outer$
                               withPlaynCoreTextFormat:(PlaynCoreTextFormat *)arg$0
withTuxkidsTuxblocksCoreSolveExpressionExpressionWriter:(TuxkidsTuxblocksCoreSolveExpressionExpressionWriter *)capture$0 {
  if ((self = [super initWithPlaynCoreTextFormat:arg$0])) {
    this$0_ = outer$;
    val$childWriter_ = capture$0;
  }
  return self;
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreSolveExpressionTimes_$1 *typedCopy = (TuxkidsTuxblocksCoreSolveExpressionTimes_$1 *) copy;
  typedCopy.this$0 = this$0_;
  typedCopy.leftParenLayout = leftParenLayout_;
  typedCopy.rightParenLayout = rightParenLayout_;
  typedCopy.factorLayout = factorLayout_;
  typedCopy.val$childWriter = val$childWriter_;
}

@end
