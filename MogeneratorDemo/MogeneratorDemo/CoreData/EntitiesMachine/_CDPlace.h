// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CDPlace.h instead.

#import <CoreData/CoreData.h>



extern const struct CDPlaceAttributes {
	__unsafe_unretained NSString *coordinates;
	__unsafe_unretained NSString *title;
} CDPlaceAttributes;











@class Coords2D;



@interface CDPlaceID : NSManagedObjectID {}
@end

@interface _CDPlace : NSManagedObject {}
+ (instancetype)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CDPlaceID*)objectID;





@property (nonatomic, strong) Coords2D* coordinates;



//- (BOOL)validateCoordinates:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





+ (NSArray*)fetchAllPlaces:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchAllPlaces:(NSManagedObjectContext*)moc_ error:(NSError**)error_;




@end



@interface _CDPlace (CoreDataGeneratedPrimitiveAccessors)


- (Coords2D*)primitiveCoordinates;
- (void)setPrimitiveCoordinates:(Coords2D*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
