//
//  ISTableDataSource.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ ISTableViewCellConfigureBlock)(id cell, id item);

@interface ISArrayDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSArray * items;

- (instancetype)initWithItems:(NSArray *)anItems
               cellIdentifier:(NSString *)aCellIdentifier
           configureCellBlock:(ISTableViewCellConfigureBlock)aConfigureCellBlock NS_DESIGNATED_INITIALIZER;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
