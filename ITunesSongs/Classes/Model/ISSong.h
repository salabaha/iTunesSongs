//
//  IAAlbum.h
//  iTunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//
//

#import <Foundation/Foundation.h>

@interface ISSong : NSObject

@property (nonatomic, copy)   NSString *album;
@property (nonatomic, copy)   NSString *title;
@property (nonatomic, copy)   NSString *artist;
@property (nonatomic, copy)   NSString *thumbnail;

@property (nonatomic, strong) NSDate   *releaseDate;
@property (nonatomic, strong) NSNumber *price;

@end
