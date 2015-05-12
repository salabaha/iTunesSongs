//
//  ISTableDataSource.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISArrayDataSource.h"

@interface ISArrayDataSource ()

@property (nonatomic, copy)   NSString                      * cellIdentifier;
@property (nonatomic, copy)   ISTableViewCellConfigureBlock configureCellBlock;

@end

@implementation ISArrayDataSource

- (id)   initWithItems:(NSArray *)anItems cellIdentifier:(NSString *)aCellIdentifier
    configureCellBlock:(ISTableViewCellConfigureBlock)aConfigureCellBlock
{
    self = [super init];
    if (self) {
        self.items              = anItems;
        self.cellIdentifier     = aCellIdentifier;
        self.configureCellBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.items[(NSUInteger)indexPath.row];
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                             forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureCellBlock(cell, item);

    return cell;
}

@end
