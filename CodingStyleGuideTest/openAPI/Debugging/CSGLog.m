//
//  CSGLog.m
//
//  Created by Earth on 2014. 6. 12..
//  Copyright (c) 2014년 NakCheon Jung. All rights reserved.
//

#import "CSGLog.h"

void CSGLog(NSString* format, ...)
{
	//if (MSPS_LOG_DISABLE) return;
    
	va_list args;
	va_start(args, format);
	NSLogv(format, args);
	va_end(args);
}


void CSGPrint(NSString* format, ...)
{
    //if (MSPS_LOG_DISABLE) return;
    
	va_list args;
    va_start(args, format);
    
    fputs([[[NSString alloc] initWithFormat:format arguments:args] UTF8String], stdout);
    
    va_end(args);
}