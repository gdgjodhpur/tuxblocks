//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: C:\Users\Thomas\Documents\Eclipse\Tux\tuxblocks\core\src\main\java\tuxkids\tuxblocks\core\solve\expression\Variable.java
//
//  Created by Thomas on 7/1/13.
//

#import "tuxkids/tuxblocks/core/solve/expression/Expression.h"
#import "tuxkids/tuxblocks/core/solve/expression/NonevaluatableException.h"
#import "tuxkids/tuxblocks/core/solve/expression/Variable.h"
#import "tuxkids/tuxblocks/core/utils/HashCode.h"

@implementation TBVariable

- (NSString *)name {
  return name_;
}
- (void)setName:(NSString *)name {
  JreOperatorRetainedAssign(&name_, self, name);
}
@synthesize name = name_;

- (NSString *)getName {
  return name_;
}

- (id)initWithNSString:(NSString *)name {
  if ((self = [super init])) {
    self.name = name;
  }
  return self;
}

- (NSString *)toMathString {
  return name_;
}

- (BOOL)hasVariable {
  return YES;
}

- (int)evaluate {
  @throw [[[TBNonevaluatableException alloc] init] autorelease];
}

- (TBExpression *)getSimplified {
  return self;
}

- (int)getPrecedence {
  return TBExpression_PREC_NUM;
}

- (void)addFieldsWithTBHashCode:(TBHashCode *)hashCode {
  [((TBHashCode *) NIL_CHK(hashCode)) addFieldWithId:name_];
}

- (void)dealloc {
  JreOperatorRetainedAssign(&name_, self, nil);
  [super dealloc];
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TBVariable *typedCopy = (TBVariable *) copy;
  typedCopy.name = name_;
}

@end