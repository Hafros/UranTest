//
//  FileTableViewController.m
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import "FileTableViewController.h"
#import "BrowserSingleton.h"
#import "FileTableViewCell.h"

#define CELL_IDENTIFIER @"FileCell"


@interface FileTableViewController ()

@end

@implementation FileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _filesArray = [[BrowserSingleton sharedInstance] getContentstOfFolder:_currentFolder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [_filesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if (cell == nil)
    {
        cell = [[FileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                           reuseIdentifier:CELL_IDENTIFIER];
    }
    
    
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Favorite" icon:[UIImage imageNamed:@"favorite.png"] backgroundColor:[UIColor clearColor] callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
        NSLog(@"FAVORITE");
        return YES;
    }],
                          [MGSwipeButton buttonWithTitle:@"Share" icon:[UIImage imageNamed:@"share.png"] backgroundColor:[UIColor clearColor]  callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
                              NSLog(@"SHARE");
                              return YES;
                          }],
                          [MGSwipeButton buttonWithTitle:@"Trash" icon:[UIImage imageNamed:@"trash.png"] backgroundColor:[UIColor clearColor]  callback:^BOOL(MGSwipeTableCell * _Nonnull cell) {
                              NSLog(@"TRASH");
                              return YES;
                          }]];
    
    cell.rightSwipeSettings.transition = MGSwipeTransitionDrag;

    FileModel * file = [_filesArray objectAtIndex:indexPath.row];
    
    cell.filename.text = file.filename;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd"];
    
    cell.modDate.text = [NSString stringWithFormat:@"modified %@",[formatter stringFromDate:file.modDate]];
    cell.icon_imageView.contentMode = UIViewContentModeScaleAspectFit;
    switch (file.fileType) {
        case Directory:
            cell.icon_imageView.image = [UIImage imageNamed:@"folder.png"];
            break;
        case JPG:
            cell.icon_imageView.image = [UIImage imageNamed:@"image.png"];
            break;
        case MP3:
            cell.icon_imageView.image = [UIImage imageNamed:@"music.png"];
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FileModel * file = [_filesArray objectAtIndex:indexPath.row];
    
    if (file.isFolder) {
        FileTableViewController *browser = [self.storyboard instantiateViewControllerWithIdentifier:@"fileBrowser"];
        browser.currentFolder = file.filename;
        
        [self.navigationController pushViewController:browser animated:YES];

    }
    else{
        NSLog(@"%@",file.filename);
    }
}

@end
