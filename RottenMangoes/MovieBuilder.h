//
//  MovieBuilder.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieBuilder : NSObject

@property (nonatomic, strong) NSMutableArray *moviesArray;

-(void)getMoviesFromRottenMangoes:(NSURL*)url withCompletion: (void (^)(NSMutableArray *movies))completion;

@end
