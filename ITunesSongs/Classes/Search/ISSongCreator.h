//
//  ISSongsCreator.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSong.h"

@interface ISSongCreator : NSObject

+ (instancetype)creatorWithDictionary:(NSDictionary *)dict;

- (instancetype)initWithDictionary:(NSDictionary *)dict NS_DESIGNATED_INITIALIZER;

- (ISSong *)createSong;

@end
