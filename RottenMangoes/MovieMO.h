//
//  MovieMO.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-31.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShowtimeMO;

@interface MovieMO : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * year;
@property (nonatomic, retain) NSString * idNumber;
@property (nonatomic, retain) NSString * rating;
@property (nonatomic, retain) NSString * theaterReleaseDate;
@property (nonatomic, retain) NSString * synopsis;
@property (nonatomic, retain) id reviews;
@property (nonatomic, retain) NSString * posterPic;
@property (nonatomic, retain) NSSet *showtime;
@end

@interface MovieMO (CoreDataGeneratedAccessors)

- (void)addShowtimeObject:(ShowtimeMO *)value;
- (void)removeShowtimeObject:(ShowtimeMO *)value;
- (void)addShowtime:(NSSet *)values;
- (void)removeShowtime:(NSSet *)values;

//
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
