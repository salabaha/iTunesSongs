//
//  ISSearchInteractor.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISSearchProtocol.h"
#import "ISSong.h"

@interface ISSearchInteractor : NSObject

- (instancetype)initWithSearch:(id <ISSearchProtocol> )dataSearch NS_DESIGNATED_INITIALIZER;

- (void)songsMatchingPattern:(NSString *)pattern complition:(void (^)(NSArray * songs))songs;

@end
