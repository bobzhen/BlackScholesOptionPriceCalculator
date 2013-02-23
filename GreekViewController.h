//
//  GreekViewController.h
//  OptionBroker
//
//  Created by Cod7 on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@protocol GreekViewControllerDelegate;
@interface GreekViewController : UIViewController {
	id <GreekViewControllerDelegate> greekDelegate;
}

@property (nonatomic, retain) id <GreekViewControllerDelegate> greekDelegate;

- (IBAction)greekDone;

@end


@protocol GreekViewControllerDelegate
- (void)greekViewControllerDidFinish:(GreekViewController *)greekController;
@end