//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/solve/blocks/NumberBlock.java
//
//  Created by Thomas on 7/10/13.
//

@class TuxkidsTuxblocksCoreSolveExpressionNumber;

#import "JreEmulation.h"
#import "tuxkids/tuxblocks/core/solve/blocks/BaseBlock.h"

@interface TuxkidsTuxblocksCoreSolveBlocksNumberBlock : TuxkidsTuxblocksCoreSolveBlocksBaseBlock {
 @public
  TuxkidsTuxblocksCoreSolveExpressionNumber *number_;
}

@property (nonatomic, strong) TuxkidsTuxblocksCoreSolveExpressionNumber *number;

- (id)initWithTuxkidsTuxblocksCoreSolveExpressionNumber:(TuxkidsTuxblocksCoreSolveExpressionNumber *)number;
- (BOOL)canSimplify;
- (int)getColor;
- (NSString *)getText;
- (void)setValueWithInt:(int)value;
@end
