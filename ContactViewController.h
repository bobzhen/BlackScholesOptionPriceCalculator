//
//  ContactViewController.h
//  OptionBroker
//
//  Created by Cod7 on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@protocol ContactViewControllerDelegate;

@interface ContactViewController : UIViewController {
	id <ContactViewControllerDelegate> contactDelegate;
	UIWebView *webView;
	UIActivityIndicatorView *ai;
	NSTimer *timer;
}

@property (nonatomic, retain) id <ContactViewControllerDelegate> contactDelegate;
@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *ai;
- (IBAction)showShareURL:(id)sender;
- (IBAction)done;
@end


@protocol ContactViewControllerDelegate
- (void) contactViewControllerDidFinish:(ContactViewController *)contactController;
@end