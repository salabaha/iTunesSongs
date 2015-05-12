//
//  MasterViewController.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSongsListController.h"
#import "ISSongDetailsController.h"
#import "ISArrayDataSource.h"
#import "ISSongsListCell.h"
#import "ISSongsListCell+configureWithSong.h"

NSString * const ISSongCellIndentifier = @"ISSongCellIndentifier";

@interface ISSongsListController () <UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView * tableView;
@property (nonatomic, weak) IBOutlet UISearchBar * searchBar;

@property (nonatomic, strong) NSMutableArray    * songs;
@property (nonatomic, strong) ISArrayDataSource * dataSource;

@end

@implementation ISSongsListController

// TODO: Clean and refactore code

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self hideNavigationBar];
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self handleSearch:searchBar];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self handleSearch:searchBar];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self clearTableView];
}

- (void)handleSearch:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];

    [self loadSongsMachPattern:searchBar.text];
}

#pragma mark - Table View methods

- (void)configureTableView
{
    self.dataSource = [[ISArrayDataSource alloc] initWithItems:self.songs cellIdentifier:ISSongCellIndentifier
                                            configureCellBlock    :^(ISSongsListCell * cell, ISSong * song) {

                           [cell configureWithSong:song];
                       }];

    self.tableView.dataSource = self.dataSource;
}

- (void)clearTableView
{
    self.dataSource.items = nil;

    [self.tableView reloadData];
}

#pragma mark - Private Methods

- (void)hideNavigationBar
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)loadSongsMachPattern:(NSString *)pattern
{
    __weak typeof(self) weakSelf = self;

    [self.searchInteractor songsMatchingPattern:pattern complition:^(NSArray * songs) {

         __strong typeof(self) strongSelf = weakSelf;

         dispatch_async(dispatch_get_main_queue(), ^{

            strongSelf.dataSource.items = songs;

            [strongSelf.tableView reloadData];
        });
     }];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ISSongDetailsController * dc = (ISSongDetailsController *)[(UINavigationController *)[segue destinationViewController] topViewController];

        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];

        id song = [self.dataSource itemAtIndexPath:indexPath];

        [dc setDetailItem:song];

        dc.navigationItem.leftBarButtonItem             = self.splitViewController.displayModeButtonItem;
        dc.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

@end
