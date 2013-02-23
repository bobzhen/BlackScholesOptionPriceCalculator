//
//  ServiceViewController.h
//  OptionBroker
//
//  Created by Cod7 on 5/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

@protocol ServiceViewControllerDelegate;


@interface ServiceViewController : UIViewController {
	id <ServiceViewControllerDelegate> serviceDelegate;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) id <ServiceViewControllerDelegate> serviceDelegate;
- (IBAction)done;


@end


@protocol ServiceViewControllerDelegate
- (void)serviceViewControllerDidFinish:(ServiceViewController *)serviceController;
@end

