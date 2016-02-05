//
//  CSGDataManager.m
//  CodingStyleGuideTest
//
//  Created by JungNakCheon on 5/22/15.
//  Copyright (c) 2015 NakCheon Jung. All rights reserved.
//

#import "CSGDataManager.h"

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

@interface CSGDataManager()
@end

@interface CSGDataManager(CreateMethods)
@end

@interface CSGDataManager(PrivateMethods)
-(BOOL)privateInitializeSetting;
-(BOOL)privateInitializeUI;
@end

@interface CSGDataManager(PrivateServerCommunications)
@end

@interface CSGDataManager(selectors)
@end

@interface CSGDataManager(IBActions)
@end

@interface CSGDataManager(ProcessMethod)
@end


/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation CSGDataManager

#pragma mark - class life cycle

-(id)init
{
    self = [super init];
    if (self) {
        NSLog(@"CSGDataManager::INIT");
    }
    return self;
}

-(void)prepareForRelease
{
    
}

-(void)dealloc
{
    NSLog(@"CSGDataManager::DEALLOC");
}

#pragma mark - operations

-(void)initialize
{
    [self privateInitializeSetting];
    [self privateInitializeUI];
}

#pragma mark - private methods

-(BOOL)privateInitializeSetting
{
    return YES;
}

-(BOOL)privateInitializeUI
{
    return YES;
}

@end
