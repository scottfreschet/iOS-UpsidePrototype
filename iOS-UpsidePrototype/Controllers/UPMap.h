//
//  UPMap.h
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScreenshotUtils.h"

// Notification Constants
extern NSString* const NOTIFICATION_MAP_STOREBOOKLET;
extern NSString* const NOTIFICATION_MAP_STOREBOOKLET_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_MAP_RETURN;
extern NSString* const NOTIFICATION_MAP_RETURN_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_STOREBOOKLET_DETAILS;
extern NSString* const NOTIFICATION_STOREBOOKLET_DETAILS_DK_SCREENSHOT;
extern NSString* const NOTIFICATION_STOREBOOKLET_DETAILS_DK_DATA;
extern NSString* const NOTIFICATION_STOREBOOKLET_RETURN;
extern NSString* const NOTIFICATION_STOREBOOKLET_RETURN_DK_SCREENSHOT;

@interface UPMap : UIViewController

// Variables.
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIView* xView_Main;
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_Map;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer* xGesture_MapTap;

// IBActions.
-(IBAction)MapTapped:(id)sender;

@end
