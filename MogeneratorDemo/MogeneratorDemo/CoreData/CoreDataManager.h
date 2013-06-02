//
//  CoreDataManager.h
//
//  Created by MD on 5/30/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "_CoreDataManager.h"

@interface CoreDataManager : _CoreDataManager

+ (NSFetchedResultsController*) frcForCDPlace;
+ (NSFetchedResultsController*) frcForCDPlaceInMoc: (NSManagedObjectContext*)context;

- (void) generateSomePlaces;
 
@end
