// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDPlace.m instead.

#import "_CDPlace.h"


const struct CDPlaceAttributes CDPlaceAttributes = {
	.coordinates = @"coordinates",
	.title = @"title",
};








@implementation CDPlaceID
@end

@implementation _CDPlace

+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CDPlace" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CDPlace";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CDPlace" inManagedObjectContext:moc_];
}

- (CDPlaceID*)objectID {
	return (CDPlaceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic coordinates;






@dynamic title;











+ (NSArray*)fetchAllPlaces:(NSManagedObjectContext*)moc_ {
	NSError *error = nil;
	NSArray *result = [self fetchAllPlaces:moc_ error:&error];
	if (error) {
#ifdef NSAppKitVersionNumber10_0
		[NSApp presentError:error];
#else
		NSLog(@"error: %@", error);
#endif
	}
	return result;
}
+ (NSArray*)fetchAllPlaces:(NSManagedObjectContext*)moc_ error:(NSError**)error_ {
	NSParameterAssert(moc_);
	NSError *error = nil;

	NSManagedObjectModel *model = [[moc_ persistentStoreCoordinator] managedObjectModel];
	
	NSDictionary *substitutionVariables = [NSDictionary dictionary];
	
	NSFetchRequest *fetchRequest = [model fetchRequestFromTemplateWithName:@"AllPlaces"
													 substitutionVariables:substitutionVariables];
	NSAssert(fetchRequest, @"Can't find fetch request named \"AllPlaces\".");

	NSArray *result = [moc_ executeFetchRequest:fetchRequest error:&error];
	if (error_) *error_ = error;
	return result;
}



@end




