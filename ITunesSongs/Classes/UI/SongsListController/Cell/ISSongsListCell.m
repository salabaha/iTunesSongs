//
//  ISSongsListCell.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSongsListCell.h"
#import <CoreGraphics/CoreGraphics.h>


@implementation ISSongsListCell

- (void)awakeFromNib
{
    [self roundCoverCorners];
}

#pragma mark - Private methods

- (void)roundCoverCorners
{
    self.cover.clipsToBounds = NO;

    [self.cover.layer setMasksToBounds:YES];
    [self.cover.layer setCornerRadius:4.5];
}

@end
