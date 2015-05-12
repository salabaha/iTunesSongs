//
//  NSObject+PropertyValidation.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PropertyIntrospection)

- (BOOL)hasPropertyNamed:(NSString *)name;

@end
