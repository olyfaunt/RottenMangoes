//
//  MapViewController.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController (){
    CLLocationManager *_locationManager;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //we need to do this to make showsUserlocation work
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = true;
    
    MKPointAnnotation *marker=[[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D cityHallLocation;
    cityHallLocation.latitude = 49.2607834;
    cityHallLocation.longitude = -123.1151686;
    
    marker.coordinate = cityHallLocation;
    marker.title = @"Vancouver City Hall";
    
    [self.mapView addAnnotation:marker];
    
    self.theatresArray = [NSMutableArray array];
    
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)_annotation {
    
    //like cellforpath it only runs when it's visible
    
    if (_annotation == self.mapView.userLocation){
        return nil; //default to blue dot
    }
    
    static NSString* annotationIdentifier = @"cityHallAnnotation";
    
    MKAnnotationView* pinView = (MKAnnotationView *)
    [self.mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
    
    if (!pinView) {
        // if an existing pin view was not available, create one
        pinView = [[MKPinAnnotationView alloc]
                   initWithAnnotation:_annotation reuseIdentifier:annotationIdentifier];
    }
    pinView.tintColor = [UIColor greenColor];
    pinView.canShowCallout = YES;
    //pinView.calloutOffset = CGPointMake(-7, 0);
    //pinView.draggable = false;
    return pinView;
    
}

//set region to center around userlocation coordinates
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views{
    for(MKAnnotationView *annotationView in views) {
        if(annotationView.annotation == mapView.userLocation){
            MKCoordinateRegion region;
            MKCoordinateSpan span;
            
            span.latitudeDelta=0.05;
            span.longitudeDelta=0.05;
            
            CLLocationCoordinate2D location = mapView.userLocation.coordinate;
            
            location = mapView.userLocation.location.coordinate;
            
            region.span = span;
            region.center = location;
            [mapView setRegion:region animated:TRUE];
            [mapView regionThatFits:region];
            
            [self reverseGeocode:_locationManager.location];
        }
    }
}

//use clgeocoder to derive user-friendly address of location from userlocation coordinates
- (void)reverseGeocode:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Finding address");
        if (error) {
            NSLog(@"Error %@", error.description);
            
            //only run once you get placemarks:
        } else if (placemarks){
            MKPlacemark *placemark = [placemarks lastObject];
            NSString *fullAddress = [placemark.addressDictionary description];
            NSLog(@"Full address: %@", fullAddress);
            self.myAddress = [NSString stringWithFormat:@"%@", ABCreateStringWithAddressDictionary(placemark.addressDictionary, NO)];
            NSString *tempPostal = placemark.postalCode;
            self.myPostalCode = [tempPostal stringByReplacingOccurrencesOfString:@" " withString:@""];
            NSLog(@"self.myAddress: %@", self.myAddress);
            NSLog(@"self.myPostalCode %@", self.myPostalCode);
            
            NSString *movieTitle = self.movie.title;
            NSString *newMovieTitle = [movieTitle stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
            
            NSString *first=@"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?address=";
            NSString *second=self.myPostalCode;
            NSString *third=@"&movie=";
            NSString *fourth=newMovieTitle;
            
            NSString *joinedString2 = [NSString stringWithFormat:@"%@%@%@%@",first,second,third,fourth];
            
            NSString *dataUrl = joinedString2;
            NSURL *url = [NSURL URLWithString:dataUrl];
            
            TheatreBuilder *theatreBuilder = [[TheatreBuilder alloc] init];
            
            [theatreBuilder getTheatres:url withCompletion:^(NSMutableArray *theatres) {
            
                [self.theatresArray addObjectsFromArray:theatres]; //get the completed theatresArray from the completion block. then run the following code:
                NSLog(@"theatres: %@", theatres);
                NSLog(@"self.theatresArray: %@", self.theatresArray);
                
                for (Theatre* currentTheatre in self.theatresArray) {
                    MKPointAnnotation *marker = [[MKPointAnnotation alloc] init];
                    CLLocationCoordinate2D theatreLocation;
                    theatreLocation.latitude = [currentTheatre.latitude doubleValue];
                    theatreLocation.longitude = [currentTheatre.longitude doubleValue];
                    marker.coordinate = theatreLocation;
                    marker.title = currentTheatre.name;
                    [self.mapView addAnnotation:marker];
                }
                
            }];

        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goBack:(id)sender {
    [self dismissSelf];
}

- (void)dismissSelf {
    [self.presentingViewController dismissViewControllerAnimated:UITableViewRowAnimationRight completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
