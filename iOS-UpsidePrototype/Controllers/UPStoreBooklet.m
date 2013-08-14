//
//  UPStoreBooklet.m
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import "UPStoreBooklet.h"

@interface UPStoreBooklet ()

@end

@implementation UPStoreBooklet

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
    
    // Instantiate variables.
    self.xScreenshotUtils = [[ScreenshotUtils alloc]init];
    
    self.xMutableArray = [[NSMutableArray alloc]init];
    
    DMPromotion* promo1 = [[DMPromotion alloc]init];
    promo1.xImage = [UIImage imageNamed:@"Pix_CokeCan.jpeg"];
    promo1.ProductTitle = @"Coke 12oz 6-pack";
    promo1.ProductPrice = @"$2.00";
    [self.xMutableArray addObject:promo1];
    
    DMPromotion* promo2 = [[DMPromotion alloc]init];
    promo2.xImage = [UIImage imageNamed:@"Pix_DrPepperCan.jpeg"];
    promo2.ProductTitle = @"Dr Pepper 12oz 6-pack";
    promo2.ProductPrice = @"$1.00";
    [self.xMutableArray addObject:promo2];
    
    DMPromotion* promo3 = [[DMPromotion alloc]init];
    promo3.xImage = [UIImage imageNamed:@"Pix_MtnDewCan.jpeg"];
    promo3.ProductTitle = @"Mountain Dew 12oz 6-pack";
    promo3.ProductPrice = @"$1.50";
    [self.xMutableArray addObject:promo3];
    
    DMPromotion* promo4 = [[DMPromotion alloc]init];
    promo4.xImage = [UIImage imageNamed:@"Pix_PepsiCan.jpeg"];
    promo4.ProductTitle = @"Pepsi 12oz 6-pack";
    promo4.ProductPrice = @"$2.00";
    [self.xMutableArray addObject:promo4];
    
    DMPromotion* promo5 = [[DMPromotion alloc]init];
    promo5.xImage = [UIImage imageNamed:@"Pix_SpriteCan.jpeg"];
    promo5.ProductTitle = @"Sprite 12oz 6-pack";
    promo5.ProductPrice = @"$0.50";
    [self.xMutableArray addObject:promo5];
    
    
    // Register notification callbacks.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_Map_StoreBooklet:) name:NOTIFICATION_MAP_STOREBOOKLET object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification_StoreBooklet_Return:) name:NOTIFICATION_STOREBOOKLET_RETURN object:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////
#pragma mark - Notification Handlers
//////////////////////////////////////////////////////////////////

-(void)notification_Map_StoreBooklet:(NSNotification*) notification
{
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_MAP_STOREBOOKLET_DK_SCREENSHOT];
    
    // Create a screenshot view.
    UIImageView* screenshot = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    screenshot.image = image;
    [self.view addSubview:screenshot];
    
    // Reposition the mainView.
    self.xView_Main.frame = CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
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

-(void)notification_StoreBooklet_Return:(NSNotification*) notification
{
    // Grab the notification data.
    NSDictionary* data = [notification object];
    UIImage* image = [data objectForKey:NOTIFICATION_STOREBOOKLET_RETURN_DK_SCREENSHOT];
    
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

//////////////////////////////////////////////////////////////////
#pragma mark - IBActions.
//////////////////////////////////////////////////////////////////

-(IBAction)backButtonTapped:(id)sender
{
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_MAP_RETURN_DK_SCREENSHOT,
                          nil];
    
    [self dismissViewControllerAnimated:NO completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_MAP_RETURN object:data];
    }];
}


///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Datasource
///////////////////////////////////////////////////////////////////

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.xMutableArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Get dmPromotion.
    DMPromotion* dmPromotion = [self.xMutableArray objectAtIndex:indexPath.row];
    
    // Populate cell..
    UPCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.xImageView.image = dmPromotion.xImage;
    cell.xLabel_Product.text = dmPromotion.ProductTitle;
    cell.xLabel_Price.text = dmPromotion.ProductPrice;
    
    return cell;
}

///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Delegate
///////////////////////////////////////////////////////////////////

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"item at position: %d selected", indexPath.row);
    
    // Get screenshot.
    UIImage* screenshot = [self.xScreenshotUtils getScreenshotImage:self];
    
    // Grab data for touched DMPromotion.
    DMPromotion* dmPromotion = [self.xMutableArray objectAtIndex:indexPath.row];
    
    // Prepare notification with data.
    NSDictionary* data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          screenshot, NOTIFICATION_STOREBOOKLET_DETAILS_DK_SCREENSHOT,
                          dmPromotion, NOTIFICATION_STOREBOOKLET_DETAILS_DK_DATA,
                          nil];
    
    
    // Present appropriate viewController.
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController* UPDetails = [storyboard instantiateViewControllerWithIdentifier:@"UPDetails"];
    [self presentViewController:UPDetails animated:NO completion:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_STOREBOOKLET_DETAILS object:data];
    }];
    
}

///////////////////////////////////////////////////////////////////
#pragma mark - UICollectionView Delegate (FlowLayout)
///////////////////////////////////////////////////////////////////

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cellSize = CGSizeMake(160, 200);
    return cellSize;
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}



@end
