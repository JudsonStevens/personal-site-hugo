+++
author = "Judson Stevens"
title = "Reviews: DDDQ - Chapters 1 and 2"
date = "2021-04-01"
description = "Personal review of chapters 1 and 2 of Domain Driven Design Quickly"
categories = [
    "Book Reviews",
    "Domain Driven Design"
]
tags = [
    "bookReview",
    "domainDrivenDesign"
]
+++

## What is Domain Driven Design?

Domain driven design is a concept that seems obvious in hindsight. As one of the first examples in the books says: consider making software for banking.
While the common concepts of banking are something that probably comes readily to your mind, developing software that must hit the different edge cases and out-of-the-ordinary scenarios is a complicated task.
Even the normal operations of debits and credits and accounts can get extremely complicated once the [concept of scale][1]<sup>PDF</sup> is introduced to the equation.
Understanding the domain well is one of the keys to writing software that solves problems. 
It makes sense that software that *works with* the domain performs better than software that doesn't.

As an aside - there are different types of "design philosophies" in the software industry. [Test driven development][2], [behavior driven development][3], and [design driven development][4] are all different approaches to the same problem - how to develop good software.
Even further, *how to develop good software* ***that solves a problem.*** (And let's remember, [programming is hard!][5])

## Understanding the Domain

Having an understanding of the domain is key to designing good software.
There are multitudes of software applications and companies that have failed precisely because they neglected to let the domain experts inform their design.
It is all too easy for software developers to fall into what I call the consultant's trap - *when you believe you're the smartest person in the room, it's easy to discount the advice or knowledge of everyone else*.
That's an easy path to bottom.

There is some discussion in this chapter on [agile][7] versus [waterfall][8] development strategies.
The upsides and downsides of both of those types of development strategies have been legislated ad nauseam; suffice it to say that agile software development strategies dovetail very nicely with the knowledge gaining and domain exploring that's inherent in domain driven design.
Having an iterative process to accomplish both of those aspects allows the developers and the domain experts to quickly establish a rapport and start building a knowledge base.

## Utilize the Experts

The emphasis on working with domain experts continues on in the first chapter.
The main example used throughout the book is of an airplane flight control system.
You probably know how the basics of airplane flight control work - a plane starts at a departure or origin, follows some path through the air, and then lands at a destination.
However, this doesn't cover even the smallest bit of complexity that's involved.
What if there are multiple planes landing at near the same times? What about inclement weather changing flight paths?
What about emergencies? All of these scenarios happen every day and this hypothetical software may have to handle them.
As the discussion between the developer and the domain expert about basic ideas, scenarios, and potential edge cases is under way, something interesting is happening; they are developing the [Ubiquitous Language][6].

## The Ubiquitous Language

Early on in Chapter 2, the author points out that

>A core principle of domain-driven design is to use a language based on the model. Since the model is the common ground, the place where the software meets the domain, it is appropriate to use it as the building ground for this language.

He continues on to exmplain that software developers and managers should

>Make sure this language appears consistently in all the communication forms used by the team; for this reason, the language is called the Ubiquitous Language.

Martin Fowler has a great [article][9] about [homonyms][10], [polysemy][11] and it's affect on the Ubiquitous Language.
In short, due to the ability of words to have multiple meanings depending on context, it's important to gather pieces of the Ubiquitous Language while working *in coordination with the domain experts*.
These words and phrases should be as clear as possible.
It can be difficult at times to ensure that the all important conversations with domain experts stay focused - the author recommends making sure the software team is always aware of the goal; namely, building a Ubiquitous Language.
Use software or team centric jargon as little as possible and use the Ubiquitous Language as much as possible to reinforce its usage in general.

## UML and Documentation

The author talks about the tradeoffs of the [Unified Modeling Language][12], or UML. UML can be extremely helpful when the number of elements involved isn't too large.
However, in larger software projects, it would be detrimental to have hundreds of UML diagrams.
One of the points the author also makes is to be wary of long documents.
As soon you write a document, there's a good chance it's going to be obsoleted very quickly.
Be wary of this fact; keep your documentation in as close to lockstep with the application as possible, especially for [system documentation][13].
Documentation (along with programming) [is hard][14]! It can be one of the stronger assets to an established team, however; give it the focus it needs.

Check out the [next chapter here!][15]

[1]: <https://resources.sei.cmu.edu/asset_files/TechnicalNote/2006_004_001_14681.pdf> "Carnegie Mellon review of the challenges associated with scaling software"
[2]: <https://martinfowler.com/bliki/TestDrivenDevelopment.html> "Martin Fowler's quick primer on Test Driven Development"
[3]: <https://dannorth.net/introducing-bdd/> "Dan North's classic 'Introducing BDD'"
[4]: <https://thoughtbot.com/blog/design-driven-development> "Thoughtbot's thoughtful article on Design Driven Development"
[5]: <https://blog.codinghorror.com/nobody-hates-software-more-than-software-developers/> "Jeff Atwood's discourse on why software developers hate software"
[6]: <https://martinfowler.com/bliki/UbiquitousLanguage.html> "Martin Fowler's quick introduction to the Ubiquitous Language"
[7]: <https://martinfowler.com/agile.html> "Martin Fowler's many resources on Agile Software"
[8]: <https://en.wikipedia.org/wiki/Waterfall_model> "Wikipedia article on the waterfall model of development"
[9]: <https://martinfowler.com/bliki/TypeInstanceHomonym.html> "Martin Fowler's great article about TypeInstanceHomonyms"
[10]: <https://en.wikipedia.org/wiki/Homonym> "Wikipedia article about homonyms"
[11]: <https://en.wikipedia.org/wiki/Polysemy> "Wikipedia article on polysemy, the ability of a word to mean two different things"
[12]: <https://www.uml-diagrams.org/> "A quick explanation about UML"
[13]: <https://www.altexsoft.com/blog/business/technical-documentation-in-software-development-types-best-practices-and-tools/#process-documentation> "A portion of a blog post from Altexsoft"
[14]: <https://medium.com/@JohnTeasdale/why-internal-technical-documentation-is-hard-8dbd3c8179c0> "A Medium post by John Teasdale about documenation"
[15]: </post/dddq-chapter-3-part-1> "Review of chapter 3 of DDDQ"