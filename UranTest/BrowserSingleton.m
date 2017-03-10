//
//  BrowserSingleton.m
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import "BrowserSingleton.h"
#import "FileModel.h"

@implementation BrowserSingleton
static BrowserSingleton * sharedInstance = NULL;
+(BrowserSingleton *)sharedInstance {
    if (!sharedInstance || sharedInstance == NULL) {
        sharedInstance = [[self alloc] init];
        
    }
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    }
    return self;
}

- (NSArray *)getContentstOfFolder:(NSString *)folder{
    NSError * error;
    NSArray * directoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[self getPathForFolder:folder] error:&error];
    
    NSMutableArray * filesArray = [[NSMutableArray alloc] init];
    
    BOOL isDirectory;
    for (NSString *item in directoryContents){
        NSString * pathForFile = [NSString stringWithFormat:@"%@/%@",[self getPathForFolder:folder],item];
        BOOL fileExistsAtPath = [[NSFileManager defaultManager] fileExistsAtPath:pathForFile isDirectory:&isDirectory];
        if (fileExistsAtPath) {
            
            FileModel * file = [[FileModel alloc] init];
            file.filename = item;
            file.modDate = [self getModDateForFile:pathForFile];
            
            if (isDirectory)
            {
                file.isFolder = YES;
                file.fileType = 0;
            }
            else{
                file.isFolder = NO;
                NSLog(@"EXT = %@",[item pathExtension]);
                file.fileType = [self fileTypeStringToEnum:[item pathExtension]];
            }
            
            [filesArray addObject:file];
        }
    }

    
    
    return [NSArray arrayWithArray:filesArray];
    
}

- (NSDate *)getModDateForFile:(NSString *)pathForFile{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:pathForFile error:nil];
    
    return [attributes fileModificationDate];
}

- (NSString *)getPathForFolder:(NSString *)folder{
    if (folder == nil) {
        return [appDelegate getBaseURL];
    }
    else{
        return [NSString stringWithFormat:@"%@/%@",[appDelegate getBaseURL],folder];
    }
}

-(NSString*) fileTypeEnumToString:(FileType)enumVal
{
    NSArray *imageTypeArray = [[NSArray alloc] initWithObjects:kFileTypeArray];
    return [imageTypeArray objectAtIndex:enumVal];
}

-(FileType) fileTypeStringToEnum:(NSString*)strVal
{
    NSArray *imageTypeArray = [[NSArray alloc] initWithObjects:kFileTypeArray];
    NSUInteger n = [imageTypeArray indexOfObject:strVal];
    if(n < 1) n = Directory;
    return (FileType) n;
}



@end
