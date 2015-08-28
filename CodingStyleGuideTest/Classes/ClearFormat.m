//
//  ClearFormat.m
//  CodingStyleGuideTest
//
//  Created by JungNakCheon on 11/20/14.
//  Copyright (c) 2014 NakCheon Jung. All rights reserved.
//

#import "ClearFormat.h"

#pragma mark - enum Definition

/******************************************************************************
 * enum Definition
 *****************************************************************************/


/******************************************************************************
 * String Definition
 *****************************************************************************/


/******************************************************************************
 * Constant Definition
 *****************************************************************************/


/******************************************************************************
 * Function Definition
 *****************************************************************************/


/******************************************************************************
 * Type Definition
 *****************************************************************************/

@interface ClearFormat()
@end

@interface ClearFormat(CreateMethods)
@end

@interface ClearFormat(PrivateMethods)
@end

@interface ClearFormat(PrivateServerCommunications)
@end

@interface ClearFormat(selectors)
@end

@interface ClearFormat(IBActions)
@end

@interface ClearFormat(ProcessMethod)
@end


/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation ClearFormat

#pragma mark - class life cycle

-(id)init
{
    self = [super init];
    if (self) {
        NSLog(@"ClearFormat::INIT");
    }
    return self;
}


-(void)prepareForRelease
{
    
}

-(void)dealloc
{
    NSLog(@"ClearFormat::DEALLOC");
}

#pragma mark - operations

@end



