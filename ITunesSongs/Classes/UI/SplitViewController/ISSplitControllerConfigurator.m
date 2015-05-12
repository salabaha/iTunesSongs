//
// Created by Roman Salabay on 1/28/15.
// Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <UIKit/UISplitViewController.h>
#import "ISSplitControllerConfigurator.h"
#import "ISSongDetailsController.h"
#import "ISSearchInteractor.h"
#import "ISSongsListController.h"
#import "ISAppDependencyBuilder.h"


@interface ISSplitControllerConfigurator () <UISplitViewControllerDelegate>

@property (nonatomic, strong) UISplitViewController * splitController;

@end

@implementation ISSplitControllerConfigurator

- (instancetype)initWithController:(UISplitViewController *)controller
{
    if (self = [super init]) {

        _splitController = controller;
    }

    return self;
}

#pragma mark - Private method

- (void)configureSplitController
{
    [self setSplitControllerDelegate:_splitController];

    [self configureSplitMasterController:_splitController];

    [self configureSplitDetailController:_splitController];
}

- (void)setSplitControllerDelegate:(UISplitViewController *)splitController
{
    [splitController setDelegate:self];
}

- (void)configureSplitMasterController:(UISplitViewController *)splitController
{
    UINavigationController * masterNavCon = [splitController.viewControllers firstObject];

    ((ISSongsListController *)masterNavCon.topViewController).searchInteractor = [self getSearchInteractor];
}

- (void)configureSplitDetailController:(UISplitViewController *)splitController
{
    UINavigationController * detailsNavCont = [splitController.viewControllers lastObject];

    detailsNavCont.topViewController.navigationItem.leftBarButtonItem = splitController.displayModeButtonItem;
}

- (ISSearchInteractor *)getSearchInteractor
{
    return [[ISAppDependencyBuilder builder] buildSearchInteractor];
}

#pragma mark - UISplitViewControllerDelegate methods

- (BOOL)        splitViewController:(UISplitViewController *)splitViewController
    collapseSecondaryViewController:(UIViewController *)secondaryViewController
          ontoPrimaryViewController:(UIViewController *)primaryViewController
{
    return [self isDetailControllerHasDataToShow:secondaryViewController];
}

- (BOOL)isDetailControllerHasDataToShow:(UIViewController *)vc
{
    if ([self isNavigationController:vc]) {

        UIViewController * sdc = ((UINavigationController *)vc).topViewController;

        if ([sdc isKindOfClass:[ISSongDetailsController class]]) {

            return !((ISSongDetailsController *)sdc).detailItem;
        }
    }

    return NO;
}

- (BOOL)isNavigationController:(id)vc
{
    return [vc isKindOfClass:[UINavigationController class]];
}

@end