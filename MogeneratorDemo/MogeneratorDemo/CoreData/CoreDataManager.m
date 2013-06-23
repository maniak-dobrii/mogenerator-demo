//
//  CoreDataManager.m
//
//  Created by MD on 5/30/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//

// --- required Imports
#import "CoreDataManager.h"
#import "_CoreDataManager_Private.h"
// --- custom Imports
#import "Coords2D.h"


@implementation CoreDataManager


// boilerplate
+ (NSFetchedResultsController*) frcForCDPlace {
    return [self frcForCDPlaceInMoc:[[self sharedInstance] mainManagedObjectContext]];
}


+ (NSFetchedResultsController*) frcForCDPlaceInMoc:(NSManagedObjectContext *)context {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [CDPlace entityInManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *dateSort = [[NSSortDescriptor alloc] initWithKey:@"title" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:dateSort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    NSFetchedResultsController *fetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:context
                                          sectionNameKeyPath:nil
                                                   cacheName:@"Root"];
    
    return fetchedResultsController;
}

- (void) generateSomePlaces {
    srand(time(0));
    
    NSArray* titles = @[@"Extrapolated monk",
                        @"Old beaver",
                        @"Magic pillow",
                        @"Deep columbian picture",
                        @"Executive procecutor",
                        @"Benladen",
                        @"Hope",
                        @"Love",
                        @"Career",
                        @"Your lost sock",
                        @"Disney",
                        @"Polaroid"];
    
    CDPlace* cdPlace = nil;
    for(NSString* title in titles)
    {
        cdPlace = [CDPlace insertInManagedObjectContext:[self mainManagedObjectContext]];
        
        cdPlace.title = title;
        cdPlace.coordinates = [Coords2D coords2DWithLat:((double)rand() / RAND_MAX) * 160.0 - 80.0
                                                    lon:((double)rand() / RAND_MAX) * 340.0 - 170.0];
    }
}

+ (void) warmUpTheCache {
    #warning Implement warmUpTheCache
}
@end
