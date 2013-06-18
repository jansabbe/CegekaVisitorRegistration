// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CGKVisitor.h instead.

#import <CoreData/CoreData.h>


extern const struct CGKVisitorAttributes {
	__unsafe_unretained NSString *email;
	__unsafe_unretained NSString *firstName;
	__unsafe_unretained NSString *imageURL;
	__unsafe_unretained NSString *lastName;
	__unsafe_unretained NSString *licensePlate;
	__unsafe_unretained NSString *sentToAdmin;
	__unsafe_unretained NSString *visitDate;
	__unsafe_unretained NSString *visiting;
} CGKVisitorAttributes;

extern const struct CGKVisitorRelationships {
} CGKVisitorRelationships;

extern const struct CGKVisitorFetchedProperties {
} CGKVisitorFetchedProperties;











@interface CGKVisitorID : NSManagedObjectID {}
@end

@interface _CGKVisitor : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CGKVisitorID*)objectID;





@property (nonatomic, strong) NSString* email;



//- (BOOL)validateEmail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* firstName;



//- (BOOL)validateFirstName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageURL;



//- (BOOL)validateImageURL:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* lastName;



//- (BOOL)validateLastName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* licensePlate;



//- (BOOL)validateLicensePlate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* sentToAdmin;



@property BOOL sentToAdminValue;
- (BOOL)sentToAdminValue;
- (void)setSentToAdminValue:(BOOL)value_;

//- (BOOL)validateSentToAdmin:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* visitDate;



//- (BOOL)validateVisitDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* visiting;



//- (BOOL)validateVisiting:(id*)value_ error:(NSError**)error_;






@end

@interface _CGKVisitor (CoreDataGeneratedAccessors)

@end

@interface _CGKVisitor (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveEmail;
- (void)setPrimitiveEmail:(NSString*)value;




- (NSString*)primitiveFirstName;
- (void)setPrimitiveFirstName:(NSString*)value;




- (NSString*)primitiveImageURL;
- (void)setPrimitiveImageURL:(NSString*)value;




- (NSString*)primitiveLastName;
- (void)setPrimitiveLastName:(NSString*)value;




- (NSString*)primitiveLicensePlate;
- (void)setPrimitiveLicensePlate:(NSString*)value;




- (NSNumber*)primitiveSentToAdmin;
- (void)setPrimitiveSentToAdmin:(NSNumber*)value;

- (BOOL)primitiveSentToAdminValue;
- (void)setPrimitiveSentToAdminValue:(BOOL)value_;




- (NSDate*)primitiveVisitDate;
- (void)setPrimitiveVisitDate:(NSDate*)value;




- (NSString*)primitiveVisiting;
- (void)setPrimitiveVisiting:(NSString*)value;




@end
