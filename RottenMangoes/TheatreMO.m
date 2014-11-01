//
//  TheatreMO.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-31.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "TheatreMO.h"


@implementation TheatreMO

@dynamic name;
@dynamic address;
@dynamic idNumber;
@dynamic latitude;
@dynamic longitude;
@dynamic showtime;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    
    if (self = [self init]) {
        self.name = [jsonDictionary objectForKey:@"name"];
        self.address = [jsonDictionary objectForKey:@"address"];
        self.idNumber = [jsonDictionary objectForKey:@"id"];
        self.latitude = [jsonDictionary objectForKey:@"lat"];
        NSDictionary *releaseDictionary = [jsonDictionary objectForKey:@"release_dates"];
        self.theaterReleaseDate = [releaseDictionary objectForKey:@"theater"];
        self.synopsis = [jsonDictionary objectForKey:@"synopsis"];
        NSDictionary *linksDictionary = [jsonDictionary objectForKey:@"links"];
        self.reviews = [linksDictionary objectForKey:@"reviews"];
        NSDictionary *postersDictionary = [jsonDictionary objectForKey:@"posters"];
        self.posterPic = [postersDictionary objectForKey:@"thumbnail"];
        
    }
    return self;
}


@end
