    //
//  LoadingViewController.m
//  OptionBroker
//
//  Created by Cod7 on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "LoadingViewController.h"
#import "MainViewController.h"

@implementation LoadingViewController

@synthesize loadingPic;
//@synthesize mainViewController;
//@synthesize window;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


-(void)postNotification{
	[[NSNotificationCenter defaultCenter] postNotificationName:@"LoadFinished" object:@""];	
}

-(void)fadeIn{
	[self fadeView:loadingPic :YES :FadeInDur];
}

-(void)fadeOut{
	[self fadeView:loadingPic :NO :FadeOutDur];
}

-(void)fadeView:(UIView *)v :(BOOL)appare :(NSInteger)tempo{
	if(appare){
		v.alpha = 0;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:tempo];
		[UIView setAnimationDelegate:self];
		v.alpha = 1;
		[self.view addSubview:loadingPic];
		[UIView commitAnimations];
	}else {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:tempo];
		[UIView setAnimationDelegate:self];
		v.alpha = 0;
		[UIView commitAnimations];
	}
}

-(void)addMainView{
	MainViewController *mainViewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	mainViewController.mainDelegate = self;
	
	mainViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:mainViewController animated:YES];
	//	[mainViewController viewWillAppear:YES];
	//	[mainViewController viewWillAppear:YES];
	[self.view insertSubview:mainViewController.view atIndex:0];
	//	[mainViewController viewDidAppear:NO];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	
	loadingPic = [[UIImageView alloc] initWithFrame:self.view.frame];
	loadingPic.image = [UIImage imageNamed:@"open.png"];
	
	// Loading Animation
	[self performSelector:@selector(fadeIn) withObject:nil afterDelay:0];
	[self performSelector:@selector(fadeOut) withObject:nil afterDelay:StopDur];
	[self performSelector:@selector(postNotification) withObject:nil afterDelay:(StopDur+FadeOutDur+1)];
    
	[self performSelector:@selector(addMainView) withObject:nil afterDelay:(StopDur+FadeOutDur+1)];

	[UIView commitAnimations];
	
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[loadingPic release];
	//[mainViewController release];
    [super dealloc];
}


@end

