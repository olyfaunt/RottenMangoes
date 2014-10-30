//
//  MapViewController.h
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLGeocoder.h>
#import <CoreLocation/CLPlacemark.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Theatre.h"
#import "TheatreBuilder.h"
#import "Movie.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

- (IBAction)goBack:(id)sender;

@property (nonatomic, strong) Movie *movie;
@property (nonatomic, strong) NSMutableArray *theatresArray;

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLGeocoder *myGeocoder;
@property (strong, nonatomic) NSString *myAddress;
@property (strong, nonatomic) NSString *myPostalCode;

@end
