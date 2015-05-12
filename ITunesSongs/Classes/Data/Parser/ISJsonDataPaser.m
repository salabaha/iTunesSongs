//
//  ISJsonDataPaser.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISJsonDataPaser.h"

@implementation ISJsonDataPaser

- (NSDictionary *)parseData:(NSData *)data error:(NSError * *)error
{
    NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                options:NSJSONReadingAllowFragments
                                                                  error:error];
    return dictionary;
}

@end
