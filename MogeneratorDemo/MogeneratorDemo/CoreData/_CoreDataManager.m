//
//  _CoreDataManager.m
//
//  Created by MD on 5/20/13.
//  Copyright (c) 2013 MANIAK_dobrii. All rights reserved.
//

#import "_CoreDataManager.h"
#import "_CoreDataManager_Private.h"

/**
    Remove persistent store file before CD stack initialization.
 */
#define CLEAR_DB_FILE_ON_START 1

@implementation _CoreDataManager

// no subclassing (or, to be more precise, no several subclass realisations used simultaneously)
+ (instancetype) sharedInstance {
    
    static dispatch_once_t once;
    static id sharedInstance = nil;
    
    
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


+ (BOOL) initCoreDataStack {
    
    if([self isReady])
    {
        return YES;
    }
    
#ifdef CLEAR_DB_FILE_ON_START
    // remove the persistent store file
    [self removeCoreDataDBFile];
#endif

    [[self sharedInstance] managedObjectModel];
    [[self sharedInstance] persistentStoreCoordinator];
    [[self sharedInstance] mainManagedObjectContext];
    
    if([self isReady])
    {
        // inform success
        [self p_informIsReady];
        
        [self warmUpTheCache];
        
        return YES;
    }
    
    // inform failure
    [self p_informFailed];
    return NO;
}

+ (BOOL) isReady {
    return [[self sharedInstance] isReady];
}

- (BOOL) isReady {
    return _momReady && _mocReady && _pscReady;
}

/**
 Inform that CD stack is ready. 
 Called after CD stack had succesfully finished initialization.
 Post a notification of anything.
 
 */
+ (void) p_informIsReady {
    
}

/**
 Inform that CD stack initialization failed.
 Called after CD stack had finished initialization but encountered an error.
 Post a notification of anything.
 
 */
+ (void) p_informFailed {
    
}

- (NSManagedObjectContext*) mainManagedObjectContext {
    
    if (_mainManagedObjectContext != nil)
    {
        return _mainManagedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = self.persistentStoreCoordinator;
    if (coordinator != nil)
    {
        _mainManagedObjectContext = [[NSManagedObjectContext alloc] init];
        [_mainManagedObjectContext setPersistentStoreCoordinator:coordinator];
        
        _mocReady = YES;
    }
    return _mainManagedObjectContext;
}

- (NSManagedObjectModel*) managedObjectModel {
    
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
	_managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    if(_managedObjectModel != nil)
    {
        _momReady = YES;
    }
    
    return _managedObjectModel;
}

- (NSURL *) applicationDocumentsDirectory {
	return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

/**
    Two persistent stores for two configurations in a single NSPersistentStoreCoordinator
 
    SQLiteStore => sqlite
    InMemoryStore => in memory
 
 
    Sets _pscReady = YES, if NSPersistentStoreCoordinator was succesfully initialized.
 
    @returns NSPersistentStoreCoordinator* if everything went good, nil otherwise.
 */
- (NSPersistentStoreCoordinator*) persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:SETTINGS_DB_FILE_NAME];
	
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    // sqlite storage
    @try
    {
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:@"SQLiteStore" URL:storeURL options:options error:&error])
        {
            _persistentStoreCoordinator = nil;
            NSLog(@"[Core Data error] Unresolved error %@, %@", error, [error userInfo]);
        }
    }
    @catch (NSException* ex)
    {
        _persistentStoreCoordinator = nil;
        NSLog(@"[Core Data error] Exception in persistentStoreCoordinator initialization: %@", ex);
    }
    
    // in-memory storage
    @try
    {
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:@"InMemoryStore" URL:nil options:options error:&error])
        {
            _persistentStoreCoordinator = nil;
            NSLog(@"[Core Data error] Unresolved error %@, %@", error, [error userInfo]);
        }
    }
    @catch (NSException* ex)
    {
        _persistentStoreCoordinator = nil;
        NSLog(@"[Core Data error] Exception in persistentStoreCoordinator initialization: %@", ex);
    }
    
    if(_persistentStoreCoordinator)
    {
        _pscReady = YES;
    }
    
    return _persistentStoreCoordinator;
}

+ (void) warmUpTheCache {
    // perform big fetch in background
}


+ (BOOL) removeCoreDataDBFile {
	NSLog(@"[Core Data] is removing persistent store file: '%@'.", SETTINGS_DB_FILE_NAME);
	
	
	// path to file
	NSURL * storeURL = [[[self sharedInstance] applicationDocumentsDirectory] URLByAppendingPathComponent:SETTINGS_DB_FILE_NAME];
	
	
	NSError* error = nil;
    // remove the file
    if(![[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error])
    {
        NSLog(@"[Core Data error] while deleting persistent store file: %@", error);
    }
    else
    {
        NSLog(@"[Core Data] succesfully removed persistent store file: '%@'", storeURL);
    }

	return (error == nil);
}




@end