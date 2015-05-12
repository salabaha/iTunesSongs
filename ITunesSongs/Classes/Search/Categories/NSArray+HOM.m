//
//  NSArray+HOM.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "NSArray+HOM.h"

@implementation NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id (^)(id obj))block
{
    NSMutableArray * list = [NSMutableArray arrayWithCapacity:self.count];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * stop) {
         [list addObject:block(obj)];
     }];

    return list;
}

@end
