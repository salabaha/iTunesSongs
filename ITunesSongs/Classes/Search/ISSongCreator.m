//
//  ISSongsCreator.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSongCreator.h"

@interface ISSongCreator ()

@property (nonatomic, strong) NSDictionary * dict;

@end

@implementation ISSongCreator

+ (instancetype)creatorWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        _dict = dict;
    }

    return self;
}

#pragma mark - Public methods

- (ISSong *)createSong
{
    return [self createSongFromDictionary];
}

#pragma mark - Private methods

- (ISSong *)createSongFromDictionary
{
    ISSong * song = [ISSong new];

    song.artist    = [self dictValueForKey:@"artistName"];
    song.title     = [self dictValueForKey:@"trackName"];
    song.album     = [self dictValueForKey:@"collectionName"];
    song.thumbnail = [self dictValueForKey:@"artworkUrl100"];
    song.price     = [self dictValueForKey:@"trackPrice"];

    song.releaseDate = [self dateFromString:[self dictValueForKey:@"releaseDate"]
                                     format:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];

    return song;
}

- (id)dictValueForKey:(NSString *)key
{
    return self.dict[key];
}

- (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter * formatter = [NSDateFormatter new];

    formatter.locale     = [NSLocale currentLocale];
    formatter.calendar   = [NSCalendar currentCalendar];
    formatter.timeStyle  = NSDateFormatterNoStyle;
    formatter.dateFormat = format;

    return [formatter dateFromString:string];
}

@end
