+++
author = "Judson Stevens"
title = "Reviews: DDDQ - Chapter 3 Part 1"
date = "2021-04-10"
description = "Part 1 of a personal review of chapter 3 of Domain Driven Design Quickly"
categories = [
    "Book Reviews",
    "Domain Driven Design"
]
tags = [
    "bookReview",
    "domainDrivenDesign"
]
+++

## Model Driven Design

In Chapter 3, the author really dives into the essence of domain driven design. One of the key concepts wrapped up into DDD is the idea of a *model*.
This is an idea that is everpresent where software is written.
One approach used to design software is the [analysis model][1] approach.
The author points out that this very formal approach is typically done by a different set of people, most likely without taking into account the software developers or even software concepts.
A common issue as these formal models get translated into software is performance.
In order to squeeze higher performance out of software, there is occasionally a need to structure the objects and processes in that software in a certain way to allow things like [parallelism, concurrency, or asynchronicity][2].
Other issues pointed out by the author include analysts who

>may have gone into too much detail with some of the components of the model, and have not detailed enough of others

along with discovering details during the development phase that cause models to have to be rearranged or shifted.
Another common issue with this approach is the loss of domain knowledge as the model is passed to the developers.
Why have the analysts spend a large amount of time with the domain experts crafting the model only to then pass *some* of that knowledge along?
Analysts can be valuable to this process; there should be a focus on developers being a large part of the process too.

## The Building Blocks of Model Driven Design

In general most applications have a similar structure, colloquially referred to as a *layered architecture*.
The layers serve as logical dividers from the different purposes of the software, although often some layers will be part of a monolithic whole.
However, the author stresses that those layers should include models and processes that are as uncoupled as possible from the other layers and ideas like business logic.
A common layered architecture might look like this:

![Screenshot of a typical layered architecture solution. At the top, to the left, the bolded words "User Interface (Presentation Layer)" with the text "Responsible for resenting information to the user and interpreting user commands" to the right.
After a dividing line, the bolded words "Application Layer" are to the left with the text "This is a thin layer which coordinates the application activity.
It does not contain business logic. It does not hold the state of the business objects, but it can hold the state of an application task progress" to the right.
After another dividing line, the bolded words "Domain Layer" to the left with the text "This layer contains information about the domain.
This is the heart of the business software. The state of business objects is held here.
Persistence of the business objects and possibly their state is delegated to the infrastructure layer" to the right.
After another dividing line, the bolded words "Infrastructure Layer" with the text "This layer acts as a supporting library for all the other layers.
It provides communication between layers, implements persistence for business objects, contains supporting libraries for the user interface layer, etc" to the right.
This is followed by a final dividing line.](/images/DDDQ_Four_Layers.png?raw=true "Typical Four Layers of a Software Application")

While this isn't the place to get into [monoliths][3] vs [microservices][4], a layered architecture can be one or the other (or maybe a [little of... both?][5] That's a bad idea).
The main idea here is that if conceptually you divide your layers and use separate models in each one without intertwining them *too* tightly, you can keep to the idea of a multi-layered architecture in a monolithic app.

## Entities, Value Objects and Services

### Entities

Entities play a central role in domain driven design.
A key portion of what makes an object an entity is identity; if we create a person object, that person should have a unique identifier, so we can keep track of them throughout the operations of the system.

>When an object is distinguished by its identity, rather than its attributes, make this primary to its definition in the model. Keep the class definition simple and focused on life cycle continuity and identity.

### Value Objects

Value Objects are the next pattern that is discussed. One of the most important aspects of a value object is *[immutability][6]*.
They should be easy to create and easy to throw away. If a different value is needed, simply create a new object rather than changing the one you have.
Value Objects are the workhorse of DDD - they can contain references to Entities, references to other Value Objects, a long list of attributes, or anything in between.
The author makes a point, however, to say

>Attributes chosen to make up a Value Object should form a conceptual whole.

### Services

Services typically start as the *actions* of the domain, or verbs used by the domain experts.
Use an object to contain these actions so that they can operate across multiple different Entities and Value Objects.

>For example, to transfer money from one account to another; should that function be in the sending account or the receiving account?

Ensure that Services are grouped according to function so that they *"[encapsulate][7] a concept"*. The author points out that there are three characteristics of a Service

>1. The operation performed by the Service refers to a domain concept which does not naturally belong to an Entity or Value Object.
>2. The operation performed refers to other objects in the domain.
>3. The operation is stateless.

A common mistake is to transpose Services from the domain layer into the infrastructure layer or vice versa.
Don't be afraid to put Services in the application layer; where a Service lives is very dependent on the domain and the problem you are solving.
The main thrust of this part of the book is to ensure that conceptually the aforementioned objects are separated.

Continue on to the next [post about Chapter 3][8]...

[1]: <https://www.geeksforgeeks.org/analysis-modelling-in-software-engineering/> "A Geeks for Geeks article about analysis modelling"
[2]: <https://stackoverflow.com/questions/4844637/what-is-the-difference-between-concurrency-parallelism-and-asynchronous-methods> "A Stackoverflow post about the difference in these three terms"
[3]: <https://m.signalvnoise.com/the-majestic-monolith/> "A post by DHH of Rails fame about the 'Majestic Monolith'"
[4]: <https://martinfowler.com/articles/dont-start-monolith.html> "A post from Stefan Tilkov on why you should start with microservices... if your goal is microservices"
[5]: <https://www.simplethread.com/youre-not-actually-building-microservices/> "A post about distributed monoliths from Justin Etheredge"
[6]: <https://web.mit.edu/6.005/www/fa15/classes/09-immutability/> "A lesson from MIT about mutability and immutability"
[7]: <https://press.rebus.community/programmingfundamentals/chapter/encapsulation/> "A short post about encapsulation from Reebus Press"
[8]: </post/dddq-chapter-3-part-2> "Part 2 of the Chapter 3 review"