//
//  HelpViewController.h
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@protocol HelpViewControllerDelegate;


@interface HelpViewController : UIViewController {
	id <HelpViewControllerDelegate> helpDelegate;
	UIWebView *webView;
}

@property (nonatomic, assign) id <HelpViewControllerDelegate> helpDelegate;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
- (IBAction)done;

@end


@protocol HelpViewControllerDelegate
- (void)helpViewControllerDidFinish:(HelpViewController *)controller;
@end

