//
//  ISSongListCell+configureWithSong.h
//  ITunesSongs
//
//  Created by Roman Salabay on 2/13/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ISSongsListCell.h"
#import "ISSong.h"

@interface ISSongsListCell (configureWithSong)

- (void)configureWithSong:(ISSong *)song;

@end
