//
//  _CoreDataManager.h
//
//  Created by MD on 5/20/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//
// Core Data stack management boilerplate code, only main thread part,
// background queue saves stripped.

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ModelIncludes.h"

#define SETTINGS_DB_FILE_NAME @"mogendemo.sqlite"


@interface _CoreDataManager : NSObject
{
    NSManagedObjectContext* _mainManagedObjectContext;
    NSManagedObjectModel* _managedObjectModel;
    NSPersistentStoreCoordinator* _persistentStoreCoordinator;
    
    BOOL _mocReady;
    BOOL _momReady;
    BOOL _pscReady;
}

@property (nonatomic, strong, readonly) NSManagedObjectContext* mainManagedObjectContext;
@property (nonatomic, strong, readonly) NSManagedObjectModel* managedObjectModel;
@property (nonatomic, strong, readonly) NSPersistentStoreCoordinator* persistentStoreCoordinator;

+ (instancetype) sharedInstance;
+ (BOOL) initCoreDataStack;
+ (void) warmUpTheCache; // big backgroud fetch to populate the cache


- (NSURL *) applicationDocumentsDirectory;

/**
 Tells if Core Data stack initialization is finished for the main thread.
 
 @returns YES if finished, NO if not finished (or error)
 */
+ (BOOL) isReady;
- (BOOL) isReady;


/**
 Deletes persistent store file.
 Call this ONLY when there is no persistent store attached to the file.
 
 @returns YES on success, NO on error
 */
+ (BOOL) removeCoreDataDBFile;



@end
