//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: tripleplay/anim/Log.java
//
//  Created by Thomas on 7/1/13.
//

#import "Logger.h"

@implementation TripleplayAnimLog

static TripleplayUtilLogger * TripleplayAnimLog_log_;

+ (TripleplayUtilLogger *)log {
  return TripleplayAnimLog_log_;
}

- (id)init {
  return [super init];
}

+ (void)initialize {
  if (self == [TripleplayAnimLog class]) {
    JreOperatorRetainedAssign(&TripleplayAnimLog_log_, self, [[[TripleplayUtilLogger alloc] initWithNSString:@"tpanim"] autorelease]);
  }
}

- (void)dealloc {
  [super dealloc];
}

@end