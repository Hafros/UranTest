//
//  FileTableViewCell.h
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MGSwipeTableCell.h>

@interface FileTableViewCell : MGSwipeTableCell
@property (weak, nonatomic) IBOutlet UIView *statusView;
@property (weak, nonatomic) IBOutlet UILabel *filename;
@property (weak, nonatomic) IBOutlet UILabel *modDate;
@property (weak, nonatomic) IBOutlet UIImageView *icon_imageView;

@end
