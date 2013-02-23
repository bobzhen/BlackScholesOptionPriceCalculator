//
//  ImpliedViewController.h
//  OptionBroker
//
//  Created by Cod7 on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


@protocol ImpliedViewControllerDelegate;

@interface ImpliedViewController : UIViewController {
	id <ImpliedViewControllerDelegate> impliedDelegate;
		
	IBOutlet UITextField *optionPrice;
	IBOutlet UITextField *stockPrice;
	IBOutlet UITextField *strikePrice;
	IBOutlet UITextField *maturity;
	IBOutlet UITextField *interstRate;

	IBOutlet UILabel *optionLabel;
	IBOutlet UILabel *volatilityLabel;
}

@property (nonatomic, retain) id <ImpliedViewControllerDelegate> impliedDelegate;

@property (nonatomic, retain) IBOutlet UITextField *optionPrice;
@property (nonatomic, retain) IBOutlet UITextField *stockPrice;
@property (nonatomic, retain) IBOutlet UITextField *strikePrice;
@property (nonatomic, retain) IBOutlet UITextField *maturity;
@property (nonatomic, retain) IBOutlet UITextField *interstRate;

@property (nonatomic, retain) IBOutlet UILabel *optionLabel;
@property (nonatomic, retain) IBOutlet UILabel *volatilityLabel;

//Button for back to CalView.xib
- (IBAction)impliedDone;
//TextField keyboard return
- (IBAction)hideKeyboard:(id)sender;
//Buttons for addtion or subtraction
- (IBAction)stockPriceAdd:(id)sender;
- (IBAction)stockPriceSub:(id)sender;

- (IBAction)strikePriceAdd:(id)sender;
- (IBAction)strikePriceSub:(id)sender;

- (IBAction)optionPriceAdd:(id)sender;
- (IBAction)optionPriceSub:(id)sender;

- (IBAction)maturityAdd:(id)sender;
- (IBAction)maturitySub:(id)sender;

- (IBAction)interestRateAdd:(id)sender;
- (IBAction)interestRateSub:(id)sender;

- (IBAction)changeOptionType:(id)sender;

//Functions for calculation of IV
- (IBAction)fianlCal:(id)sender;
//optionType, stockPrice, strikePrice, Time to Expiry, Interest Rate, call/put optionPrice
- (double)ImpliedVolatility:(NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)cp;
- (double)BlackScholes: (NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v;
- (double)DBlackScholes: (NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v;
- (double)CND:(double)X;
- (double)ERF:(double)X;

@end




@protocol ImpliedViewControllerDelegate
- (void)impliedViewControllerDidFinish:(ImpliedViewController *)impliedController;
@end