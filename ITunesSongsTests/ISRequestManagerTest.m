//
//  IAHTTPClientTest.m
//  iTunesSongs
//
//  Created by Roman Salabay on 1/22/15.
//
//

#import <UIKit/UIKit.h>
#import "XCTestCaseBase.h"
#import "ISRequestProvider.h"
#import "ISJsonDataPaser.h"

@interface IARequestsManagerTest : XCTestCaseBase

@property (nonatomic) ISRequestProvider * rm;

@end

@implementation IARequestsManagerTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.rm = [[ISRequestProvider alloc] initWithDataParser:[ISJsonDataPaser new]];
}

- (void)testRequestWithEmptyString
{

//TODO: Use mocking technik to swap network call with fake one

    NSString * pattern = @"";

    XCTestExpectation * exp = [self expectationWithDescription:[NSString stringWithFormat:@"Search for %@", pattern]];

    [self.rm searchFor:pattern complition:^(NSDictionary * data, NSError * error) {

         [exp fulfill];

         XCTAssertEqual(@0, data[@"resultCount"], @"ResultCount should be 0");
         XCTAssertNil(error, @"Error should be nil");

     }];

    [self waitForExpectationsWithTimeout:INT16_MAX handler:nil];
}

@end
