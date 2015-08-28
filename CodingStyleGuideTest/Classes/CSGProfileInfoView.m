//
//  CSGProfileInfoView.m
//  CodingStyleGuideTest
//
//  Created by NakCheonJung on 1/12/15.
//  Copyright (c) 2015 NakCheon Jung. All rights reserved.
//

#import "CSGProfileInfoView.h"

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

@interface CSGProfileInfoView()
@end

@interface CSGProfileInfoView(CreateMethods)
@end

@interface CSGProfileInfoView(PrivateMethods)
-(BOOL)privateInitializeSetting;
-(BOOL)privateInitializeUI;
@end

@interface CSGProfileInfoView(PrivateServerCommunications)
@end

@interface CSGProfileInfoView(selectors)
@end

@interface CSGProfileInfoView(IBActions)
@end

@interface CSGProfileInfoView(ProcessMethod)
@end


/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation CSGProfileInfoView


#pragma mark - class life cycle

-(id)init
{
    self = [super init];
    if (self) {
        NSLog(@"CSGProfileInfoView::INIT");
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(void)prepareForRelease
{
    
}

-(void)dealloc
{
    NSLog(@"CSGProfileInfoView::DEALLOC");
}

//#pragma mark - SYSTEM
//
//-(BOOL)prefersStatusBarHidden
//{
//    return NO;
//}
//
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown;
//}
//
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - operations

-(void)initialize
{
    [self privateInitializeSetting];
    [self privateInitializeUI];
}

//-(BOOL)hasFullScreenView
//{
//    return NO;
//}

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
