//
//  MyTableViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieBuilder.h"
#import "Movie.h"
#import "MovieCell.h"
#import "ReviewsBuilder.h"
#import "Reviews.h"
#import "MapViewController.h"

@interface MyTableViewController : UITableViewController <UITextViewDelegate>

@property (nonatomic, strong) Movie *movie;
@property (nonatomic, strong) NSMutableArray *reviewsArray;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UITextView *synopsisTextView;
@property (weak, nonatomic) IBOutlet UILabel *criticLabel;
@property (weak, nonatomic) IBOutlet UITextView *reviewsTextView;

- (IBAction)goBack:(id)sender;

@end
