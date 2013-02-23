//
//  ContactViewController.m
//  OptionBroker
//
//  Created by Cod7 on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactViewController.h"
#import "SHK.h"

@implementation ContactViewController

@synthesize contactDelegate;
@synthesize webView;
@synthesize ai;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.toolbarItems =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showShareURL)] autorelease];
	}
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	//Load author's facebook page into the UIWebView


	//change here
	NSURL *url = [NSURL URLWithString:@"http://172.28.18.103:8080/Server/hisVo.jsp"];
	//[[UIApplication sharedApplication] openURL:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
	[self.webView loadRequest:request];
	timer = [NSTimer scheduledTimerWithTimeInterval:(2.0) target:self selector:@selector(loading) userInfo:nil repeats:YES];
	[super viewDidLoad];
}

- (void)loading{
	if (!webView.loading) {
		[ai stopAnimating];
	}else {
		[ai stopAnimating];
	}

}

- (IBAction)showShareURL:(id)sender{
	// Action button was tapped, so launch ShareKit.
	// Create the item to share (in this example, a url)
	//NSURL *url = [NSURL URLWithString:@"http://m.yahoo.com/w/yfinance?.intl=MO&.lang=en"];
	//SHKItem *item = [SHKItem URL:url title:@"Contact me!"];
	// Get the ShareKit action sheet
	//SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
	// Display the action sheet
	//[actionSheet showFromToolbar];
	//SHKItem *item = [SHKItem URL:webView.request.URL title:[webView pageTitle]];
	//SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
	//[actionSheet showInView:self]; 
}


- (IBAction)done{
	//The Done Button was tapped, so close the Contact & Share View
	[self.contactDelegate contactViewControllerDidFinish:self];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[webView release];
	[ai release];
    [super dealloc];
}


@end
