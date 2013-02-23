//
//  MainViewController.m
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"

@implementation MainViewController

@synthesize mainDelegate;
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)helpViewControllerDidFinish:(HelpViewController *)controller {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)calViewControllerDidFinish:(CalViewController *)calController{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)contactViewControllerDidFinish:(ContactViewController *)contactController{
	[self dismissModalViewControllerAnimated:YES];
}

- (void)serviceViewControllerDidFinish:(ServiceViewController *)serviceController{
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showHelp:(id)sender{
	// The Help button was tapped, so display the Help View.
	HelpViewController *controller = [[HelpViewController alloc] initWithNibName:@"HelpView" bundle:nil];
	controller.helpDelegate = self;
	controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:controller animated:YES];
	[controller release];
}

- (IBAction)showCal:(id)sender{
	CalViewController *calController = [[CalViewController alloc] initWithNibName:@"CalView" bundle:nil];
	calController.calDelegate = self;
	calController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:calController animated:YES];
	[calController release];
}

- (IBAction)showService:(id)sender{
	// The Contact Support button was tapped, so display the Help View.
	ServiceViewController *serviceController = [[ServiceViewController alloc] initWithNibName:@"ServiceView" bundle:nil];
	serviceController.serviceDelegate = self;
	serviceController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:serviceController animated:YES];
	[serviceController release];
}

- (IBAction)showContact:(id)sender{
	// The Contact Support button was tapped, so display the Help View.
	ContactViewController *contactController = [[ContactViewController alloc] initWithNibName:@"ContactView" bundle:nil];
	contactController.contactDelegate = self;
	contactController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:contactController animated:YES];
	[contactController release];
}

- (IBAction)quitProgram:(id)sender{
	exit(0);
}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	//[splashImageView release];

    [super dealloc];
}


@end
