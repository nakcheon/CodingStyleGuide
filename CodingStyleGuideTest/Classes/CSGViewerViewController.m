//
//  CSGViewerViewController.m
//  CodingStyleGuideTest
//
//  Created by Earth on 2014. 7. 28..
//  Copyright (c) 2014년 NakCheon Jung. All rights reserved.
//

#import "CSGViewerViewController.h"
#import "CSGViewerListManager.h"
#import "UIAlertView+BlockAdditions.h"
#import "CSGLog.h"

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

#define TITLE_FORMAT @""
#define TITLE_FORMAT_PHONE @""

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define INFO @"Copyright(c)2013~4 NakCheon Jung. All rights reserved"

#define UPDATE_CHK_URL @"http://msv.tvnstyle.co.kr:8082/ms_files/msps2/msps2.xml"
#define UPDATE_URL @"http://msv.tvnstyle.co.kr:8082/ms_files/msps2/inHouse.html"

/******************************************************************************
 * Function Definition
 *****************************************************************************/

  
/******************************************************************************
 * Type Definition
 *****************************************************************************/

@interface CSGViewerViewController()
// 여기에 private 변수 선언, , prefix는 "_"
{
    // ui
    UITableView* _tableList;
    //UISearchBar* _searchBar;
    //UISearchDisplayController* _searchResultDisplayController;
    
    // data
    CSGViewerListManager* _listManager;
}
@end

@interface CSGViewerViewController(CreateMethods)
// 여기에 create/init 관련 함수 선언, prefix는 "create"
-(BOOL)createAndInitialize;
-(BOOL)createViewerNavigationBarButtonItems;
-(BOOL)createListViewItems;
@end

@interface CSGViewerViewController(PrivateMethods)
// 여기에 private 함수 선언, prefix는 "private"
-(BOOL)privateLoadViewer:(NSString*)identifier url:(NSString*)url;
-(BOOL)privateCheckNeedToUpdateApp;
@end

@interface CSGViewerViewController(PrivateServerCommunications)
// 여기에 private 함수 선언, prefix는 "private"
@end

@interface CSGViewerViewController(selectors)
// 여기에 @selector() 안에 들어가는 함수 선언, prefix는 "selector"
-(void)selectorRefreshList;
-(void)selectorOpenMSLS;
@end

@interface CSGViewerViewController(IBActions)
// IBACtion methods
// 여기에 xib와 연결되는 IBAction 함수 선언, prefix는 "selector"
@end

@interface CSGViewerViewController(ProcessMethod)
// processing methods
// 여기에 메인 기능을 수행하는 processing 함수 선언, prefix는 "process"
-(BOOL)processLoadViewer:(NSString*)name url:(NSString*)url;
@end



/******************************************************************************************
 * Implementation
 ******************************************************************************************/
@implementation CSGViewerViewController

#pragma mark - class life cyle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self privateCheckNeedToUpdateApp];
    
    [self createAndInitialize];
    
    [self createViewerNavigationBarButtonItems];
    [self createListViewItems];
    
    [_listManager getData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)dealloc
{
    _listManager = nil;
}


#pragma mark - operations
// 헤더파일에 선언된 함수 구현 - 외부 노출 되는 부분임



#pragma mark - create methods
// CreateMethods 카테고리 안에 선언된 함수들을 이 안에 넣는다.

-(BOOL)createAndInitialize
{
    _listManager = [[CSGViewerListManager alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    return YES;
}

-(BOOL)createListViewItems
{
    // ui search bar - FOR server table
    //_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44)];
    
    // list
    _tableList = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                               0/*64 + _searchBar.frame.size.height*/,
                                                               self.view.bounds.size.width,
                                                               self.view.bounds.size.height /*- 64 - _searchBar.frame.size.height*/)
                                              style:UITableViewStylePlain];
    _tableList.delegate = self;
	_tableList.dataSource = self;
	_tableList.backgroundColor = [UIColor clearColor];
    _tableList.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    // ui search bar controller - FOR server table
    //_searchResultDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:_searchBar contentsController:self];
    //_searchResultDisplayController.delegate = self;
    //_searchResultDisplayController.searchResultsDataSource = self;
    //_searchResultDisplayController.searchResultsDelegate = self;
    //_searchResultDisplayController.searchResultsTableView.frame = _tableList.frame;
    //_searchResultDisplayController.searchResultsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    
    //[self.view addSubview:_searchBar];
	[self.view addSubview:_tableList];

    return YES;
}

-(BOOL)createViewerNavigationBarButtonItems
{
    UIBarButtonItem* refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(selectorRefreshList)];
    if ([self.navigationItem respondsToSelector:@selector(leftBarButtonItems)]) {
        self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:refreshButton, nil];
    }
    else {
        self.navigationItem.leftBarButtonItem = refreshButton;
    }
    
    UIBarButtonItem* openMSLSButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(selectorOpenMSLS)];
    if ([self.navigationItem respondsToSelector:@selector(rightBarButtonItems)]) {
        self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:openMSLSButton, nil];
    }
    else {
        self.navigationItem.rightBarButtonItem = openMSLSButton;
    }
    return YES;
}


#pragma mark - process methods
// ProcessMethod 카테고리 안에 선언된 함수들을 이 안에 넣는다.


// 호출 하는 방식 : 초기화 - 시작
-(BOOL)processLoadViewer:(NSString*)name url:(NSString*)url
{
    // 콘텐츠 받았는지 체크
    
    // 초기화 :  url - 파일 주소 / name - 폴더명 ( 추후 url없이도 가능하도록 제작 필요함 )
    
    // 언어 셋팅
    
    // 시작
    
    return YES;
}


#pragma mark - private methods
// PrivateMethods 카테고리 안에 선언된 함수들을 이 안에 넣는다.

-(BOOL)privateLoadViewer:(NSString*)identifier url:(NSString*)url
{
    // 콘텐츠 받았는지 체크
    
    // 초기화 :  url - 파일 주소 / name - 폴더명 ( 추후 url없이도 가능하도록 제작 필요함 )
    
    // 언어 셋팅
    
    // 시작
    
    return YES;
}

-(BOOL)privateCheckNeedToUpdateApp
{
    // 현재 버전
    float curVer = [[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]floatValue];
    
    // 새 버전
    float newVer = 1.0f;
    
    NSData* iniData = [NSData dataWithContentsOfURL:[NSURL URLWithString:UPDATE_CHK_URL]];
    if (iniData) {
        //NSError* error = nil;
        NSDictionary* infoDic = nil;
        //NSDictionary* infoDic = [MSPS20XMLReader dictionaryForXMLData:iniData
        //                                                      options:XMLReaderOptionsProcessNamespaces
        //                                                        error:&error];
        
        newVer = [[[infoDic valueForKeyPath:@"plist.dict.array.dict.dict.string.text"] objectAtIndex:1] floatValue];
        
    }
    else {
        [UIAlertView alertViewWithTitle:NSLocalizedString(@"Error", @"")
                                message:NSLocalizedString(@"Unknown", @"")
                      cancelButtonTitle:NSLocalizedString(@"Confirm", @"")
                      otherButtonTitles:nil
                              onDismiss:^(int buttonIndex) {
                                  // do nothing
                              } onCancel:^{
                                  // do nothing
                              }];
        return NO;
    }
    
    // 비교
    if (newVer > curVer) {
        [UIAlertView alertViewWithTitle:NSLocalizedString(@"Update", @"")
                                message:NSLocalizedString(@"UpdateMsg", @"")
                      cancelButtonTitle:NSLocalizedString(@"Cancel", @"")
                      otherButtonTitles:[NSArray arrayWithObjects:NSLocalizedString(@"Confirm", @""), nil]
                              onDismiss:^(int buttonIndex) {
                                  if (buttonIndex == 0) {
                                      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UPDATE_URL]];
                                  }
                              } onCancel:^{
                                  return;
                              }];
        return YES;
    }
    
    return NO;
}


#pragma mark - selectors
// selectors 카테고리 안에 선언된 함수들을 이 안에 넣는다.

-(void)selectorRefreshList
{
    // 데이터 새로 받아옴
    [_listManager getData];
    
    // 데이터를 뷰에 다시 로딩
    [_tableList reloadData];
}

-(void)selectorOpenMSLS
{
    // do nothing
}

-(void)selectorOpenMSLS:(NSDictionary*)url
{
    // do nothing
}

#pragma mark - IBActions
// IBActions 카테고리 안에 선언된 함수들을 이 안에 넣는다.


#pragma mark - SPSCmdCenterDelegate

-(void)endMSPS:(int)curpage
       maxpage:(int)maxpage
{
    CSGLog(@"end MSPS20::curpage = %d / maxpage = %d",curpage, maxpage);
}

-(void)endMSPSWithLog:(id)logdata
{
    CSGLog(@"end MSPS20::LogData is : %@",[logdata description]);
}

#pragma mark - UISearchDisplayDelegate

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    return NO;
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView
{
}

- (void)searchDisplayController:(UISearchDisplayController *)controller willHideSearchResultsTableView:(UITableView *)tableView
{
}

#pragma mark - UITableView Delegate


-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return [_listManager.arrayGroupInfo count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * headerLabel = nil;
    
    // 검색시
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        // do nothing
    }
    
    // 전체 리스트
    else if (_tableList == tableView ){
        headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,384,22)];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        
        NSDictionary* info = [_listManager.arrayGroupInfo objectAtIndex:section];
        headerLabel.text = [NSString stringWithString:[info objectForKey:@"name"]];
        
    }
    else {
        headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 370, 22)];
        headerLabel.textAlignment = NSTextAlignmentCenter;
        headerLabel.text = @"Category";
        headerLabel.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    }
    
    return headerLabel;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* list = [_listManager.arrayUrlListInfo objectAtIndex:section];
    return [list count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    CSGLog(@"indexPath.section=%d, indexPath.row=%d", indexPath.section, indexPath.row);
    
    UITableViewCell *cell = nil;
    
    // 검색시
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSString * searchCellIdentifier = @"searchResultTableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:searchCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellIdentifier];
        }
    }
    
    // 전체 리스트
    else if (_tableList == tableView){
        NSString * cellIdentifier = @"serverTableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        NSArray* list = [_listManager.arrayUrlListInfo objectAtIndex:indexPath.section];
        NSDictionary* info = [list objectAtIndex:indexPath.row];
        cell.textLabel.text = [info objectForKey:@"name"];
        
    }
    
    // 카테고리 리스트
    else {
        NSString *selectorCellIdentifier = @"selectorTableCell";
        cell = [tableView dequeueReusableCellWithIdentifier:selectorCellIdentifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:selectorCellIdentifier];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray* list = [_listManager.arrayUrlListInfo objectAtIndex:indexPath.section];
    NSDictionary* info = [list objectAtIndex:indexPath.row];
    [self privateLoadViewer:[info objectForKey:@"id"] url:[info objectForKey:@"url"]];
}


@end
