//
//  UPDetails.m
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "UPDetails.h"

@interface UPDetails ()

@end

@implementation UPDetails

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Initialize variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_StoreBooklet_Details:) name:NOTIFICATION_STOREBOOKLET_DETAILS object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////////////////

-(void)notification_StoreBooklet_Details:(NSNotification*) notification
{
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_STOREBOOKLET_DETAILS_DK_SCREENSHOT];
    DMPromotion* dmPromotion = [data objectForKey:NOTIFICATION_STOREBOOKLET_DETAILS_DK_DATA];
    
    // Create a screenshot view.
    UIImageView* screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    screenshot.image = image;
    [self.view addSubview:screenshot];
    
    // Reposition/Update the mainView.
    self.xView_Main.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.xImageView_ProductImage.image = dmPromotion.xImage;
    self.xLabel_ProductTitle.text = dmPromotion.ProductTitle;
    self.xLabel_ProductPrice.text = dmPromotion.ProductPrice;
    
    // Annimate.
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
     {
         [screenshot setFrame:CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
         [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     }
                     completion:^(BOOL finished){
                         [screenshot removeFromSuperview];
                     }];
}

//////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
//////////////////////////////////////////////////////////////////

-(IBAction)backButtonTapped:(id)sender
{
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_STOREBOOKLET_RETURN_DK_SCREENSHOT,
                          nil];
    
    [self dismissViewControllerAnimated:NO completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_STOREBOOKLET_RETURN object:data];
    }];
}

-(IBAction)RedeemTapped:(id)sender
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hi Upside Team!"
                                                      message:@"This is the extend of the prototype... just wanted to give you a sneak peak of my capabilities."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

@end
