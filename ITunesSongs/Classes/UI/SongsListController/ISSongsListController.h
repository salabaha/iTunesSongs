//
//  MasterViewController.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISSearchInteractor.h"

@class ISSongDetailsController;

@interface ISSongsListController : UIViewController

@property (nonatomic, strong) ISSearchInteractor *searchInteractor;

@end

