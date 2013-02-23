//
//  MainViewController.h
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelpViewController.h"
#import "CalViewController.h"
#import "ContactViewController.h"
#import "ServiceViewController.h"

@protocol MainViewControllerDelegate;

@interface MainViewController : UIViewController <HelpViewControllerDelegate, CalViewControllerDelegate, ContactViewControllerDelegate, ServiceViewControllerDelegate> {
	id <MainViewControllerDelegate> mainDelegate;
}

@property (nonatomic, retain) id <MainViewControllerDelegate> mainDelegate;

- (IBAction)showHelp:(id)sender;
- (IBAction)showCal:(id)sender;
- (IBAction)showService:(id)sender;
- (IBAction)showContact:(id)sender;
- (IBAction)quitProgram:(id)sender;

@end


@protocol MainViewControllerDelegate
- (void)mainViewControllerDidFinish:(MainViewController *)mainController;
@end