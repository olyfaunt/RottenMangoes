//
//  MyCollectionViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieBuilder.h"
#import "Movie.h"
#import "MovieCell.h"
#import "MyTableViewController.h"
#import "Reviews.h"
#import "ReviewsBuilder.h"
//#import "AFNetworking.h"
#import "UIImageView+WebCache.h"

@interface MyCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *movies;
@property (nonatomic, strong) NSMutableArray *reviewsArray;

@end
