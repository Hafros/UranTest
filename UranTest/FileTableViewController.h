//
//  FileTableViewController.h
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileTableViewController : UITableViewController

@property(nonatomic,retain) NSString * currentFolder;
@property(nonatomic,retain) NSArray * filesArray;

@end
