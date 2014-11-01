//
//  MovieMO+Management.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-11-01.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MovieMO+Management.h"

@implementation MovieMO (Management)

+ (MovieMO*)itemWithJSONDictionary:(NSDictionary *)jsonDictionary inManagedObjectContext:(NSManagedObjectContext *)context {
    MovieMO* movie = (MovieMO*)[NSEntityDescription insertNewObjectForEntityForName:@"MovieMO" inManagedObjectContext:context];
    movie.title = [jsonDictionary objectForKey:@"title"];
    NSNumber *myYear = [jsonDictionary objectForKey:@"year"];
    movie.year = [myYear stringValue];
    movie.idNumber = [jsonDictionary objectForKey:@"id"];
    movie.rating = [jsonDictionary objectForKey:@"mpaa_rating"];
    NSDictionary *releaseDictionary = [jsonDictionary objectForKey:@"release_dates"];
    movie.theaterReleaseDate = [releaseDictionary objectForKey:@"theater"];
    movie.synopsis = [jsonDictionary objectForKey:@"synopsis"];
    NSDictionary *linksDictionary = [jsonDictionary objectForKey:@"links"];
    movie.reviews = [linksDictionary objectForKey:@"reviews"];
    NSDictionary *postersDictionary = [jsonDictionary objectForKey:@"posters"];
    movie.posterPic = [postersDictionary objectForKey:@"thumbnail"];
    
    return movie;
}

@end