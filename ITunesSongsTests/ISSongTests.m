//
//  iTunesSongsTests.m
//  iTunesSongsTests
//
//  Created by Roman Salabay on 1/22/15.
//
//

#import <UIKit/UIKit.h>
#import "XCTestCaseBase.h"

#import "ISSong.h"

@interface iTunesSongsTests : XCTestCaseBase

@property (nonatomic, strong) ISSong * song;
@end

@implementation iTunesSongsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    self.song = [ISSong new];
}

- (void)testSongHasProperties
{
    [self assertHasProperty:@"album"];
    [self assertHasProperty:@"title"];
    [self assertHasProperty:@"artist"];
    [self assertHasProperty:@"thumbnail"];
    [self assertHasProperty:@"releaseDate"];
    [self assertHasProperty:@"price"];
}

#pragma mark - Private methods

- (void)assertHasProperty:(NSString *)name
{
    BOOL hasProperty = [self.song hasPropertyNamed:name];

    XCTAssert(hasProperty, @"ISSong has no %@ property", name);
}

@end
