//
//  NSObject+PropertyValidation.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "NSObject+PropertyIntrospection.h"
#import <objc/runtime.h>

@implementation NSObject (PropertyIntrospection)

- (BOOL)hasPropertyNamed:(NSString *)name
{
    return ([self getPropertyForName:name] != NULL);
}

#pragma mark - Private methods

- (objc_property_t)getPropertyForName:(NSString *)name
{
    return class_getProperty(self.class, name.UTF8String);
}

@end
