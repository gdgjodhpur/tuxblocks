//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: core/src/main/java/tuxkids/tuxblocks/core/defense/round/Round.java
//
//  Created by Thomas on 7/10/13.
//

@class TuxkidsTuxblocksCoreDefenseRoundReward;
@class TuxkidsTuxblocksCoreDefenseRoundWave;
@class TuxkidsTuxblocksCoreDefenseWalkerWalker;
@class TuxkidsTuxblocksCoreGameState;
@protocol JavaUtilList;

#import "JreEmulation.h"

@interface TuxkidsTuxblocksCoreDefenseRoundRound : NSObject {
 @public
  id<JavaUtilList> waves_;
  id<JavaUtilList> waitTimes_;
  int timer_;
  TuxkidsTuxblocksCoreDefenseRoundWave *currentWave_;
  int nextDepth__;
  id<JavaUtilList> rewards_;
}

@property (nonatomic, strong) id<JavaUtilList> waves;
@property (nonatomic, strong) id<JavaUtilList> waitTimes;
@property (nonatomic, assign) int timer;
@property (nonatomic, strong) TuxkidsTuxblocksCoreDefenseRoundWave *currentWave;
@property (nonatomic, assign) int nextDepth_;
@property (nonatomic, strong) id<JavaUtilList> rewards;

- (void)populateRound;
- (float)nextDepth;
- (id)init;
- (void)addWaveWithTuxkidsTuxblocksCoreDefenseRoundWave:(TuxkidsTuxblocksCoreDefenseRoundWave *)wave
                                                withInt:(int)waitTime;
- (void)addRewardWithTuxkidsTuxblocksCoreDefenseRoundReward:(TuxkidsTuxblocksCoreDefenseRoundReward *)reward;
- (void)winRoundWithTuxkidsTuxblocksCoreGameState:(TuxkidsTuxblocksCoreGameState *)gameState;
- (TuxkidsTuxblocksCoreDefenseWalkerWalker *)updateWithInt:(int)delta;
- (BOOL)finished;
@end