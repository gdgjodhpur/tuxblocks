//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/round/Reward.java
//
//  Created by Thomas on 7/10/13.
//

#import "tuxkids/tuxblocks/core/defense/round/Reward.h"
#import "tuxkids/tuxblocks/core/defense/tower/TowerType.h"

@implementation TuxkidsTuxblocksCoreDefenseRoundReward

@synthesize tower = tower_;
@synthesize count = count_;

- (id)initWithTuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum:(TuxkidsTuxblocksCoreDefenseTowerTowerTypeEnum *)tower
                                                    withInt:(int)count {
  if ((self = [super init])) {
    self.tower = tower;
    self.count = count;
  }
  return self;
}

- (void)copyAllPropertiesTo:(id)copy {
  [super copyAllPropertiesTo:copy];
  TuxkidsTuxblocksCoreDefenseRoundReward *typedCopy = (TuxkidsTuxblocksCoreDefenseRoundReward *) copy;
  typedCopy.tower = tower_;
  typedCopy.count = count_;
}

@end
