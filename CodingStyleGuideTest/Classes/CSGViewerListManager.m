//
//  CSGViewerListManager.m
//  CodingStyleGuideTest
//
//  Created by Earth on 2014. 7. 28..
//  Copyright (c) 2014년 NakCheon Jung. All rights reserved.
//

#import "CSGViewerListManager.h"

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
#define CONTENT_LIST_FILE_URL @"http://112.217.225.194/content_ios_msps20.xml"  // 미디어스토리 서버

/******************************************************************************
 * Function Definition
 *****************************************************************************/


/******************************************************************************
 * Type Definition
 *****************************************************************************/

@interface CSGViewerListManager()
// 여기에 private 변수 선언, , prefix는 "_"
@end

@interface CSGViewerListManager(CreateMethods)
// 여기에 create/init 관련 함수 선언, prefix는 "create"
@end

@interface CSGViewerListManager(PrivateMethods)
// 여기에 private 함수 선언, prefix는 "private"
-(BOOL)privateDoParseResults:(NSData*)data;
@end

@interface CSGViewerListManager(PrivateServerCommunications)
// 여기에 private 함수 선언, prefix는 "private"
@end

@interface CSGViewerListManager(selectors)
// 여기에 @selector() 안에 들어가는 함수 선언, prefix는 "selector"
@end

@interface CSGViewerListManager(IBActions)
// IBACtion methods
// 여기에 xib와 연결되는 IBAction 함수 선언, prefix는 "selector"
@end

@interface CSGViewerListManager(ProcessMethod)
// processing methods
// 여기에 메인 기능을 수행하는 processing 함수 선언, prefix는 "process"
@end



/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation CSGViewerListManager

#pragma mark - class life cycle
// 이 안에 init, initWithNibName, initWithFrame, drawRect, viewDidLoad, didReceiveMemoryWarning, initWithCoder, dealloc 등 클래스 라이프 사이클과 관련된 함수 들을 이안에 넣는다.


#pragma mark - operations
// 헤더파일에 선언된 함수 구현 - 외부 노출 되는 부분임

-(BOOL)getData
{
    NSData* iniData = [NSData dataWithContentsOfURL:[NSURL URLWithString:CONTENT_LIST_FILE_URL]];
    
    // 컨텐츠 있음
    if (iniData) {
        [self privateDoParseResults:iniData];
    }
    // 컨텐츠 리스트 없음
    else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", @"")
                                                        message:NSLocalizedString(@"ContentError", @"")
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"Confirm", @"")
                                              otherButtonTitles:nil];
        [alert show];
        
        return NO;
    }

    return YES;
}

#pragma mark - create methods
// CreateMethods 카테고리 안에 선언된 함수들을 이 안에 넣는다.


#pragma mark - process methods
// ProcessMethod 카테고리 안에 선언된 함수들을 이 안에 넣는다.


#pragma mark - private methods
// PrivateMethods 카테고리 안에 선언된 함수들을 이 안에 넣는다.

-(BOOL)privateDoParseResults:(NSData*)data
{
    // parsing
    //NSError* error = nil;
    NSDictionary* infoDic = nil;
    //NSDictionary* infoDic = [MSPS20XMLReader dictionaryForXMLData:data
    //                                                      options:XMLReaderOptionsProcessNamespaces
    //                                                        error:&error];
    
    // save
    NSString* strCachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* strPath = [NSString stringWithFormat:@"%@/%@.%@", strCachePath, [[CONTENT_LIST_FILE_URL lastPathComponent] stringByDeletingPathExtension], @"plist"];
    [infoDic writeToFile:strPath atomically:YES];
    
    // filtering
    NSArray* groups = [infoDic valueForKeyPath:@"data.group"];
    NSMutableArray* filteredGroups = [[NSMutableArray alloc] init];
    NSMutableArray* filteredUrlListItems = [[NSMutableArray alloc] init];
    _numberOfSections = (int)[groups count];
    
    for (NSDictionary* item in groups) {
        // 아이템이 여러개이면 NSArray로 받아온다.
        if ([[item objectForKey:@"item"] isKindOfClass:[NSArray class]]) {
            NSArray* groupItems = [item objectForKey:@"item"];
            if ([groupItems count] <= 0) {
                continue;
            }
            
            // 리스트 삽입
            NSMutableArray* filteredSubItems = [[NSMutableArray alloc] init];
            for (NSDictionary* itemURLInfo in groupItems) {
                [filteredSubItems addObject:itemURLInfo];
            }
            [filteredUrlListItems addObject:filteredSubItems];
        }
        
        // 아이템이 한개이면 NSDictionary로 받아온다.
        else if ([[item objectForKey:@"item"] isKindOfClass:[NSDictionary class]]) {
            NSDictionary* groupItems = [item objectForKey:@"item"];
            NSMutableArray* filteredSubItems = [[NSMutableArray alloc] init];
            [filteredSubItems addObject:groupItems];
            [filteredUrlListItems addObject:filteredSubItems];
        }
        
        // 그룹정보 삽입
        NSMutableDictionary* dicItemToInsert = [[NSMutableDictionary alloc] init];
        [dicItemToInsert setObject:[item objectForKey:@"id"] forKey:@"id"];
        [dicItemToInsert setObject:[item objectForKey:@"name"] forKey:@"name"];
        [filteredGroups addObject:dicItemToInsert];
    }
    _arrayGroupInfo = [NSArray arrayWithArray:filteredGroups];
    _arrayUrlListInfo = [NSArray arrayWithArray:filteredUrlListItems];
    
    return YES;
}


#pragma mark - selectors
// selectors 카테고리 안에 선언된 함수들을 이 안에 넣는다.


#pragma mark - IBActions
// IBActions 카테고리 안에 선언된 함수들을 이 안에 넣는다.


#pragma mark - <Protocol1로 선언된 Delegate의 full name>
// 해당 클래스가 사용하는 protocol1의 함수들을 이 안에 넣는다. 이 함수들은 카테고리로 따로 선언하지 않는다.


#pragma mark - <Protocol2로 선언된 Delegate의 full name>
// 해당 클래스가 사용하는 protocol2의 함수들을 이 안에 넣는다. 이 함수들은 카테고리로 따로 선언하지 않는다.
// 이런형태로 반복해서 프로토콜을 구현하는 함수를 넣는다.

@end
