//
//  DetailViewController.m
//  MogeneratorDemo
//
//  Created by MD on 6/2/13.
//  Copyright (c) 2013 MDC. All rights reserved.
//

#import "DetailViewController.h"
#import "Coords2D.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self configureWithCDPlace:self.cdPlace];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    
    if(self.cdPlace)
    {
        MKPointAnnotation* annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = self.cdPlace.coordinates.cllocationCoordinate2D;
        annotation.title = self.cdPlace.title;
        [self.mapView addAnnotation:annotation];
        [self.mapView setCenterCoordinate:annotation.coordinate animated:YES];
    }
}

- (void) configureWithCDPlace: (CDPlace*)cdPlace {
    if(cdPlace)
    {
        self.titleLabel.text = cdPlace.title;
    }
    else
    {
        self.titleLabel.text = @"<Error>";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) onBackButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
