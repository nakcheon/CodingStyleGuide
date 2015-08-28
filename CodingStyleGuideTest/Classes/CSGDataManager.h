//
//  CSGDataManager.h
//  CodingStyleGuideTest
//
//  Created by JungNakCheon on 5/22/15.
//  Copyright (c) 2015 NakCheon Jung. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TravalloonWatchDataManagerDelegate <NSObject>
@end

@interface CSGDataManager : NSObject

-(void)initialize;
-(void)prepareForRelease;

@end
