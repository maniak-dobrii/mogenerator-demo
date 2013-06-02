//
//  CLLocation+Coords2D.m
//
//  Created by MANIAK_dobrii on 5/8/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//

#import "CLLocation+Coords2D.h"
#import "Coords2D.h"

@implementation CLLocation (Coords2D)
- (Coords2D*) coords2D {
    return [Coords2D coords2DWithCLLocation:self];
}
@end
