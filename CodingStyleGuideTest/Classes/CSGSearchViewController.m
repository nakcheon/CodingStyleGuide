//
//  CSGSearchViewController.m
//  CodingStyleGuideTest
//
//  Created by JungNakCheon on 1/6/15.
//  Copyright (c) 2015 NakCheon Jung. All rights reserved.
//

#import "CSGSearchViewController.h"


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

@interface CSGSearchViewController()
@end

@interface CSGSearchViewController(CreateMethods)
@end

@interface CSGSearchViewController(PrivateMethods)
-(BOOL)privateInitializeSetting;
-(BOOL)privateInitializeUI;
@end

@interface CSGSearchViewController(PrivateServerCommunications)
@end  

@interface CSGSearchViewController(selectors)
@end

@interface CSGSearchViewController(IBActions)
@end

@interface CSGSearchViewController(ProcessMethod)
@end


/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation CSGSearchViewController

#pragma mark - class life cycle

-(id)init
{
    self = [super init];
    if (self) {
        NSLog(@"CSGSearchViewController::INIT");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)prepareForRelease
{
    
}

-(void)dealloc
{
    NSLog(@"CSGSearchViewController::DEALLOC");
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
