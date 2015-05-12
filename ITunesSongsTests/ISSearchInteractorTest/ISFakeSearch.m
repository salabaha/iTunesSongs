//
//  ISFakeSearch.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISFakeSearch.h"

@implementation ISFakeSearch

- (void)searchFor:(NSString *)pattern complition:(ISSearchResult)complition
{
    NSString     * path = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestJson" ofType:@"plist"];
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:path];

    complition(dict, nil);
}

@end
