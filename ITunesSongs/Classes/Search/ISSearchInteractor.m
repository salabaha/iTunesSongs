//
//  ISSearchInteractor.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSearchInteractor.h"
#import "NSArray+HOM.h"
#import "ISSongCreator.h"

@interface ISSearchInteractor ()

@property (nonatomic, strong) id <ISSearchProtocol> dataSearch;

@end

@implementation ISSearchInteractor

- (instancetype)initWithSearch:(id<ISSearchProtocol>)dataSearch
{
    if (self = [super init]) {
        _dataSearch = dataSearch;
    }

    return self;
}

#pragma mark - Public methods

- (void)songsMatchingPattern:(NSString *)pattern complition:(void (^)(NSArray *))songs
{
    __weak typeof(self) weakSelf = self;

    [self.dataSearch searchFor:pattern complition:^(NSDictionary * data, NSError * error) {
         songs([weakSelf songsFromData:data]);
     }];
}

#pragma mark - Private methods

- (NSArray *)songsFromData:(NSDictionary *)data
{
    if (![data[@"resultCount"] isEqualToNumber:@0]) {

        return [data[@"results"] arrayFromObjectsCollectedWithBlock:^id (id dict) {

                    return [[ISSongCreator creatorWithDictionary:dict] createSong];

                }];
    }
    else {

        return nil;
    }
}

@end
