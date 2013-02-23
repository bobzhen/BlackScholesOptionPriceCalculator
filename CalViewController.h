//
//  CalViewController.h
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImpliedViewController.h"
#import "GreekViewController.h"

@protocol CalViewControllerDelegate;

//@class GraphView;

@interface CalViewController : UIViewController <ImpliedViewControllerDelegate, GreekViewControllerDelegate> {
	id <CalViewControllerDelegate> calDelegate;
	//UIButton *calBtn;
	IBOutlet UITextField *stockPrice;
	IBOutlet UITextField *strikePrice;
	IBOutlet UITextField *volatility;
	IBOutlet UITextField *maturity;
	IBOutlet UITextField *interstRate;
	//IBOutlet UIButton *changeType;
	IBOutlet UILabel *optionLabel;
	IBOutlet UILabel *optionPriceLabel;
	//GraphView *graphView;
}

@property (nonatomic, retain) id <CalViewControllerDelegate> calDelegate;
//@property (nonatomic, retain) IBOutlet UIButton *calBtn;
@property (nonatomic, retain) IBOutlet UITextField *stockPrice;
@property (nonatomic, retain) IBOutlet UITextField *strikePrice;
@property (nonatomic, retain) IBOutlet UITextField *volatility;
@property (nonatomic, retain) IBOutlet UITextField *maturity;
@property (nonatomic, retain) IBOutlet UITextField *interstRate;
//@property (nonatomic, retain) IBOutlet UIButton *changeType;
@property (nonatomic, retain) IBOutlet UILabel *optionLabel;
@property (nonatomic, retain) IBOutlet UILabel *optionPriceLabel;
//@property (nonatomic, retain) GraphView *graphView;

- (IBAction)calDone;
- (IBAction)hideKeyboard:(id)sender;
//- (IBAction)GraphButtonPressed:(id)sender;
- (IBAction)GreekShow:(id)sender;
- (IBAction)IVShow:(id)sender;
//These are actions for add or sub text field
- (IBAction)stockPriceAdd:(id)sender;
- (IBAction)stockPriceSub:(id)sender;
- (IBAction)strikePriceAdd:(id)sender;
- (IBAction)strikePriceSub:(id)sender;
- (IBAction)volatilityAdd:(id)sender;
- (IBAction)volatilitySub:(id)sender;
- (IBAction)maturityAdd:(id)sender;
- (IBAction)maturitySub:(id)sender;
- (IBAction)interestRateAdd:(id)sender;
- (IBAction)interestRateSub:(id)sender;
- (IBAction)changeOptionType:(id)sender;
//- (IBAction)changeOptionToPut:(id)sender;
//These are methed used for calculate option's price
- (IBAction)fianlCal:(id)sender;
- (double)BlackScholes:(NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v;
- (double)CND:(double)X;
- (double)ERF:(double)X;

@end

@protocol CalViewControllerDelegate
- (void)calViewControllerDidFinish:(CalViewController *)calController;
@end

