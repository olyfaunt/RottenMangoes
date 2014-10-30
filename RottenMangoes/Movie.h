//
//  Movie.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readwrite) NSString *title;
@property (readwrite) NSNumber *year;
@property (readwrite) NSString *idNumber;
@property (readwrite) NSString *rating;
@property (readwrite) NSString *theaterReleaseDate;
@property (readwrite) NSString *synopsis;
@property (readwrite) NSURL *reviews;
@property (readwrite) NSString *posterPic;

@end
