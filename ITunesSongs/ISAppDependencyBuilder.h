//
// Created by Roman Salabay on 1/28/15.
// Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ISSearchInteractor;

@interface ISAppDependencyBuilder : NSObject

+ (instancetype)builder;

- (ISSearchInteractor *)buildSearchInteractor;

@end