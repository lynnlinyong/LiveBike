//
//  CLog.h
//  Financialplanner
//
//  Created by jsetc on 12-8-31.
//  Copyright 2012年 seed. All rights reserved.
//

#define DEBUG_PREFIX   @"LiveBike Debug"

#ifdef DEBUG
#define DebugLog(fmat, ...) NSLog((DEBUG_PREFIX fmat), ##__VA_ARGS__);
#else
#define DebugLog(fmat, ...)
#endif