//
//  AppDelegate.h
//  ObjectiveCPRoject
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;
//instance function
- (NSString*) theFunc;
//class function
+ (NSString*) classFunc;

- (void)saveContext;


@end

