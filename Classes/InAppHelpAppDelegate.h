//
//  InAppHelpAppDelegate.h
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@class LoadingViewController;
//@class MainViewController;
//LoadingViewController *loadingViewController;
@interface InAppHelpAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	//MainViewController *mainViewController;
	LoadingViewController *loadingViewController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) MainViewController *mainViewController;
@property (nonatomic, retain) LoadingViewController *loadingViewController;
@end

