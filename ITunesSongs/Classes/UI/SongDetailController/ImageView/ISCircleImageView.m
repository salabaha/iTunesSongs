//
//  ISCircleImageView.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/27/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISCircleImageView.h"

@implementation ISCircleImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {

        self.clipsToBounds = YES;
    }

    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self layoutIfNeeded];

    [self makeCircleImage];
}

#pragma mark - Private methods

- (void)makeCircleImage
{
    self.layer.cornerRadius = self.frame.size.width / 2;
}

@end
