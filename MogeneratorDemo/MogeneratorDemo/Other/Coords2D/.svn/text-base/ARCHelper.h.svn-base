//
//  ARCHelper.h
//
//  Created by MANIAK_dobrii on 5/8/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//
// simple ARC compliance for autorelease

#ifndef GPSTracker_ARCHelper_h
#define GPSTracker_ARCHelper_h

    // if ARC is enabled
    #if __has_feature(objc_arc)

        #define autorelease(x)  (x)

    #else

        #define autorelease(x)  ([x autorelease])

    #endif

#endif
