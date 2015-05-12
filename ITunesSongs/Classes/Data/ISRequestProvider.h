//
//  IARequestsManager.h
//  iTunesSongs
//
//  Created by Roman Salabay on 1/22/15.
//
//

#import <Foundation/Foundation.h>
#import "ISDataParserProtocol.h"
#import "ISSearchProtocol.h"

@interface ISRequestProvider : NSObject <ISSearchProtocol>

- (instancetype)initWithDataParser:(id <ISDataParserProtocol>)parser NS_DESIGNATED_INITIALIZER;

@end
