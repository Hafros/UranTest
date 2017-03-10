//
//  BrowserSingleton.h
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "FileModel.h"

@interface BrowserSingleton : NSObject{
    AppDelegate * appDelegate;
}
+(BrowserSingleton *)sharedInstance;

- (NSArray *)getContentstOfFolder:(NSString *)folder;

-(NSString*) fileTypeEnumToString:(FileType)enumVal;
-(FileType) fileTypeStringToEnum:(NSString*)strVal;

@end
