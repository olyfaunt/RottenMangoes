//
//  TheatreBuilder.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "TheatreBuilder.h"
#import "TheatreMO+Management.h"

@implementation TheatreBuilder



-(void)getTheatres:(NSURL*)url withCompletion: (void (^)(NSMutableArray *theatres))completion {
    
    self.theatresArray = [NSMutableArray array];
    
    // Return the array of Theatre Objects
    //pass this in at the end of asynchronous call, completion(nil) upon error.
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        ////////////TO ADD: Check to make sure the server didn't respond with a "Not Authorized"
        
        //handle response
        NSDictionary *jsonDictionary = [self processResponseUsingData:data];
        
        // Get an array of dictionaries with the key "theatres"
        NSArray *dictsArray = [jsonDictionary valueForKey:@"theatres"];
        
        CoreDataStack *coreDataStack = [CoreDataStack defaultStack];
        NSManagedObjectContext *MOC = [coreDataStack managedObjectContext];

        // Iterate through the array of dictionaries
        for(id currentTheatre in dictsArray) {
            // Create a new Movie object for each one and initialise it with information in the dictionary
            TheatreMO *theatre = [TheatreMO itemWithJSONDictionary:currentTheatre inManagedObjectContext:MOC];
            [self.theatresArray addObject:theatre];
        }
        
        //return block only when completion(true)
        completion(self.theatresArray);
        
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
