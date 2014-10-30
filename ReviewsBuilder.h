//
//  ReviewsBuilder.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reviews.h"

@interface ReviewsBuilder : NSObject

@property (nonatomic, strong) NSMutableArray *reviewsArray;

-(void)getReviewsFromRottenMangoes:(NSURL*)url withCompletion: (void (^)(NSMutableArray *reviews))completion;

@end
