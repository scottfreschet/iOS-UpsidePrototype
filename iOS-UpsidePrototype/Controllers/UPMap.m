//
//  UPMap.m
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "UPMap.h"

///////////////////////////////////////
#pragma mark - Notification Constants
///////////////////////////////////////
NSString* const NOTIFICATION_MAP_STOREBOOKLET = @"notification_map_storebooklet";
NSString* const NOTIFICATION_MAP_STOREBOOKLET_DK_SCREENSHOT = @"notification_map_storebooklet_dk_screenshot";
NSString* const NOTIFICATION_MAP_RETURN = @"notification_map_return";
NSString* const NOTIFICATION_MAP_RETURN_DK_SCREENSHOT = @"notification_map_return_dk_screenshot";
NSString* const NOTIFICATION_STOREBOOKLET_DETAILS = @"notification_storebooklet_details";
NSString* const NOTIFICATION_STOREBOOKLET_DETAILS_DK_SCREENSHOT = @"notification_storebooklet_details_dk_screenshot";
NSString* const NOTIFICATION_STOREBOOKLET_DETAILS_DK_DATA = @"notification_storebooklet_details_dk_data";
NSString* const NOTIFICATION_STOREBOOKLET_RETURN = @"notification_storebooklet_return";
NSString* const NOTIFICATION_STOREBOOKLET_RETURN_DK_SCREENSHOT = @"notification_storebooklet_return_dk_screenshot";

@interface UPMap ()
@end

@implementation UPMap

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Map_Return:) name:NOTIFICATION_MAP_RETURN object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////////////////

-(void)notification_Map_Return:(NSNotification*) notification
{
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_MAP_RETURN_DK_SCREENSHOT];
    
    // Create a screenshot view.
    UIImageView* screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    screenshot.image = image;
    [self.view addSubview:screenshot];
    
    // Reposition the mainView.
    self.xView_Main.frame = CGRectMake(-self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    // Annimate.
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^
     {
         [screenshot setFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
         [self.xView_Main setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
     }
                     completion:^(BOOL finished){
                         [screenshot removeFromSuperview];
                     }];
}

////////////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
////////////////////////////////////////////////////////////////////////
-(IBAction)MapTapped:(id)sender
{
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_MAP_STOREBOOKLET_DK_SCREENSHOT,
                          nil];
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* UPStoreBooklet = [storyboard instantiateViewControllerWithIdentifier:@"UPStoreBooklet"];
    [self presentViewController:UPStoreBooklet animated:NO completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_MAP_STOREBOOKLET object:data];
    }];
}

@end
