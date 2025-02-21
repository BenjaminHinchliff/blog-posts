---
layout: post
title:  "Neurosymbolic AI: Categories and Case Studies"
date:   2025-02-20 15:30:20 -0800
categories: programming artificial-intelligence
---

## What and Why is Neuro-symbolic AI?

One of the common sources of confusion when it comes to Neuro-symbolic AI is
precisely what it means. This is an understandable confusion because the term
itself is extremely broad, and often carries associations that can cause
confusion. This isn't helped with the increasing popularity of neuro-symbolic
approaches in fields that come into vogue with the public conciousness, causing
laypeople (and the entire marketing department) to use the term in ways that
don't fit with the generally established meaning in literature.

At its core though, the idea is very simple. Neuro-symbolic AI systems describe
artificial intelligence systems that combine both neural and symbolic techniques
for a single application. Neural techniques, in the context, refer to
connectionist approaches to AI, the most prominent being Deep Neural Networks.
Symbolic techniques refer to more "traditional" techniques and approaches to
AI, these are your chess engines, your reasoning systems, etc. Commonly referred
to as rule-based or expert systems, this describes systems where a predefined
set of logical rules and mechanisms operates in a deterministic and easily
understood way on the problem domain {% cite bhuyan_neuro-symbolic_2024 %}. Each
of these techniques come with their own drawbacks, which quickly became obvious
as the fields developed.

Symbolic AI systems were far and away first on the scene, arguably developing
even before computers themselves. Of particular interest were applying these
techniques to games, since computer scientists have the tendency to also be
massive nerds. And their efforts, notably, were met with great initial success.
For a small example, take the game of Tic-tac-toe. In the modern day, a novice
programmer can create a bot for it using a simple algorithm called Minimax and
in so doing create perfect play, such that it will only ever win or draw. This
is done by searching through all the moves you could do, and then all the ones
your opponent can do, all the way until the end of the game. Then, all you need
to do is have the bot choose the moves that are best for it assuming its
opponent also played optimally.

This represents a simple example of one of the most powerful early techniques
for systems in the field of AI, search algorithms. Other powerful techniques
along the same problem domain include reasoning systems, largely based around
first-order logic, and knowledge graphs that attempts to represent knowledge as
a web of connected nodes.

All these techniques are met with a fundamental problem, however. To make a
symbolic system, one needs to understand the problem and then find a way to
encode the problem into a computer program. However, in the real world, a lot of
the most interesting and difficult problems are also the ones least
well-understood. Here, we find salvation in statistics. Statistics reframes the
problem, instead of trying to create rules to apply onto the world, it seeks to
find trends in the world and predict them, without necessarily needing to
understand the trends themselves. Statistics, as described here, includes
traditional techniques such as regression and significance tests, but also
includes the now powerful subfield of Machine Learning. Machine Learning is
simply the application of powerful statistical techniques to attempt to predict
trends in often very complex and high-dimensional data.

However, because this data is often very complex, so too do our models become
equally complex. As a result, machine learning techniques, especially
connectionist approaches based on simulated "neurons", become virtually
inscrutable, with even their own creators unable to fully explain their
behavior.

Seeing this, wouldn't it be nice if we could build systems that incorporated
the benefits of both symbolic and neural techniques? This is the goal of
Neuro-symbolic AI, however actually combining these two disparate systems proves
difficult.

## Types of Neuro-symbolic AI

When it comes to actually combining these two techniques many different
approaches have been applied. However, these approaches can be categorized into
a number of broad trends in application. Notably, these categories are very
malleable and a single model can and often do fall into multiple categories. The
following is the categorization of Henry Kautz, as presented during AAAI 2020 {%
cite kautz_third_2020 sarker_neuro-symbolic_2021 %}.

### Symbolic Neuro Symbolic

Symbolic Neuro Symbolic describes techniques where symbolic operations happen to
the inputs and outputs of a network, with the network acting to transform the
input into the output before further processing. This describes a whole host of
techniques, and in fact most machine learning. Of partiucalar note, this is the
cateogization that most LLMs fall into, at least intrinsically, since their
inputs and outputs typically have symbolic operations performed on them, with
everything from tokenisation, part of speech analysis, and more, not to mention
(arguably) attention itself.

### Symbolic\[Neuro\]

Symbolic\[Neuro\]

* From Henry Kautz’s presentation during AAAI 2020  
  * No broad agreement on categorization  
  * *Very* messy with a lot of overlap  
* symbolic Neuro symbolic  
  * Both inputs and outputs are in symbolic form, but the entire processing
  itself is done within a neural network  
  * Many neural networks, including LLM systems, fall into this category  
* Symbolic\[Neuro\]  
  * Systems where neural techniques are integrated into larger symbolic
  techniques  
  * Commonly used in advanced game agents, e.g. AlphaGo (Monte-carlo tree search
  with neural policy and value networks) \[cite\]  
* Neuro ∪ compile(Symbolic)  
  * Neural techniques where networks are attempted to be constrained by symbolic
  rules and techniques  
  * Applying deep learning to existing symbolic techniques like beam search,
  e.g. Deep Learning for solving mathematical equations   
* Neuro → Symbolic  
  * Cascading techniques where the output of a neural technique is used as input
  to a symbolic technique  
  * Commonly used in applications to take in natural language and then perform
  symbolic reasoning  
* Neuro\[Symbolic\]  
  * Applications where neural techniques are able to invoke symbolic techniques
  for specific tasks within the network  
  * LLMs invoking Wolfram Alpha for solving of equations within a query

### Trends in Neuro-symbolic Application \[3, 4\]

* Explainable AI  
* Robustness in systems  
* Expert systems

### Specific Applications

#### Neural Formal Verification \[2\]

##### Principles and Techniques

* Examine the change in the outputs for a known input, and ensure that the
outputs match what is expected  
* For instance, take the example of trying to ensure the property of “fairness”
in a neural network  
* Can be expressed as, two given inputs that are identical save for the
“sensitive” input, the output should be identical, e.g. race has no effect on
the size of a loan provided for example  
* Expressed formally: ![][image1]  
* As this is an example, we are ignoring multicollinearity and confounding and
the like  
* However, these simple techniques are limited because they can’t encode complex
relationships

##### Example from the Paper

* For a self-driving car network (f(x))  
* Assert that whenever a stop sign is in view, the car must be decelerating  
* The authors propose that one would train a separate network to recognize stop
signs (g(x)), and then this assertion can be expressed as: ![][image2]

##### Their Framework

* They propose a dedicated language to encode these kinds of relationships
called Neuro-Symbolic Assertion Language (NeSEAL)  
  * Fragment of FOL w/o quantifiers  
* For instance, the earlier property can be encoded as:  
* ![][image3]

##### Conclusions

* Still relies on the correctness of neural networks at the low level  
* Does move towards greater robustness on more complex properties

#### (Towards) Neuro-symbolic Video Understanding \[4\]

##### The Problem

* Analyze and understand video to answer queries  
* E.g. “Find the timestamp for the ‘I’m Flying’ scene from Titanic”  
* ![][image4]  
* Current network architectures do well with simple queries like that  
* Struggle on queries that require time robustness  
* E.g. “Find the scene that leads into the “I’m Flying” scene from the titanic”  
* The authors attribute this to using a single network to try to comprehend both
single frame features and inter-frame relationships (spatial and temporal data)

##### Background

###### *Temporal Logic*

* A superset of first-order logic that adds additional quantifiers  
* For example, Always (◻), Eventually/Exist (♦), Next (X), Until (U)

###### *Probabilistic Automata Model Checking*

* For simple models like Probablistic Automatons (basically NFAs)  
* Can be formally verified to adhere to a set of temporal logic by exploring the
state space and ensuring the model entails the specification

##### Their Solution

* ![][image4]  
* Process frames using standard vision systems to find their content  
* Validate which frames contain relevant information  
* Construct a probabilistic automaton for the relations between information in
frames  
* Construct a temporal logic representation of the query, and find a
probabilistic automaton that conforms to that query  
* Performs better on many metrics than existing models (\~9-15% improvement)  
* ![][image5]

## References

{% bibliography --cited %}
