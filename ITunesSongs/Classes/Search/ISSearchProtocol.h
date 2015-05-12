//
//  ISSearchProtocol.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ ISSearchResult)(NSDictionary * data, NSError * error);

@protocol ISSearchProtocol <NSObject>

- (void)searchFor:(NSString *)pattern complition:(ISSearchResult)complition;

@end
