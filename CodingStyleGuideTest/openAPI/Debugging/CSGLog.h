//
//  CSGLog.h
//
//  Created by Earth on 2014. 6. 12..
//  Copyright (c) 2014년 NakCheon Jung. All rights reserved.
//

#ifdef __OBJC__ // work for error: unknown type nsstring xcode

#ifndef MSPS_LOG_H
#define MSPS_LOG_H

extern void CSGLog(NSString* format, ...);
extern void CSGPrint(NSString* format, ...);

#endif

#endif // __OBJC__