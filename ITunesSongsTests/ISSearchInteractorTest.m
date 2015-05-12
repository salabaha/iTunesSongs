//
//  ISSearchInteractor.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Base/XCTestCaseBase.h"

#import "ISSearchInteractor.h"
#import "ISFakeSearch.h"

@interface ISSearchInteractorTest : XCTestCaseBase

@property (nonatomic, strong) ISSearchInteractor * si;
@end

@implementation ISSearchInteractorTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.si = [[ISSearchInteractor alloc] initWithSearch:[ISFakeSearch new]];
}

- (void)testSearchInteractorFound50Songs
{
    XCTestExpectation * exp = [self expectationWithDescription:@"Search for Eminem"];

    [self.si songsMatchingPattern:@"Eminem" complition:^(NSArray *songs) {
       
        [exp fulfill];
        
        XCTAssertEqual(50, [songs count], "Should return 50 songs");        
    }];


    [self waitForExpectationsWithTimeout:INT16_MAX handler:nil];
}

@end
