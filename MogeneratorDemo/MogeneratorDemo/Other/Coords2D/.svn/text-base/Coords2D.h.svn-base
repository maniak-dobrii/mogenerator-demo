//
//  Coords2D.h
//
//  Created by MANIAK_dobrii on 9/22/12.
//  Copyright (c) 2012 MANIAK_dobrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

// stores degrees for lattitude, longitude
typedef double degrees;
// stores seconds for timestamp
typedef NSTimeInterval seconds;

/*
 Coords2D
 
 Convenience class for storing location as NSObject subclass.
 Could be used with archievers, as far as supports NSCoding.
 
 Stores only lattitude, longitude and timestamp.
 
 */

@interface Coords2D : NSObject <NSCoding> {
    degrees _lat;       // lattitude
    degrees _lon;       // longitude
    seconds _timestamp; // timestamp (timeIntervalSinceReferenceDate)
}


@property (nonatomic, assign) degrees lat;
@property (nonatomic, assign) degrees lon;
@property (nonatomic, assign) seconds timestamp;

@property (nonatomic, readonly) CLLocationCoordinate2D cllocationCoordinate2D;
@property (nonatomic, readonly) CLLocation* cllocation;


+ (instancetype) coords2DWithLat: (degrees)lat lon: (degrees)lon timestamp: (seconds)timestamp;
+ (instancetype) coords2DWithLat: (degrees)lat lon: (degrees)lon;
+ (instancetype) coords2DWithCLLocationCoordinate2D: (CLLocationCoordinate2D)cllocationCoordinate2D;
+ (instancetype) coords2DWithCLLocation: (CLLocation*)cllocation;

- (instancetype) initWithLat: (degrees)lat lon: (degrees)lon timestamp: (seconds)timestamp;
- (instancetype) initWithLat: (degrees)lat lon: (degrees)lon;
- (instancetype) initWithCLLocationCoordinate2D: (CLLocationCoordinate2D)cllocationCoordinate2D;
- (instancetype) initWithCLLocation: (CLLocation*)cllocation;

@end
