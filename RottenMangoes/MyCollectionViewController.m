//
//  MyCollectionViewController.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController () <UICollectionViewDataSource>

@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString *const kIdentifier = @"MovieCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movies = [NSMutableArray array];
    self.reviewsArray = [NSMutableArray array];
    
    NSString *dataUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=c9zzxwtuc3q2tftqata3k59w&page_limit=50";
    NSURL *url = [NSURL URLWithString:dataUrl];
    
    MovieBuilder *movieBuilder = [[MovieBuilder alloc] init];
    
    [movieBuilder getMoviesFromRottenMangoes:url withCompletion:^(NSMutableArray *movies) {
        [self.movies addObjectsFromArray:movies];

        dispatch_async(dispatch_get_main_queue(), ^{
            // Update the UI
            [self.collectionView reloadData];
        });
        
    }];

    
    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.movies count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    Movie *movie = [self.movies objectAtIndex:indexPath.item];
    cell.movieLabel.text = movie.title;
     
    return cell;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetails"]) {
        
        UICollectionViewCell *cell = sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        
        UINavigationController *navigationController = segue.destinationViewController;
        MyTableViewController *tableViewController = (MyTableViewController *)[navigationController topViewController];
        tableViewController.movie = [self.movies objectAtIndex:indexPath.item];
        
        
//        //
//        Movie *aMovie = [self.movies objectAtIndex:indexPath.item];
//        NSString *urlNumber = aMovie.idNumber;
//        
//        NSString *first=@"http://api.rottentomatoes.com/api/public/v1.0/movies/";
//        NSString *second=urlNumber;
//        NSString *third=@"/reviews.json?apikey=c9zzxwtuc3q2tftqata3k59w&page_limit=3";
//        
//        NSArray *myStrings = [[NSArray alloc] initWithObjects:first, second, third, nil];
//        NSString *joinedString = [myStrings componentsJoinedByString:@""];
//        
//        NSString *dataUrl = joinedString;
//        NSURL *url = [NSURL URLWithString:dataUrl];
//        
//        ReviewsBuilder *reviewsBuilder = [[ReviewsBuilder alloc] init];
//        
//        [reviewsBuilder getReviewsFromRottenMangoes:url withCompletion:^(NSMutableArray *reviews) {
//            [self.reviewsArray addObjectsFromArray:reviews];
//            NSLog(@"self.reviewsArray: %@", self.reviewsArray);
//            //        dispatch_async(dispatch_get_main_queue(), ^{
//            //            // Update the UI
//            //            [self.collectionView reloadData];
//            //        });
//            
//        }];
//        
//        //
//        tableViewController.reviewsArray = self.reviewsArray;
    }
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/
@end
