//
//  Coords2D.m
//
//  Created by MANIAK_dobrii on 9/22/12.
//  Copyright (c) 2012 MANIAK_dobrii. All rights reserved.
//

#import "Coords2D.h"
#import "ARCHelper.h"

@implementation Coords2D
@synthesize lat = _lat,
            lon = _lon,
      timestamp = _timestamp;


/**
 Creates and returns a Coords2D object with given lattitude, longitude and timestamp.
 
 @param lat lattitude in degrees
 @param lon longitude in degrees
 @param timestamp timestamp in seconds
 
 @returns autoreleased (if ARC disabled) Coords2D instance.
 */
+ (instancetype) coords2DWithLat:(degrees)lat lon:(degrees)lon timestamp:(seconds)timestamp {
    return autorelease([[Coords2D alloc] initWithLat:lat lon:lon timestamp:timestamp]);
}


/**
 Creates and returns a Coords2D object with given lattitude and longitude, timestamp is set to 0.
 
 @param lat lattitude in degrees
 @param lon longitude in degrees
 
 @returns autoreleased (if ARC disabled) Coords2D instance.
 */
+ (instancetype) coords2DWithLat:(degrees)lat lon:(degrees)lon {
    return autorelease([[Coords2D alloc] initWithLat:lat lon:lon timestamp:0]);
}


/**
 Creates and returns a Coords2D object based on data in given CLLocationCoordinate2D, timestamp is set to 0.
 
 @param cllocationCoordinate2D coordinate to build Coords2D from
 
 @returns autoreleased (if ARC disabled) Coords2D instance.
 */
+ (instancetype) coords2DWithCLLocationCoordinate2D: (CLLocationCoordinate2D)cllocationCoordinate2D {
    return autorelease([[Coords2D alloc] initWithCLLocationCoordinate2D:cllocationCoordinate2D]);
}


/**
 Creates and returns a Coords2D object based on data in given CLLocation, timestamp is set to time interval between timestamp
 in CLLocation and the system’s absolute reference date (the first instant of 1 January 2001, GMT).
 
 @param cllocation location to build Coords2D from
 
 @returns autoreleased (if ARC disabled) Coords2D instance.
 */
+ (instancetype) coords2DWithCLLocation: (CLLocation*)cllocation {
    return autorelease([[Coords2D alloc] initWithCLLocation:cllocation]);
}




/**
 Initializes and returns a Coords2D object with the specified latitude, longitude and timestamp.
 
 @param lat lattitude in degrees
 @param lon longitude in degrees
 @param timestamp timestamp in seconds
 
 @returns Coords2D instance.
 */
- (instancetype) initWithLat: (degrees)lat lon: (degrees)lon timestamp: (seconds)timestamp {
    self = [super init];
    
    if(self)
    {
        _lat = lat;
        _lon = lon;
        _timestamp = timestamp;
    }
    
    return self;
}


/**
 Initializes and returns a Coords2D object with the specified latitude and longitude. timestamp is set to 0.
 
 @param lat lattitude in degrees
 @param lon longitude in degrees
 
 @returns Coords2D instance.
 */
- (instancetype) initWithLat: (degrees)lat lon: (degrees)lon {
    return [self initWithLat:lat lon:lon timestamp:0];
}


/**
 Initializes and returns a Coords2D object based on data in given CLLocationCoordinate2D, timestamp is set to 0.
 
 @param cllocationCoordinate2D coordinate to initialize Coords2D with
 
 @returns Coords2D instance.
 */
- (instancetype) initWithCLLocationCoordinate2D: (CLLocationCoordinate2D)cllocationCoordinate2D {
    return [self initWithLat:cllocationCoordinate2D.latitude lon:cllocationCoordinate2D.longitude];
}


/**
 Initializes and returns a Coords2D object based on data in given CLLocation, timestamp is set to time interval 
 between timestamp in CLLocation and the system’s absolute reference date (the first instant of 1 January 2001, GMT).
 
 @param cllocation location to initialize Coords2D with
 
 @returns Coords2D instance.
 */
- (instancetype) initWithCLLocation: (CLLocation*)cllocation {
    return [self initWithLat:cllocation.coordinate.latitude
                         lon:cllocation.coordinate.longitude
                   timestamp:[cllocation.timestamp timeIntervalSinceReferenceDate]];
}


/**
 CLLocationCoordinate2D representation of stored coordinate.
 
 @returns CLLocationCoordinate2D made up from lat and lon values
 */
- (CLLocationCoordinate2D) cllocationCoordinate2D {
    return CLLocationCoordinate2DMake(_lat, _lon);
}


/**
 CLLocation representation of stored coordinate.
 
 @returns CLLocation made up from lat, lon and timestamp values. The altitude and horizontalAccuracy properties are set to 0, 
 the verticalAccuracy property is set to -1 to indicate that the altitude value is invalid.
 */
- (CLLocation*) cllocation {
    CLLocation* cllocation = [[CLLocation alloc] initWithCoordinate:self.cllocationCoordinate2D
                                                           altitude:0
                                                 horizontalAccuracy:0
                                                   verticalAccuracy:-1
                                                          timestamp:[NSDate dateWithTimeIntervalSinceReferenceDate:_timestamp]];
    return autorelease(cllocation);
}




#pragma mark NSCoding
- (id) initWithCoder: (NSCoder *) decoder
{
    self = [super init];
    if(self)
    {
        _lat = 0.0;
        _lon = 0.0;
        _timestamp = 0.0;
        
        
        if ([decoder containsValueForKey: @"lat"])
        {
            _lat = [decoder decodeDoubleForKey: @"lat"];
        }
        if ([decoder containsValueForKey: @"lon"])
        {
            _lon = [decoder decodeDoubleForKey: @"lon"];
        }
        if ([decoder containsValueForKey: @"tm"])
        {
            _timestamp = [decoder decodeDoubleForKey: @"tm"];
        }

    }
    return self;
}


- (void) encodeWithCoder: (NSCoder *) encoder
{
    [encoder encodeDouble:_lat forKey: @"lat"];    
    [encoder encodeDouble:_lon forKey: @"lon"];
    [encoder encodeDouble:_timestamp forKey:@"tm"];
}


- (NSString *) description {
    NSMutableString * ms = [NSMutableString stringWithString: @"Coords2D("];
    [ms appendString: @"lon:"];
    [ms appendFormat: @"%f", _lon];
    [ms appendString: @",lat:"];
    [ms appendFormat: @"%f", _lat];
    [ms appendString: @",timestamp:"];
    [ms appendFormat: @"%f", _timestamp];
    [ms appendString: @")"];
    return [NSString stringWithString: ms];
}
@end
