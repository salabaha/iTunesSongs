//
//  AppDelegate.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "AppDelegate.h"
#import "ISSplitControllerConfigurator.h"

@interface AppDelegate () <UISplitViewControllerDelegate>

@property (nonatomic, strong) ISSplitControllerConfigurator * splitControllerConfigurator;
@property (nonatomic, weak)   UISplitViewController         * splitViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self configureSplitViewController];

    return YES;
}

#pragma mark - UISplitViewController configuration

- (void)configureSplitViewController
{
    [self.splitControllerConfigurator configureSplitController];
}

#pragma mark - Lazy init

- (ISSplitControllerConfigurator *)splitControllerConfigurator
{
    if (!_splitControllerConfigurator) {

        id scc = [[ISSplitControllerConfigurator alloc] initWithController:self.splitViewController];
        _splitControllerConfigurator = scc;
    }

    return _splitControllerConfigurator;
}

- (UISplitViewController *)splitViewController
{
    return (UISplitViewController *)self.window.rootViewController;
}

@end

