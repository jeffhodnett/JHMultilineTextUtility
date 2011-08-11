//
//  AppDelegate.h
//  JHMultiLineTest
//
//  Created by Jeff Hodnett on 28/07/2011.
//  Copyright Applausible 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
