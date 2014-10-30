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
@property (nonatomic, strong) NSURLSessionDataTask *downloadTask;

-(void)getMoviesFromRottenMangoes:(NSURL*)url withCompletion: (void (^)(NSMutableArray *movies))completion;

@end
