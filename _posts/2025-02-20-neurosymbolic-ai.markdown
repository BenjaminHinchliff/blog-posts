---
layout: post
title:  "Neurosymbolic AI: Categories and Case Studies"
date:   2025-02-20 15:30:20 -0800
categories: jekyll update
---

## What is Neuro-symbolic AI?

* A broad term for any AI technique that combines symbolic and neural techniques  
* Symbolic techniques: techniques based on high-level representations of problems  
  * Symbolic reasoning  
  * Knowledge graphs  
  * Graph search algorithms  
* Applies to many modern techniques used already

One of the common sources of confusion when it comes to neuro-symbolic AI is precisely what it means {% cite bhuyan_neuro-symbolic_2024 %}.

## Types of Neuro-symbolic AI \[4\]

* From Henry Kautz’s presentation during AAAI 2020  
  * No broad agreement on categorization  
  * *Very* messy with a lot of overlap  
* symbolic Neuro symbolic  
  * Both inputs and outputs are in symbolic form, but the entire processing itself is done within a neural network  
  * Many neural networks, including LLM systems, fall into this category  
* Symbolic\[Neuro\]  
  * Systems where neural techniques are integrated into larger symbolic techniques  
  * Commonly used in advanced game agents, e.g. AlphaGo (Monte-carlo tree search with neural policy and value networks) \[cite\]  
* Neuro ∪ compile(Symbolic)  
  * Neural techniques where networks are attempted to be constrained by symbolic rules and techniques  
  * Applying deep learning to existing symbolic techniques like beam search, e.g. Deep Learning for solving mathematical equations   
* Neuro → Symbolic  
  * Cascading techniques where the output of a neural technique is used as input to a symbolic technique  
  * Commonly used in applications to take in natural language and then perform symbolic reasoning  
* Neuro\[Symbolic\]  
  * Applications where neural techniques are able to invoke symbolic techniques for specific tasks within the network  
  * LLMs invoking Wolfram Alpha for solving of equations within a query

### Trends in Neuro-symbolic Application \[3, 4\]

* Explainable AI  
* Robustness in systems  
* Expert systems

### Specific Applications

#### Neural Formal Verification \[2\]

##### Principles and Techniques

* Examine the change in the outputs for a known input, and ensure that the outputs match what is expected  
* For instance, take the example of trying to ensure the property of “fairness” in a neural network  
* Can be expressed as, two given inputs that are identical save for the “sensitive” input, the output should be identical, e.g. race has no effect on the size of a loan provided for example  
* Expressed formally: ![][image1]  
* As this is an example, we are ignoring multicollinearity and confounding and the like  
* However, these simple techniques are limited because they can’t encode complex relationships

##### Example from the Paper

* For a self-driving car network (f(x))  
* Assert that whenever a stop sign is in view, the car must be decelerating  
* The authors propose that one would train a separate network to recognize stop signs (g(x)), and then this assertion can be expressed as: ![][image2]

##### Their Framework

* They propose a dedicated language to encode these kinds of relationships called Neuro-Symbolic Assertion Language (NeSEAL)  
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
* The authors attribute this to using a single network to try to comprehend both single frame features and inter-frame relationships (spatial and temporal data)

##### Background

###### *Temporal Logic*

* A superset of first-order logic that adds additional quantifiers  
* For example, Always (◻), Eventually/Exist (♦), Next (X), Until (U)

###### *Probabilistic Automata Model Checking*

* For simple models like Probablistic Automatons (basically NFAs)  
* Can be formally verified to adhere to a set of temporal logic by exploring the state space and ensuring the model entails the specification

##### Their Solution

* ![][image4]  
* Process frames using standard vision systems to find their content  
* Validate which frames contain relevant information  
* Construct a probabilistic automaton for the relations between information in frames  
* Construct a temporal logic representation of the query, and find a probabilistic automaton that conforms to that query  
* Performs better on many metrics than existing models (\~9-15% improvement)  
* ![][image5]

## References

{% bibliography --cited %}
