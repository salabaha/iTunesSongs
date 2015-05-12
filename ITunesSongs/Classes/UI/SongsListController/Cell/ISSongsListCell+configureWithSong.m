//
//  ISSongListCell+configureWithSong.m
//  ITunesSongs
//
//  Created by Roman Salabay on 2/13/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSongsListCell+configureWithSong.h"
#import <UIImageView+WebCache.h>

@implementation ISSongsListCell (configureWithSong)

- (void)configureWithSong:(ISSong *)song
{
    self.artist.text = song.artist;
    self.title.text  = song.title;
    
    [self.cover sd_setImageWithURL:[self urlFromString:song.thumbnail]
                  placeholderImage:[self placeholderImage]];
}

#pragma mark - Private methods 

- (NSURL *)urlFromString:(NSString *)string
{
    return [NSURL URLWithString:string];
}

- (UIImage *)placeholderImage
{
    return [UIImage imageNamed:@"placeholder"];
}

@end
