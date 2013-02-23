//
//  LoadingViewController.h
//  OptionBroker
//
//  Created by Cod7 on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

#define FadeInDur 1//2
#define StopDur 2//3
#define FadeOutDur 1 //2

@interface LoadingViewController : UIViewController <MainViewControllerDelegate>{
	UIImageView *loadingPic;
	//UIWindow *window;
	//MainViewController *mainViewController;
}

@property (nonatomic, retain) UIImageView *loadingPic;
//@property (nonatomic, retain) UIWindow *window;
//@property (nonatomic, retain) MainViewController *mainViewController;

-(void)fadeIn;
-(void)fadeOut;
-(void)fadeView:(UIView *) v: (BOOL) appare: (NSInteger)tempo;
-(void)postNotification;

@end