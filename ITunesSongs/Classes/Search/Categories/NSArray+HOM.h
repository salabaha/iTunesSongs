//
//  NSArray+HOM.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id (^)(id obj))block;

@end
