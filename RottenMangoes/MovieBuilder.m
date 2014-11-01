//
//  MovieBuilder.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MovieBuilder.h"
#import "Movie.h"
#import "MovieMO.h"
#import "MovieMO+Management.h"

@implementation MovieBuilder

-(void)getMoviesFromRottenMangoes:(NSURL*)url withCompletion: (void (^)(NSMutableArray *movies))completion{
    //code here instead

    self.moviesArray = [NSMutableArray array];
    
    // Return the array of Movie objects
    //pass this in at the end of asynchronous call, completion(nil) upon error.
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        ////////////TO ADD: Check to make sure the server didn't respond with a "Not Authorized"
        
        //handle response
        NSDictionary *jsonDictionary = [self processResponseUsingData:data];
        
        // Get an array of dictionaries with the key "movies"
        NSArray *dictsArray = [jsonDictionary valueForKey:@"movies"];
        
        CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
        NSManagedObjectContext *MOC = [coreDataStack managedObjectContext];
        
        // Iterate through the array of dictionaries
        for(id currentMovie in dictsArray) {
            // Create a new Movie object for each one and initialise it with information in the dictionary
            MovieMO *movie = [MovieMO itemWithJSONDictionary:currentMovie inManagedObjectContext:MOC];
            [self.moviesArray addObject:movie];
        }
        
//        CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
//        [coreDataStack saveContext];
        
        completion(self.moviesArray);
        
    }];
    
    [task resume];
    
}

#pragma mark - Private

// Helper method, maybe just make it a category..
- (NSDictionary*)processResponseUsingData:(NSData*)data {
    NSError *parseJsonError = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingAllowFragments error:&parseJsonError];
    if (!parseJsonError) {
//        NSLog(@"json data = %@", jsonDict);
    }
    
    return jsonDict;
}



@end
