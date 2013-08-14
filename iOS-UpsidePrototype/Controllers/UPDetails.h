//
//  UPDetails.h
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UPMap.h"
#import "DMPromotion.h"
#import "ScreenshotUtils.h"

@interface UPDetails : UIViewController

// Variables.
@property (strong, nonatomic) IBOutlet ScreenshotUtils* xScreenshotUtils;

// IBOutlet.
@property (strong, nonatomic) IBOutlet UIView* xView_Main;
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_BackButton;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer* xGesture_BackButtonTap;
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_ProductImage;
@property (strong, nonatomic) IBOutlet UILabel* xLabel_ProductTitle;
@property (strong, nonatomic) IBOutlet UILabel* xLabel_ProductPrice;
@property (strong, nonatomic) IBOutlet UILabel* xLabel_Redeem;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer* xGesture_RedeemTap;



// IBAction.
-(IBAction)backButtonTapped:(id)sender;
-(IBAction)RedeemTapped:(id)sender;


@end
