//
//  Theatre.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Theatre : NSObject <MKAnnotation>

@property (readwrite) NSString *name;
@property (readwrite) NSString *address;
@property (readwrite) NSString *idNumber;
@property (readwrite) NSNumber *latitude;
@property (readwrite) NSNumber *longitude;

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@end
