//
//  MapViewController.m
//  RottenMangoes
//
//  Created by Audrey Jun on 2014-10-30.
//  Copyright (c) 2014 audreyjun. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = true;
    
    CLLocationCoordinate2D startingLocation;
    startingLocation.latitude =  49.281815;
    startingLocation.longitude = -123.108219;
    
//    [self.mapView setCenterCoordinate: startingLocation];
    
    MKCoordinateRegion startingRegion;
    startingRegion.center = startingLocation;
    startingRegion.span.latitudeDelta = 0.02; //fit this range into the map,reduce scope
    startingRegion.span.longitudeDelta = 0.02;
    
    [self.mapView setRegion:startingRegion];
    
//    MKAnnotationView *marker = [[MKPointAnnotation alloc] init];
//    CLLocationCoordinate2D cityHallLocation;
//    cityHallLocation.longitude = 49.2607834;
//    cityHallLocation.longitude = -123.1151686;
//    
//    marker.coordinate = cityHallLocation;
//    marker.title = @"Vancouver City Hall";
//    
//    [self.mapView addAnnotation: marker];
    
    // Do any additional setup after loading the view.
}

-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    //like cellforpath it only runs when it's visible
    
    static NSString* annotationIdentifier = @"cityHallAnnotation";
    
    
    return nil;
    
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
