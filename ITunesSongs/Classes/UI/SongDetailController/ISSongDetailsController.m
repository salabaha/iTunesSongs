//
//  DetailViewController.m
//  ITunesSongs
//
//  Created by Roman Salabay on 1/25/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import "ISSongDetailsController.h"
#import <UIImageView+WebCache.h>
#import "ISCircleImageView.h"

@interface ISSongDetailsController ()

@property (nonatomic, weak) IBOutlet ISCircleImageView * cover;

@property (nonatomic, weak) IBOutlet UILabel * albumLabel;
@property (nonatomic, weak) IBOutlet UILabel * titleLabel;
@property (nonatomic, weak) IBOutlet UILabel * artistLabel;
@property (nonatomic, weak) IBOutlet UILabel * releaseDateLabel;
@property (nonatomic, weak) IBOutlet UILabel * priceLabel;

@end

@implementation ISSongDetailsController

@synthesize detailItem = _detailItem;

#pragma mark - Managing the detail item

// TODO: Clean and refactore code

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self hideNavigationBar];
}

#pragma mark - Setter/Getter methods

- (void)setDetailItem:(ISSong *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

-(ISSong *)detailItem
{
    return _detailItem;
}

#pragma mark - Private methods

- (void)configureView
{
    // Update the user interface for the detail item.
    
    [self.cover sd_setImageWithURL:[NSURL URLWithString:self.detailItem.thumbnail]
                  placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.albumLabel.text  = self.detailItem.album;
    self.titleLabel.text  = self.detailItem.title;
    self.artistLabel.text = self.detailItem.artist;
    
    self.priceLabel.text       = [self priceFromNumber:self.detailItem.price];
    self.releaseDateLabel.text = [self stringFromaDate:self.detailItem.releaseDate];
}


- (NSString *)priceFromNumber:(NSNumber *)price
{
    return [NSString stringWithFormat:@"%@ $", price];
}

// TODO: Move to NSDate category
- (NSString *)stringFromaDate:(NSDate *)date
{
    NSDateFormatter * formatter = [NSDateFormatter new];

    formatter.locale     = [NSLocale currentLocale];
    formatter.calendar   = [NSCalendar currentCalendar];
    formatter.timeStyle  = NSDateFormatterNoStyle;
    formatter.dateFormat = @"yyyy'-'MM'-'dd";

    return [formatter stringFromDate:date];
}

- (void)hideNavigationBar
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

@end
