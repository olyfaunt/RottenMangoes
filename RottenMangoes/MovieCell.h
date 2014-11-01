//
//  MovieCell.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-29.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UICollectionViewCell <UIGestureRecognizerDelegate>

@property(nonatomic, strong) IBOutlet UILabel *movieLabel;
@property(nonatomic, strong) IBOutlet UIImageView *moviePoster;

@end
