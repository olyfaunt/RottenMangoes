//
//  MapViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, MKAnnotation>


- (IBAction)goBack:(id)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
