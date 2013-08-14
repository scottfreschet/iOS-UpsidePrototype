//
//  UPCollectionViewCell.h
//  iOS-UpsidePrototype
//
//  Created by Scott Freschet on 8/14/13.
//  Copyright (c) 2013 Scott Freschet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView* xImageView;
@property (strong, nonatomic) IBOutlet UILabel* xLabel_Product;
@property (strong, nonatomic) IBOutlet UILabel* xLabel_Price;


@end
