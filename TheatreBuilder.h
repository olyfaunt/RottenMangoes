//
//  TheatreBuilder.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TheatreMO.h"

@interface TheatreBuilder : NSObject

@property (nonatomic, strong) NSMutableArray *theatresArray;

-(void)getTheatres:(NSURL*)url withCompletion: (void (^)(NSMutableArray *theatres))completion;

@end
