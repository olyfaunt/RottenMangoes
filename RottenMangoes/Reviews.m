//
//  Reviews.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "Reviews.h"

@implementation Reviews

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    
    if (self = [self init]) {
        self.critic = [jsonDictionary objectForKey:@"critic"];
        self.quote = [jsonDictionary objectForKey:@"quote"];
        
    }
    return self;
}


@end
