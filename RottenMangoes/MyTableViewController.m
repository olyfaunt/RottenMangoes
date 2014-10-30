//
//  MyTableViewController.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.reviewsArray = [NSMutableArray array];
    
    self.titleLabel.text = self.movie.title;
    self.yearLabel.text = [self.movie.year stringValue];
    self.ratingLabel.text = self.movie.rating;
    self.releaseDateLabel.text = self.movie.theaterReleaseDate;
    self.synopsisTextView.text = self.movie.synopsis;

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSString *urlNumber = self.movie.idNumber;
    
    NSString *first=@"http://api.rottentomatoes.com/api/public/v1.0/movies/";
    NSString *second=urlNumber;
    NSString *third=@"/reviews.json?apikey=c9zzxwtuc3q2tftqata3k59w&page_limit=3";
    
    NSArray *myStrings = [[NSArray alloc] initWithObjects:first, second, third, nil];
    NSString *joinedString = [myStrings componentsJoinedByString:@""];
    
    NSString *dataUrl = joinedString;
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    ReviewsBuilder *reviewsBuilder = [[ReviewsBuilder alloc] init];
    
    [reviewsBuilder getReviewsFromRottenMangoes:url withCompletion:^(NSMutableArray *reviews) {
        [self.reviewsArray addObjectsFromArray:reviews];
        NSLog(@"self.reviewsArray: %@", self.reviewsArray);
        NSLog(@"reviews: %@", reviews);
                dispatch_async(dispatch_get_main_queue(), ^{
                    // Update the UI
                    
                    Reviews *reviewOne = self.reviewsArray[0];
                    self.criticLabel.text = reviewOne.critic;
                    self.reviewsTextView.text = reviewOne.quote;
                    
                });
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

- (IBAction)goBack:(id)sender {
    [self dismissSelf];
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
