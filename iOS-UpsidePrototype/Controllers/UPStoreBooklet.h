//
//  UPStoreBooklet.h
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UPMap.h"
#import "UPCollectionViewCell.h"
#import "DMPromotion.h"
#import "ScreenshotUtils.h"

@interface UPStoreBooklet : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


// Variables.
@property (strong, nonatomic) NSMutableArray* xMutableArray;
@property (strong, nonatomic) ScreenshotUtils* xScreenshotUtils;

// IBOutlets.
@property (strong, nonatomic) IBOutlet UIView* xView_Main;
@property (strong, nonatomic) IBOutlet UIImageView* xImageView_BackButton;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer* xGesture_BackButtonTap;
@property (strong, nonatomic) IBOutlet UICollectionView* xCollectionView;


// IBActions.
-(IBAction)backButtonTapped:(id)sender;

@end
