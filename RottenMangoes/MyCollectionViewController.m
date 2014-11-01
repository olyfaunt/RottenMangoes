//
//  MyCollectionViewController.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MyCollectionViewController.h"

@interface MyCollectionViewController () <UICollectionViewDataSource, NSFetchedResultsControllerDelegate> {
    NSFetchedResultsController *fetchedResultsController;
    NSArray *arrayOfMovies;
}


@end

@implementation MyCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString *const kIdentifier = @"MovieCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.coreDataStack = [CoreDataStack defaultStack];
    self.managedObjectContext = [self.coreDataStack managedObjectContext];
    
    self.movies = [NSMutableArray array];
//        self.movies = [[self moviesInDatabase] mutableCopy]; //all movies currently in database, FETCHED - but fetch error if empty
    
    //if there we already have an array of movies
    if (self.movies !=nil) {

        self.updatedMovies = [NSMutableArray array];
        
        //get updatedMovies array
        NSString *dataUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=c9zzxwtuc3q2tftqata3k59w&page_limit=50";
        NSURL *url = [NSURL URLWithString:dataUrl];
        MovieBuilder *movieBuilder = [[MovieBuilder alloc] init];
        [movieBuilder getMoviesFromRottenMangoes:url withCompletion:^(NSMutableArray *movies) {
            [self.updatedMovies addObjectsFromArray:movies];
            
            // this block needs to trigger the code w/ enumerations (b/c asynchronous call) *************
            dispatch_async(dispatch_get_main_queue(), ^{
                [self compareMovies];
            });
            
        }];
    }  else if (self.movies == nil) {
        //query RT API, do create all movies as we did originally.
        // create new builder object to help initialize movie attributes from json dictonaries returned from Rotten Tomatoes API
        //[coreDataStack saveContext];
        //dispatch_async - update UI in main queue
        
        //***************************************************************
        
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
        
        
    }

    
    //////////////////////////////////////////////////
    
    // OLD CODE:
//    self.movies = [NSMutableArray array];
//    self.reviewsArray = [NSMutableArray array];
//    self.updatedMovies = [NSMutableArray array];
//    
//    
//    NSString *dataUrl = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=c9zzxwtuc3q2tftqata3k59w&page_limit=50";
//    NSURL *url = [NSURL URLWithString:dataUrl];
//    
//    MovieBuilder *movieBuilder = [[MovieBuilder alloc] init];
//    
//    [movieBuilder getMoviesFromRottenMangoes:url withCompletion:^(NSMutableArray *movies) {
//        [self.movies addObjectsFromArray:movies];
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            // Update the UI
//            [self.collectionView reloadData];
//        });
//        
//    }];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.

}


-(void) compareMovies {
    //for each movie in self.movies database, if {[find in self.updatedMovies]=nil - don't find, delete movie} else {nothing} // compare movieID instead (jsonDictionaries vs movie objects)
//    
//    CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
//    
    for (id currentMovie in self.movies) {
    
        NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray: self.updatedMovies];
        
        if ([countedSet countForObject:currentMovie]==0) {
            [self.managedObjectContext deleteObject:currentMovie];
            [self.coreDataStack saveContext];
            break;
        } else {
            break;
        }
    }
    
    //for each updatedMovie in self.updatedMovies, if {[find in self.movies]=nil - don't find, create new MovieMO object} else {nothing}
    //filtered array with predicate
    
    for (id currentUpdatedMovie in self.updatedMovies) {
        
        NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray: self.movies];
        
        if ([countedSet countForObject:currentUpdatedMovie]==0) {
            
            //create new NSManagedObject, insert it into MOC, and set its attributes, save MOC
            MovieMO *movie = [NSEntityDescription insertNewObjectForEntityForName:@"MovieMO" inManagedObjectContext:self.managedObjectContext];
            movie.title = [currentUpdatedMovie objectForKey:@"title"];
            movie.year = [[currentUpdatedMovie objectForKey:@"year"] stringValue];
            movie.idNumber = [currentUpdatedMovie objectForKey:@"id"];
            movie.rating = [currentUpdatedMovie objectForKey:@"rating"];
            movie.theaterReleaseDate = [[currentUpdatedMovie objectForKey:@"release_dates"] objectForKey:@"theater"];
            movie.synopsis = [currentUpdatedMovie objectForKey:@"synopsis"];
            movie.posterPic = [[currentUpdatedMovie objectForKey:@"posters"] objectForKey:@"thumbnail"];
            
            [self.coreDataStack saveContext];
            break;
        } else {
            break;
        }
        
    }
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
    
    MovieMO *movie = [self.movies objectAtIndex:indexPath.item];
    cell.movieLabel.text = movie.title;
    [cell.moviePoster sd_setImageWithURL:[NSURL URLWithString:movie.posterPic]];
    
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
        tableViewController.managedObjectContext = self.managedObjectContext;
        
    }
}


#pragma mark - NSFetchedResultsController

//get titles of all MovieMOs in database
-(NSArray*)moviesInDatabase {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MoviesMO" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *result = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        
    } else {
        NSLog(@"%@", result);
    }
    
    return result;
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
