//
//  InAppHelpAppDelegate.m
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InAppHelpAppDelegate.h"
//#import "MainViewController.h"
#import "LoadingViewController.h"
@implementation InAppHelpAppDelegate
//LoadingViewController *loadingViewController;

@synthesize window;
//@synthesize mainViewController;
@synthesize loadingViewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application {
    /*
	//Attention
	UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"ATTENTION"
													 message:@"This program should be used for EDUCATIONAL purposes only. Anyone who wants use this software for COMMERCIAL purposes should take RISK by yourself."
													delegate:self
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:nil];
	[alert show];
	[alert release];
	*/
	
	
	//[NSThread sleepForTimeInterval:0.5];
	LoadingViewController *aController = [[LoadingViewController alloc] initWithNibName:@"LoadingView" bundle:nil];
	self.loadingViewController = aController;
	[aController release];
	loadingViewController.view.frame = [UIScreen mainScreen].applicationFrame;
	[window addSubview:[loadingViewController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [loadingViewController release];
    [window release];
    [super dealloc];
}

@end
