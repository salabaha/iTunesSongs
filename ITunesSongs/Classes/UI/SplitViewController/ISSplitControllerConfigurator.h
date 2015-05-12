//
// Created by Roman Salabay on 1/28/15.
// Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ISSplitControllerConfigurator : NSObject

- (instancetype)initWithController:(UISplitViewController *)controller NS_DESIGNATED_INITIALIZER;

- (void)configureSplitController;

@end