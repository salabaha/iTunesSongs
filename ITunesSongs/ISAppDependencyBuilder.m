//
// Created by Roman Salabay on 1/28/15.
// Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISAppDependencyBuilder.h"
#import "ISSearchInteractor.h"
#import "ISJsonDataPaser.h"
#import "ISRequestProvider.h"

@implementation ISAppDependencyBuilder

+ (instancetype)builder
{
    return [[ISAppDependencyBuilder alloc] init];
}

- (ISSearchInteractor *)buildSearchInteractor
{
    ISJsonDataPaser  * parser = [ISJsonDataPaser new];
    ISRequestProvider * rm     = [[ISRequestProvider alloc] initWithDataParser:parser];

    ISSearchInteractor * searchInteractor = [[ISSearchInteractor alloc] initWithSearch:rm];

    return searchInteractor;
}

@end