//
//  TheatreMO.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-31.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface TheatreMO : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * idNumber;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic, retain) NSSet *showtime;
@end

@interface TheatreMO (CoreDataGeneratedAccessors)

- (void)addShowtimeObject:(NSManagedObject *)value;
- (void)removeShowtimeObject:(NSManagedObject *)value;
- (void)addShowtime:(NSSet *)values;
- (void)removeShowtime:(NSSet *)values;

//- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@end
