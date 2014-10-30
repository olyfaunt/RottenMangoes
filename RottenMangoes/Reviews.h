//
//  Reviews.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reviews : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readwrite) NSString *critic;
@property (readwrite) NSString *quote;

@end
