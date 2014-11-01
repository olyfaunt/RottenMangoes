//
//  MyTableViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieBuilder.h"
#import "MovieCell.h"
#import "MapViewController.h"
#import "CoreDataStack.h"
#import <CoreData/CoreData.h>
#import "MovieMO.h"
#import "ShowtimeMO.h"
#import "TheatreMO.h"

@interface MyTableViewController : UITableViewController <UITextViewDelegate>

@property (nonatomic, strong) MovieMO *movie;
@property (nonatomic, strong) NSMutableArray *reviewsArray;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UITextView *synopsisTextView;
@property (weak, nonatomic) IBOutlet UILabel *criticLabel;
@property (weak, nonatomic) IBOutlet UITextView *reviewsTextView;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)goBack:(id)sender;

@end
