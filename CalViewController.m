//
//  CalViewController.m
//  InAppHelp
//
//  Created by Cod7 on 4/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CalViewController.h"
//#import "GraphView.h"
#import "math.h"

#ifndef Pi
#define Pi 3.141592653589793238462643 
#endif
@implementation CalViewController
@synthesize calDelegate;
//@synthesize calBtn;
@synthesize stockPrice;
@synthesize strikePrice;
@synthesize volatility;
@synthesize maturity;
@synthesize interstRate;
//@synthesize graphView;
//@synthesize changeType;
@synthesize optionLabel;
@synthesize optionPriceLabel;



- (IBAction)hideKeyboard:(id)sender{
	[stockPrice resignFirstResponder];
	[strikePrice resignFirstResponder];
	[volatility resignFirstResponder];
	[interstRate resignFirstResponder];
	[maturity resignFirstResponder];
}

/*
-(IBAction)GraphButtonPressed:(id)sender{
	NSLog(@"Button pressed");
	GraphView *view1 = [[GraphView alloc]initWithNibName:@"GraphView" bundle:nil];
	self.graphView = view1;
	
	[self.view addSubview:graphView.view];
	[view1 release];
	//graphView.label1.text = self.stockPrice.text;
}
*/

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


- (IBAction)volatilityAdd:(id)sender{
	double add =[volatility.text doubleValue]+0.01;
	volatility.text = [[NSString alloc] initWithFormat:@"%2.2f", add];
}



- (IBAction)volatilitySub:(id)sender{
	double sub =[volatility.text doubleValue]-0.01;
	if (sub < 0||sub>100) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"VOLATILITY CAN'T LESS THAN 0 AND ALSO CAN'T BIGGER THAN 100!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		volatility.text = [[NSString alloc] initWithFormat:@"%2.2f", 0];
	}else{
		volatility.text = [[NSString alloc] initWithFormat:@"%2.2f", sub];
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
	if (sub < 0) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BE CAREFUL" message:@"INTEREST RATE CAN'T LESS THAN 0!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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
	
	// volatility.text validation
	if([volatility.text length]==0)
	{
		UIAlertView *alertCheck = [[UIAlertView alloc] initWithTitle:@"Data Missing Warning"
															 message:@"Volatility is empty!"
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
	//double mydouble = [myTextField.text doubleValue];
	double stock = [stockPrice.text doubleValue];
	double strike = [strikePrice.text doubleValue];
	double timeToExpire = [maturity.text doubleValue];
	double rate =  [interstRate.text doubleValue] / 100;
	double vo =  [volatility.text doubleValue] / 100;
	
	//NSString *s = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n", optionLabel.text, stockPrice.text, strikePrice.text, maturity.text];
	/*
	 @synthesize volatility;
	 @synthesize maturity;
	 @synthesize interstRate;
	 - (double)BlackScholes:(NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v
	 */
	NSLog(@"The new OPTION TYPE IS %@", type);
	NSLog(@"Data is sending to BLACK-SCHOLES function");
	double optionPrice = [self BlackScholes:type:stock:strike:timeToExpire:rate:vo];
	NSLog(@"FIANL PRICE IS %f", optionPrice);
	NSLog(@"End of calculation");
	
	//NSString *price = [NSString stringWithFormat:@"%@", optionPrice];
	//NSLog(@"Option Price is %@", price);
	optionPriceLabel.text = [NSString stringWithFormat:@"$%f", optionPrice];
	NSString *atAlert = [NSString stringWithFormat:@"%@%f", @"Option Price is:$", optionPrice];
	//NSString *s = [NSString stringWithFormat:@"%@", optionPrice];
	NSLog(@"Here is send OPTIONPRICE INTO ALERT");
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result"
													 message:atAlert
													delegate:self
										   cancelButtonTitle:@"OK"
										   otherButtonTitles:@"Implied Calculator", nil];
	alert.tag = 0;
	[alert show];
	[alert release];
	NSLog(@"End of ALERT!!!!");
	
	[type release];
}


- (void)greekViewControllerDidFinish:(GreekViewController *)greekController{
	[self dismissModalViewControllerAnimated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([alertView tag] == 0) {
		/*
		if (buttonIndex == 2) {
			GreekViewController *greekController = [[GreekViewController alloc] initWithNibName:@"GreekView" bundle:nil];
			NSLog(@"Greek show 0000001");
			greekController.greekDelegate = self;
			NSLog(@"Greek show 0000002");
			greekController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
			NSLog(@"Greek show 0000003");
			[self presentModalViewController:greekController animated:YES];
			NSLog(@"Greek show 0000004");
			[greekController release];
			/*
			ImpliedViewController *view1 = [[ImpliedViewController alloc]initWithNibName:@"ImpliedView" bundle:nil];
			self.graphView = view1;
			[self.view addSubview:graphView.view];
			[view1 release];
			graphView.label1.text = self.stockPrice.text;
			 */
		if (buttonIndex == 1) {
			ImpliedViewController *impliedController = [[ImpliedViewController alloc] initWithNibName:@"ImpliedView" bundle:nil];
			NSLog(@"Implied show 0000001");
			impliedController.impliedDelegate = self;
			NSLog(@"Implied show 0000002");
			impliedController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
			NSLog(@"Implied show 0000003");
			[self presentModalViewController:impliedController animated:YES];
			NSLog(@"Implied show 0000004");
			[impliedController release];
		}
		
	}
}

//S = Stock price    X = Strike price    T = Years to maturity-----maturity    r = Risk-free rate     v = Volatility
- (double)BlackScholes:(NSString *)type: (double)S: (double)X: (double)T: (double)r: (double)v{
	NSLog(@"Beginning of Calculation in BlackScholes Function, the value of S is %f", S);
	double optionStock = S;
	double optionStrike = X;
	double optionTime = T;
	double optionRate = r;
	double optionVolatility = v;
	double d1, d2;
	double optionPrice; 
	
	NSLog(@"optionStock:%f", optionStock);
	NSLog(@"optionStrike:%f", optionStrike);
	NSLog(@"optionTime:%f", optionTime);
	NSLog(@"optionRate:%f", optionRate);
	NSLog(@"optionVolatility:%f", optionVolatility);
	//NSLog(@"optionStock:%f", optionStock);
	//NSLog(@"optionStock:%f", optionStock);
	
	d1 = (log(optionStock / optionStrike) + (optionRate + optionVolatility * optionVolatility / 2) * optionTime ) / ( optionVolatility * sqrt(optionTime) );
	d2 = d1 - optionVolatility * sqrt(optionTime);
	double nd1 = [self CND:d1];
	NSLog(@"ND1 is %f", nd1);
	double nd2 = [self CND:d2];
	NSLog(@"ND2 is %f", nd2);
	
	NSLog(@"d1 = %f and d2 = %f have been calculated here", d1, d2);
	NSLog(@"The OPTION TYPE is %@", type);
	if (type == @"c") {
		NSLog(@"Call option test");
		NSLog(@"BEFORE:The value of option price is %f", optionPrice);
		//optionStock * nd1 - 
		optionPrice = optionStock * [self CND:d1] - optionStrike * exp(-optionRate * optionTime) * nd2;
		NSLog(@"LAST:The value of option price is %f", optionPrice);
	}else {
		NSLog(@"Not a CALL option");
	}
	
	if (type == @"p") {
		NSLog(@"PUT option test");
		NSLog(@"BEFORE:The value of option price is %f", optionPrice);
		optionPrice = optionStrike * exp(-optionRate * optionTime) * [self CND:-d2] - optionStock * [self CND:-d1];
		NSLog(@"LAST:The value of option price is %f", optionPrice);
	}else {
		NSLog(@"Not a PUT option");
	}
	
	return optionPrice;
}

//Cumulative Normal Distribution function
- (double)CND:(double)x{
	//double a0 = 0.33267;
	//double a1 = 0.4361836;
	//double a2 = -0.1201676;
	//double a3 = 0.9372980;
	
 	NSLog(@"CND Function has been used!");
	//double k = 1 / (1 + a0 * x);
	
	//Cumulative (Normal) Distribution Function -- CDF
	double temp = x / sqrt(2.0);
	
	double CDF = 0.5 * (1.0 + [self ERF:temp]);
	
	
	//(1 / (2 * sqrt(2 * Pi))) * exp(-(x*x/2));
	//double CDF = 1 - (a1 * k + a2 * pow(k, 2) + a3 * pow(k, 3)) * temp;
	
	NSLog(@"CND vale is %f", CDF);			   
	return CDF;
}

//Error Function for approximation
- (double)ERF:(double)X{
	double a0 = 1; double a1 = -1/3; double a2 = 1/10; double a3 = -1/42;
	double a4 = 1/216; double a5 = -1/1320; double a6 = 1/9360;
	
	double ERF = (2 / sqrt(Pi)) * (a0 * X + a1 * pow(X, 3) + a2 * pow(X, 5) + a3 * pow(X, 7) + a4 * pow(X, 9) + a5 * pow(X, 11) + a6 * pow(X, 13));
	return ERF;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
}



- (void)impliedViewControllerDidFinish:(ImpliedViewController *)impliedController{
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)IVShow:(id)sender{
	ImpliedViewController *impliedController = [[ImpliedViewController alloc] initWithNibName:@"ImpliedView" bundle:nil];
	NSLog(@"Implied show 0000001");
	impliedController.impliedDelegate = self;
	NSLog(@"Implied show 0000002");
	impliedController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	NSLog(@"Implied show 0000003");
	[self presentModalViewController:impliedController animated:YES];
	NSLog(@"Implied show 0000004");
	[impliedController release];
}

- (IBAction)GreekShow:(id)sender{
	GreekViewController *greekController = [[GreekViewController alloc] initWithNibName:@"GreekView" bundle:nil];
	NSLog(@"Greek show 0000001");
	greekController.greekDelegate = self;
	NSLog(@"Greek show 0000002");
	greekController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
	NSLog(@"Greek show 0000003");
	[self presentModalViewController:greekController animated:YES];
	NSLog(@"Greek show 0000004");
	[greekController release];
}

-(IBAction)calDone{
	[self.calDelegate calViewControllerDidFinish:self]; 
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
    //[super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	//[calBtn release];
	//[graphView release];
    [super dealloc];
}


@end
