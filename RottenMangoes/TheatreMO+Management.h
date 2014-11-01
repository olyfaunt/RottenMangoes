//
//  TheatreMO+Management.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-11-01.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "TheatreMO.h"

@interface TheatreMO (Management)

+ (TheatreMO*)itemWithJSONDictionary:(NSDictionary *)jsonDictionary inManagedObjectContext:(NSManagedObjectContext *)context;

@end
