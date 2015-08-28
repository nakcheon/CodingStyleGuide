//
//  CSGViewerListManager.h
//  CodingStyleGuideTest
//
//  Created by Earth on 2014. 7. 28..
//  Copyright (c) 2014년 NakCheon Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSGViewerListManager : NSObject

@property (nonatomic, assign) int numberOfSections;
@property (nonatomic, retain) NSArray* arrayGroupInfo;
@property (nonatomic, retain) NSArray* arrayUrlListInfo;

-(BOOL)getData;

@end
