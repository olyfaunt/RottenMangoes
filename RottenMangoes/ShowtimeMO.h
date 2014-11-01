//
//  ShowtimeMO.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-31.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class TheatreMO;

@interface ShowtimeMO : NSManagedObject

@property (nonatomic) NSTimeInterval lastUpdated;
@property (nonatomic, retain) NSManagedObject *movie;
@property (nonatomic, retain) TheatreMO *theatre;

@end
