//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\blocks\NumberBlock.java
//
//  Created by Thomas on 7/1/13.
//

#import "playn/core/Color.h"
#import "playn/core/ImageLayer.h"
#import "tuxkids/tuxblocks/core/solve/blocks/BaseBlock.h"
#import "tuxkids/tuxblocks/core/solve/blocks/Block.h"
#import "tuxkids/tuxblocks/core/solve/blocks/NumberBlock.h"
#import "tuxkids/tuxblocks/core/solve/expression/Number.h"

@implementation TBNumberBlock

- (TBNumber *)number {
  return number_;
}
- (void)setNumber:(TBNumber *)number {
  JreOperatorRetainedAssign(&number_, self, number);
}
@synthesize number = number_;

- (id)initWithTBNumber:(TBNumber *)number {
  if ((self = [super initWithTBExpression:number])) {
    self.number = number;
    JreOperatorRetainedAssign(&layer__, self, [self generateSpriteWithInt:TBBlock_BASE_SIZE withInt:TBBlock_BASE_SIZE withNSString:[NSString stringWithFormat:@"%d", [((TBNumber *) NIL_CHK(number)) getValue]] withInt:[self getColor]]);
  }
  return self;
}

- (BOOL)canSimplify {
  return YES;
}

- (int)getColor {
  return [PlaynCoreColor rgbWithInt:200 withInt:0 withInt:200];
}

- (NSString *)getText {
  return [((TBNumber *) NIL_CHK(number_)) toMathString];
}

- (void)setValueWithInt:(int)value {
  [((TBNumber *) NIL_CHK(number_)) setValueWithInt:value];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&number_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBNumberBlock *typedCopy = (TBNumberBlock *) copy;
  typedCopy.number = number_;
}

@end