// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CGKVisitor.m instead.

#import "_CGKVisitor.h"

const struct CGKVisitorAttributes CGKVisitorAttributes = {
	.email = @"email",
	.firstName = @"firstName",
	.imageURL = @"imageURL",
	.lastName = @"lastName",
	.licensePlate = @"licensePlate",
	.sentToAdmin = @"sentToAdmin",
	.visitDate = @"visitDate",
	.visiting = @"visiting",
};

const struct CGKVisitorRelationships CGKVisitorRelationships = {
};

const struct CGKVisitorFetchedProperties CGKVisitorFetchedProperties = {
};

@implementation CGKVisitorID
@end

@implementation _CGKVisitor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CGKVisitor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CGKVisitor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CGKVisitor" inManagedObjectContext:moc_];
}

- (CGKVisitorID*)objectID {
	return (CGKVisitorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"sentToAdminValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"sentToAdmin"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic email;






@dynamic firstName;






@dynamic imageURL;






@dynamic lastName;






@dynamic licensePlate;






@dynamic sentToAdmin;



- (BOOL)sentToAdminValue {
	NSNumber *result = [self sentToAdmin];
	return [result boolValue];
}

- (void)setSentToAdminValue:(BOOL)value_ {
	[self setSentToAdmin:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveSentToAdminValue {
	NSNumber *result = [self primitiveSentToAdmin];
	return [result boolValue];
}

- (void)setPrimitiveSentToAdminValue:(BOOL)value_ {
	[self setPrimitiveSentToAdmin:[NSNumber numberWithBool:value_]];
}





@dynamic visitDate;






@dynamic visiting;











@end
