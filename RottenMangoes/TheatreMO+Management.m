//
//  TheatreMO+Management.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-11-01.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "TheatreMO+Management.h"

@implementation TheatreMO (Management)

+ (TheatreMO*)itemWithJSONDictionary:(NSDictionary *)jsonDictionary inManagedObjectContext:(NSManagedObjectContext *)context {
    TheatreMO* theatre = (TheatreMO*)[NSEntityDescription insertNewObjectForEntityForName:@"TheatreMO" inManagedObjectContext:context];
    theatre.name = [jsonDictionary objectForKey:@"name"];
    theatre.address = [jsonDictionary objectForKey:@"address"];
    theatre.idNumber = [jsonDictionary objectForKey:@"id"];
    NSNumber *myLat = [jsonDictionary objectForKey:@"lat"];
    theatre.latitude = [myLat doubleValue];
    NSNumber *myLong = [jsonDictionary objectForKey:@"lng"];
    theatre.longitude = [myLong doubleValue];
    
    return theatre;
}


@end
