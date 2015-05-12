//
//  ISSongsListCell.h
//  ITunesSongs
//
//  Created by Roman Salabay on 1/26/15.
//  Copyright (c) 2015 Roman Salabay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ISSongsListCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel     * artist;
@property (nonatomic, weak) IBOutlet UILabel     * title;
@property (nonatomic, weak) IBOutlet UIImageView * cover;

@end
