//
//  Theatre.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    
    if (self = [self init]) {
        self.name = [jsonDictionary objectForKey:@"name"];
        self.address = [jsonDictionary objectForKey:@"address"];
        self.idNumber = [jsonDictionary objectForKey:@"id"];
        self.latitude = [jsonDictionary objectForKey:@"lat"];
        self.longitude = [jsonDictionary objectForKey:@"lng"];
        
    }
    return self;
}


@end
