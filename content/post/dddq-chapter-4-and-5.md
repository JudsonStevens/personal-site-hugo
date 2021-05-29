+++
author = "Judson Stevens"
title = "Reviews: DDDQ - Chapters 4 and 5"
date = "2021-04-22"
description = "Personal review of chapter 4 and 5 of Domain Driven Design Quickly"
categories = [
"Book Reviews",
"Domain Driven Design"
]
tags = [
"bookReview",
"domainDrivenDesign"
]
+++

## Chapter 4 - Refactoring Towards Deeper Insight

### Continuous Refactoring

The author defines refactoring as

>Refactoring is the process of redesigning the code to make it better without changing application behavior.

Refactoring should be considered when it is apparent that some assumption or decision made about a model was incorrect.
There are, of course, differing levels of incorrect.
An assumption that causes a small issue in a little used piece of code may not need to be refactored immediately.
An incorrect assumption about the way two models connect, however, may cause development to grind to a halt until the problem is fixed.

There is a distinction made here between [*technical* refactoring][1] and refactoring *towards a deeper insight*.
While the former is well suited to patterns and a structured process, the refactoring towards a deeper insight is the result of deep understanding and experience within a domain.
As time progresses on a project, you'll find yourself making connections that were not obvious from the beginning.
You'll also find yourself wishing that certain models and ideas were expressed more clearly, or the connections between them defined more definitively.
These ideas should help inform your refactoring process.

Ensure that the domain experts are intimately involved with the refactoring process.
As concepts are revealed through this process, they may be able to take the small thoughts and ideas you have and grow them with the benefit of their domain specific knowledge.
Be careful; some domain experts are going to disagree with other experts, or suggest integrations and changes in different ways.
Refactoring can be a complex balancing process where many different experts and developers may want to have their input heard.
Utilize the built and developing Ubiquitous Language as heavily as possible. The author mentions yes or no questions about models as an example of business rules that can be applied to the model.
There is a tendency, however, to let those rules bloat the model - a simple check to see if a Customer is eligible for a discount could entail multiple different queries to different parts of the application to check their status, their account, and their previous purchases, for example.
The author recommends keeping such rules in the domain layer and refactoring them into Specification objects.

One thing to consider while refactoring - try to keep the future developers of the code in mind.
In some cases, this may even be you. Think about legacy code you may have had to refactor and use those lessons to inform your choices now.
If you had to come back in five years and refactor your code, how would you want it to look?

## Chapter 5 - Preserving Model Integrity

Maintaining the integrity of the different models that are part of the domain as they are being developed by multiple teams can be a complex task.
Without clean and clear dividing lines between teams, it can be easy to drive a good model to an inconsistent one.
Keep an eye towards splitting models up into smaller, more succint models.
The *interface* between models should be kep as [*clean*][2] as possible.

### Bounded Context

The author starts this subchapter by pointing out that every model has its context.
This context is easy to define with an application that has one model, or an application specifically made to work with a legacy application.
However, this equation becomes more difficult as the application grows. Keeping the context of models *bound* is an important job and should be something that is done consciously.
Keep the model *unified* as much as possible.


[1]: <https://refactoring.com/> "Martin Fowlers site on refactoring"
[2]: <https://stackoverflow.com/questions/2339048/guidelines-for-designing-clean-interface> "Stack Overflow question and answers about 'clean' interfaces"