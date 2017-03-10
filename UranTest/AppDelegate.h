//
//  AppDelegate.h
//  UranTest
//
//  Created by Alex Hafros on 10.03.17.
//  Copyright © 2017 Alex Hafros. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,retain) NSString * baseURL;

- (NSString *)getBaseURL;

@end

