Resources: https://www.youtube.com/watch?v=Y7FLskzCTGE

---
<h3> What is Swift Data? </h3>
**Swift Data** is a framework that enables you to model and manage data.
It relies on macros to create a seamless API experience.

**It is an iOS 17 API!**

<h4> Using `@Model` macro </h4>
It defines the schema of you data only with code. And it adds SwiftData functionality to model types.

Example:

```swift
//Adding @Model to class Trip
import SwiftData

@Model
class Trip {

	var name: String
	var destination: String
	var endDate: Date
	var startDate: Date

	var bucketlist: [BucketListItem]? = []
	var livingAccomodation: LivingAccomodation?

}

```

Decorating the class with `@Model` gives the power of persistency right away:
- Attributes inferred from properties
- Support for basic value types
- Also complex values, like
	- struct
	- enum
	- codable
	- collections of value types
- Relationships are inferred from reference types
	- other model types
	- collections of model types
- You can control how properties are inferred with
	- `@Attribute`
	- `@Relationship`
- If you want to exclude properties: `@Transient`

Example:


```swift
@Model
class Trip {

	@Attribute(.unique)	var name: String
	var destination: String
	var endDate: Date
	var startDate: Date

	@Relationship(.cascade)	var bucketlist: [BucketListItem]? = []
	var livingAccomodation: LivingAccomodation?

}

```

---
<h4> ModelContainer and ModelContext </h4>
The **model container** provides the persistent backend for your model types.
You can use the default settings provided just by specifying your schema, or you can customize the configurations.

The **model context** observes all the changes to your model and provide many of the actions to operate on them, like fetching, saving, undoing, deleting, etc.
You can have your model context in the view's environment after you create your model container.

Example:
```swift
import SwiftUI

struct ContextView: View{
	@Environment(\.modelContext) private var context
}
```

---
<h4> Code Explanation </h4>
**First step**: Create the model using `class`, then add `@Model` macro. This sets our class as the container of our data.

**Second step**: in the `@main` of our app, let's say that the class we created is the `modelContainer`.

**Third step**: let's connect the `modelContainer` to the UI through the `modelContext`. In our view, set an `@Environment` variable that is going to be our `modelContainer`.

**Fourth step**: create the methods you need, like add an item, delete it, update it, etc.

**Fifth step**: retrieve your data through a `@Query` macro. This query is going to retrieve all the instances from our local data store into an array.
