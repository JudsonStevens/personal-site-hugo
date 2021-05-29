+++
author = "Judson Stevens"
title = "Reviews: DDDQ - Chapter 3 Part 2"
date = "2021-04-15"
description = "Part 2 of a personal review of chapter 3 of Domain Driven Design Quickly"
categories = [
"Book Reviews",
"Domain Driven Design"
]
tags = [
"bookReview",
"domainDrivenDesign"
]
+++

## Modules

Modules are an important factor in domain driven design - creating Modules that are well designed and cohesive is a large step towards writing clear and maintainable code.
The parts of a Module should attempt to follow the idea of *[functional cohesion][1]*.
Ensure you are considering how tightly coupled the Modules are with themselves and the rest of the application.
A low level of coupling is something to work towards; this can also make the move to microservies much easier at a later date if so desired.
An important piece of advice the author recommends is to

>the Modules names that become part of the Ubiquitous Language. Modules and their names should reflect insight into the domain.

For examples of tight versus loose coupling, think of the API of a bank.
If the bank's software is written for only one front end or client (in the programming sense, not the business sense), then we can consider the backend and frontend of that API *tightly coupled*.
Now the bank has decided to let customers pull their own data about their accounts - this will require a redesign of the API of the backend in order to allow connections from different users, not just the single integrated front end.
We can now say the system is *loosely coupled*.
Loose coupling causes the restructuring of an application to be much less painful than if the modules are tightly coupled.
Tightly coupled applications in general can lead to the *distributed monolith* which is the [worst of all worlds][9].

## Aggregates, Factories, and Repositories

### Aggregates

The last three parts of Chapter 3 cover the life cycle of domain objects.
Objects in your application will be created, used throughout the application, and then destroyed when they are no longer needed. 
These three concepts help to establish some of the aspects of that cycle. Aggregates are

>a group of associated objects which are considered as one unit with regard to data changes.

Each Aggregate has exactly one root. The root of the Aggregate is an Entity; the Entity is the only publicly accessible object of the Aggreggate.
Internal objects inside the Aggregate can hold references to other internal objects or Entities that are entirely internal to the Aggregate.
Nothing outside of the boundary of the Aggregate should hold a reference to anything except the root of the Aggregate.
For example, with a customer object at the root of the Aggregate, there could be internal references to a contact info object, address object, or a spouse object.
If an external object needs that information, the root of the Aggregate could pass a *[transient reference][2]* to the internal object, often in the form of a Value Object.

### Factories

A Factory is exactly what it sounds like - a mechanism to create *complex* objects.
In order to create complex objects without a Factory, the calling object would often need to have intimate knowledge about the object it is attempting to create.
This breaks multiple principles of DDD (and [Object Oriented Programming principles][3]). An important part of this object creation is *[atomicity][4]*.
Specifically, there should never be a half-created object, only no object or a whole object.
The Aggregate should have a method that utilizes the Factory to create the objects that make up the Aggregate.
This creation process will enforce the *[invariants][5]* of the different objects to ensure that the resulting object is valid.
While it is true that Factories are tightly coupled to the objects they create, this can be a strength in that it gives you a single place to concentrate your creation logic.
Sometimes, a simple constructor is enough; use a constructor when:

> - The construction is not complicated.
> - The creation of an object does not involve the creation of others, and all the attributes needed are passed via the constructor.
> - The client is interested in the implementation, perhaps wants to choose the Strategy used.
> - The class is the type. There is no hierarchy involved, so no need to choose between a list of concrete implementations.

In order to retain Entity integrity, ensure that any violation of an invariant returns an exception.
When creating an object from the database, if there is a violation of an invariant, that violation must be repaired before being used to generate the object.
For example, if another process has added a number to a string in the database that should be restricted to only alpha characters, this should be resolved before creating that object (this is a fairly contrived example, but hopefully you get the picture).

### Repositories

The hypothetical scenario presented by the author to explain the need for Repositories is this: if a client needs to obtain the reference to an Aggregate, it needs a reference to the root of that aggregate.
While this can be obtained by *[assocatiation traversal][6]*, this sometimes forces object to hold references they would not normally hold.
Another common way to make this happen is to let the client pull the Entity directly from the database; this is generally a bad idea as it requires the clients or the objects the clients request to be aware of how to access the database.
What if you change the underlying infrastructure or database? Now all of that scattered code must be changed as well.

In order to alleviate these concerns, the author introduces the Repository pattern.

>The Repository may store references to some of the objects. When an object is created, it may be saved in the Repository, and retrieved from there to be used later. If the client requested an object from the Repository, and the Repository does not have it, it may get it from the storage. Either way, the Repository acts as a storage place for globally accessible objects.

Many applications use a *[caching system][7]* to serve the role of the repository.
Caches give the application easy and *quick* access to the different objects generated by the Factories.
Repositories should also be able to request an object be created by a Factory.
The Repository can be likened to infrastructure, but it should remain purely in the domain.
It should have *links* to the infrastructure layer in order to obtain objects from the database if needed; it should not, however, be tightly coupled to the infrastructure.

Check out the next couple [chapters here!][8]

[1]: <https://softwareengineering.stackexchange.com/questions/402593/concept-of-functional-cohesion> "Stack Exchange post about functional cohesion in software"
[2]: <https://stackoverflow.com/questions/57009765/c-references-and-transient-objects> "Stack Overflow post about transient references in C++"
[3]: <https://www.freecodecamp.org/news/object-oriented-programming-concepts-21bb035f7260/> "Freecodecamp article about OOP principles"
[4]: <https://cs.stackexchange.com/questions/109248/whats-exact-definition-of-atomicity-in-programming> "Stack Exchange post about atomicity with some great answers"
[5]: <https://softwareengineering.stackexchange.com/questions/32727/what-are-invariants-how-can-they-be-used-and-have-you-ever-used-it-in-your-pro> "Stack Exchange post with some good answers about invariants"
[6]: <https://domaindrivendesign.yahoogroups.narkive.com/tHLZeQz4/what-are-traversable-associations-and-traversal-directions> "A Yahoo group thread about DDD and association traversal"
[7]: <https://dzone.com/articles/introducing-amp-assimilating-caching-quick-read-fo> "A great article about the many different types of caching"
[8]: </post/dddq-chapters-4-and-5> "Review of chapters 4 and 5 of DDDQ"
[9]: <https://medium.com/@joaovasques/your-distributed-monoliths-are-secretly-plotting-against-you-4c1b20324a31> "Great article from João Vazao Vasques about distributed monoliths"