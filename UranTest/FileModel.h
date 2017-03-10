//
//  FileModel.h
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Directory,
    JPG,
    MP3
} FileType;
#define kFileTypeArray @"DIRECTORY", @"jpg", @"mp3", nil

@interface FileModel : NSObject
@property (nonatomic,retain) NSString *filename;
@property (nonatomic,assign) BOOL isFolder;
@property (nonatomic,retain) NSDate *modDate;
@property (nonatomic,assign) BOOL isOrange;
@property (nonatomic,assign) BOOL isBlue;

@property (nonatomic, assign) FileType fileType;

-(NSString*) fileTypeEnumToString:(FileType)enumVal;
-(FileType) fileTypeStringToEnum:(NSString*)strVal;

@end
