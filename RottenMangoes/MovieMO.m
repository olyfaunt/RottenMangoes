//
//  MovieMO.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-31.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MovieMO.h"
#import "ShowtimeMO.h"


@implementation MovieMO

@dynamic title;
@dynamic year;
@dynamic idNumber;
@dynamic rating;
@dynamic theaterReleaseDate;
@dynamic synopsis;
@dynamic reviews;
@dynamic posterPic;
@dynamic showtime;
//
//- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
//    
//    if (self = [self init]) {
//        self.title = [jsonDictionary objectForKey:@"title"];
//        self.year = [jsonDictionary objectForKey:@"year"];
//        self.idNumber = [jsonDictionary objectForKey:@"id"];
//        self.rating = [jsonDictionary objectForKey:@"mpaa_rating"];
//        NSDictionary *releaseDictionary = [jsonDictionary objectForKey:@"release_dates"];
//        self.theaterReleaseDate = [releaseDictionary objectForKey:@"theater"];
//        self.synopsis = [jsonDictionary objectForKey:@"synopsis"];
//        NSDictionary *linksDictionary = [jsonDictionary objectForKey:@"links"];
//        self.reviews = [linksDictionary objectForKey:@"reviews"];
//        NSDictionary *postersDictionary = [jsonDictionary objectForKey:@"posters"];
//        self.posterPic = [postersDictionary objectForKey:@"thumbnail"];
//        
//    }
//    return self;
//}

@end