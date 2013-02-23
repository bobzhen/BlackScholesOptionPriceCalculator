    //
//  ImpliedViewController.m
//  OptionBroker
//
//  Created by Cod7 on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ImpliedViewController.h"
#import "math.h"

#ifndef Pi
#define Pi 3.141592653589793238462643 
#endif
@implementation ImpliedViewController

@synthesize impliedDelegate;
//TextFields For Inputs
@synthesize optionPrice;
@synthesize stockPrice;
@synthesize strikePrice;
@synthesize maturity;
@synthesize interstRate;
//Label to display data
@synthesize optionLabel;
@synthesize volatilityLabel;


- (IBAction)hideKeyboard:(id)sender{
	[stockPrice resignFirstResponder];
	[strikePrice resignFirstResponder];
	[optionPrice resignFirstResponder];
	[interstRate resignFirstResponder];
	[maturity resignFirstResponder];
}

//Buttons for addtion or subtraction
- (IBAction)stockPriceAdd:(id)sender{
	double add =[stockPrice.text doubleValue]+0.01;
	stockPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}

- (IBAction)stockPriceSub:(id)sender{
	double sub =[stockPrice.text doubleValue]-0.01;
	if (sub < 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"STOCK PRICE CAN'T LESS THAN 0!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		stockPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
		
	}else{
		stockPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
	}
}

- (IBAction)strikePriceAdd:(id)sender{
	double add =[strikePrice.text doubleValue]+0.01;
	strikePrice.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}

- (IBAction)strikePriceSub:(id)sender{
	double sub =[strikePrice.text doubleValue]-0.01;
	if (sub < 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"STRIKE PRICE CAN'T LESS THAN 0!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		strikePrice.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
		
	}else{
		strikePrice.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
	}
}

- (IBAction)optionPriceAdd:(id)sender{
	double add =[optionPrice.text doubleValue]+0.01;
	optionPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}

- (IBAction)optionPriceSub:(id)sender{
	double sub =[optionPrice.text doubleValue]-0.01;
	if (sub < 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"OPTION PRICE CAN'T LESS THAN 0!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		optionPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
	}else{
		optionPrice.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
	}
}

- (IBAction)maturityAdd:(id)sender{
	double add =[maturity.text doubleValue]+0.01;
	maturity.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}

- (IBAction)maturitySub:(id)sender{
	
	double sub =[maturity.text doubleValue]-0.01;
	if (sub < 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"MATURITY CAN'T LESS THAN 0!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		maturity.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
		
	}else{
		maturity.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
	}
}

- (IBAction)interestRateAdd:(id)sender{
	double add =[interstRate.text doubleValue]+0.01;
	interstRate.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}

- (IBAction)interestRateSub:(id)sender{
	double sub =[interstRate.text doubleValue]-0.01;
	if (sub < 0|| sub > 100) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"INTEREST RATE CAN'T LESS THAN 0 OR LARGER THAN 100%!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		interstRate.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
		
	}else{
		interstRate.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
	}
}

- (IBAction)changeOptionType:(id)sender{
	if(optionLabel.text == @"Put"){
		optionLabel.text = @"Call";
	}else {
		optionLabel.text = @"Put";
	}
}

//Functions for calculation of IV
- (IBAction)fianlCal:(id)sender{
	// stockPrice.text validation
	if([stockPrice.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"Stock Price is empty!"
															delegate:self
												   cancelButtonTitle:@"OK"
												   otherButtonTitles:nil];
		[alertCheck show];
	}
	//[stockPrice resignFirstResponder];
	
	// strikePrice.text validation
	if([strikePrice.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"Strike Price is empty!"
															delegate:self
												   cancelButtonTitle:@"OK"
												   otherButtonTitles:nil];
		[alertCheck show];
	}
	
	// optionPrice.text validation
	if([optionPrice.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"Option Price is empty!"
															delegate:self
												   cancelButtonTitle:@"OK"
												   otherButtonTitles:nil];
		[alertCheck show];
	}
	
	// maturity.text validation
	if([maturity.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"Maturity is empty!"
															delegate:self
												   cancelButtonTitle:@"OK"
												   otherButtonTitles:nil];
		[alertCheck show];
	}
	
	// interstRate.text validation
	if([interstRate.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"InterstRate is empty!"
															delegate:self
												   cancelButtonTitle:@"OK"
												   otherButtonTitles:nil];
		[alertCheck show];
	}
	
	NSString *type;
	type = @"c";
	if(optionLabel.text == @"Put"){
		type = @"p";
	}
	if (optionLabel.text == @"Call"){
		type = @"c";
	}
	
	double stock = [stockPrice.text doubleValue];
	double strike = [strikePrice.text doubleValue];
	double timeToExpire = [maturity.text doubleValue];
	double rate = [interstRate.text doubleValue] / 100;
	double option = [optionPrice.text doubleValue];
	
	double ImpliedVo = [self ImpliedVolatility:type:stock:strike:timeToExpire:rate:option];
	//ImpliedVo = 10;
	NSLog(@"ImpliedVolatility is %f", ImpliedVo);
	volatilityLabel.text = [NSString stringWithFormat:@"%.4f%%", ImpliedVo * 100];
	[type release];
}

//optionType, stockPrice, strikePrice, Time to Expiry, Interest Rate, call/put optionPrice
- (double)ImpliedVolatility:(NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)cp{
	NSLog(@"Call ImpliedVolatility Function Here!");
	double stock = S;
	double strike =X;
	double year = T;
	double rate = r;
	double callPut = cp;
	
	NSLog(@"Stock %f", stock);
	NSLog(@"strike %f", strike);
	NSLog(@"year %f", year);
	NSLog(@"rate %f", rate);
	NSLog(@"callPut %f", callPut);
	double temp1 = log(stock/strike);
	NSLog(@"temp1 value is %f", temp1);
	double temp2 = rate * year;
	NSLog(@"temp2 value is %f", temp2);
	double temp3 = 2 / year;
	NSLog(@"temp3 value is %f", temp3);
	
	double temp4 = fabs(temp1 + temp2);
	NSLog(@"temp4 value is %f", temp4);
 	double temp5 = sqrt(temp4 * temp3);
	NSLog(@"temp5 value is %f", temp5);
	double ini = temp5;
	NSLog(@"Ini value is %f", ini);
	
	double sigma = ini;
	double approximation = ini;
	for (int i= 1; i<=250; i++) {
		if (type == @"c") {
			approximation = approximation - ([self BlackScholes:type:stock:strike:year:rate:sigma] - callPut) / ([self DBlackScholes:type:stock:strike:year:rate:sigma]);
			sigma = approximation;
		}
		
		if (type == @"p") {
			approximation = approximation - ([self BlackScholes:type:stock:strike:year:rate:sigma] - callPut) / ([self DBlackScholes:type:stock:strike:year:rate:sigma]);
			sigma = approximation;
		}
	}
	NSLog(@"approximation is %f", approximation);
	NSLog(@"Call ImpliedVolatility Function Over!");
	return approximation;
}

//BlackScholes Formula
- (double)BlackScholes: (NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v{
	double d1;
	double d2;
	double call;
	double put;
	double blackScholes;
	NSLog(@"Call BlackScholes Function Here!");
	d1 = (log(S/X) + (r + v * v / 2) * T) / (v * sqrt(T));
	d2 = (log(S/X) + (r - v * v / 2) * T) / (v * sqrt(T));
	
	if (type == @"c") {
		call = S * [self CND:d1] - X * exp(- r * T) * [self CND:d2];
		blackScholes =call;
	}
	
	if (type == @"p") {
		put = X * exp(- r * T) * [self CND:-d2] - S * [self CND:-d1];
		blackScholes = put;
	}
	NSLog(@"approximation is %f", blackScholes);
	NSLog(@"Call BlackScholes Function Over!");
	return blackScholes;
}

//First Derivative of BlackScholes
- (double)DBlackScholes: (NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v{
	double dCall;
	double dPut;
	double d1;
	double d2;
	double dd1;
	double dd2;
	double dBlackScholes;
	NSLog(@"Call D---dBlackScholes Function Here!");
	d1 = (log(S/X) + (r + v * v / 2) * T) / (v * sqrt(T));
	d2 = (log(S/X) + (r - v * v / 2) * T) / (v * sqrt(T));
	
	dd1 = (T * (v * v / 2 - r) - log(S / X)) / (v * v * pow(T, 1/2));
	dd2 = dd1 - pow(T, 1/2);
	
	if (type == @"c") {
		dCall = exp(- r * T) * S * ([self CND:d1]) * dd1 - exp(-r * T) * X * ([self CND:d2]) * dd2;
		dBlackScholes = dCall;
	}
	
	if (type == @"p") {
		dPut = exp(-r * T) * X * ([self CND:-d2]) * dd2 - exp(- r * T) * S * ([self CND:-d1]) * dd1;
		dBlackScholes = dCall;
	}
	NSLog(@"approximation is %f", dBlackScholes);
	NSLog(@"Call D---dBlackScholes Function Over!");
	return dBlackScholes;
}


//Cumulative (Normal) Distribution Function -- CDF
- (double)CND:(double)X{
	double temp = X / sqrt(2.0);
	double CDF = 0.5 * (1.0 + [self ERF:temp]);
	return CDF;
}

//Error Function for approximation
- (double)ERF:(double)X{
	double a0 = 1;
	double a1 = -1/3;
	double a2 = 1/10;
	double a3 = -1/42;
	double a4 = 1/216;
	double a5 = -1/1320;
	double a6 = 1/9360;
	
	double ERF = (2 / sqrt(Pi)) * (a0 * X + a1 * pow(X, 3) + a2 * pow(X, 5) + a3 * pow(X, 7) + a4 * pow(X, 9) + a5 * pow(X, 11) + a6 * pow(X, 13));
	return ERF;
}

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"Implied View Did Load!!!!");
}

- (IBAction)impliedDone{
	[self.impliedDelegate impliedViewControllerDidFinish:self];
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
    [super dealloc];
}


@end
