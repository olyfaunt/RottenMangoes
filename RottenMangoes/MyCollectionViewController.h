//
//  MyCollectionViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieBuilder.h"
#import "MovieCell.h"
#import "MyTableViewController.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "CoreDataStack.h"
#import <CoreData/CoreData.h>
#import "MovieMO.h"
#import "ShowtimeMO.h"
#import "TheatreMO.h"

@interface MyCollectionViewController : UICollectionViewController <UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *movies;
@property (nonatomic, strong) NSMutableArray *updatedMovies;

@property (nonatomic, strong) NSMutableArray *reviewsArray;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) CoreDataStack *coreDataStack;

@end
