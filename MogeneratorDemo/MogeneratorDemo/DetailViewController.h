//
//  DetailViewController.h
//  MogeneratorDemo
//
//  Created by MD on 6/2/13.
//  Copyright (c) 2013 MDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreDataManager.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* titleLabel;
@property (nonatomic, strong) IBOutlet MKMapView* mapView;
@property (nonatomic, strong) CDPlace* cdPlace;
@end
