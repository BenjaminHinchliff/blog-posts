---
layout: post
title:  "The Cybersecurity Hell of Smart Homes"
date:   2025-02-20 15:30:20 -0800
categories: security IoT
---

## Setting the Scene

In February of 2025, cybersecurity researcher Jeremiah Fowler found a
vulnerability in the Internet of Things (IoT) provider LG-LED SOLUTIONS LIMITED,
registered in California. He found a database containing 2.7 Billion (with a B)
entries of tracking data, including network names (SSIDs), passwords, and email
addresses. They were entirely unprotected, not even by a password. This means
that anyone who bought a device from the company or its subsidiaries is at risk
of having an attacker access their network. To make matters worse, if those
network passwords are reused on other accounts under the same email, as is
unfortunately all-too-common, it could provide attackers access to an unknown
number of other accounts.

Thankfully, in this case, there was somewhat of a happy ending, with Fowler
ethically disclosing the vulnerability, and ensuring it was fixed before
disclosing it to the public. However, that database was public this entire time,
and Fowler may not have been the first to discover that, just the first to share
it {% cite jeremiah-27-2025 %}.

Even more disturbing is the fact that this case is far from the first and is far
from the worst case. Famous examples include the Mirai botnet in 2016, a
distributed botnet made up of people's personal IoT devices large enough to take
down massive websites including Twitter (now X), Netflix, and Reddit {% cite
njccic-mirai %}, and 2019 attacks on poorly configured Ring cameras allowing
attackers to watch children in their own home {% cite vigdor-somebodys-2019 %}.

As these cases demonstrate, IoT security is in a bad state, and has been in one
for a while, [to the point of being a common
joke](https://michaelblume.tumblr.com/post/169525456166/tech-enthusiasts-everything-in-my-house-is-wired).
Outside of the tech bubble though, the risks are less well-understood. So let's
talk about it a bit, from first principles. We'll cover what IoT is, how does it
relates to Smart Homes, why it's such a problem for privacy and security, and
what you can (and can't) do about it.

Incidentally, I am going to presuppose that you care about your security and
privacy, and that you think that random people being able to watch your
(hypothetical) children may be a bad thing. Sadly, if you don't, I'm not sure
anything I can say will reach you.

## So What Even is an IoT Anyway?

It's a buzzword, in short. It stands for **Internet of Things**, which just
refers the network of devices that are able to exchange data over the internet
(typically). For the average consumer, the bit that actually matters is **Smart
Home** technologies, which encompass everything from those Nest home thermostats
to those fancy multicolor light-bulbs on the porch that my Dad *swears* are
important.

Now, in the technical sense IoT is a more broad term than Smart Home
technologies that applies to other contexts, but from a security perspective
they are more-or-less synonymous, so we'll be treating them as such here (and if
that bothers you, you probably don't need to be reading this).

Smart Home devices are becoming increasingly, incredibly popular, with a
projected market revenue of $174 Billion US dollars in 2025 and be present in
some form in 78% of households {% cite smart-market %}.

This is understandable, as smart home devices are very convenient. It's nice to,
for example, turn off your lights when you're not at home, or watch your porch
when you're away. However, many of these devices are installed without a proper
understanding of their inherent risks.

## Why IoT Security is Awful (and Why That Sucks)

### When You Stare Into the Abyss, the Abyss Stares Into You

The fundamental problem with IoT devices is that, most of the time, a device
from outside your network needs to talk to it. Understanding why that's a
problem requires understanding the difference between the local area network,
and the public internet.

The local area network (LAN), or intranet, is a single, isolated network of
devices. For the average home, this would be everything that's connected to your
Wi-Fi router. Now, everything that's connected to that router on your network
can talk to you, and you can talk to it, so your printer, for instance can talk
to your computer and vice versa. Notably, this also means that your printer can
"initiate" conversations with your computer and vice versa as well.

Unfortunately for security experts, most people like to talk to devices that
aren't already on their local network. This is where the internet comes it. The
inter in internet quite literally means *between* networks. This allows you to,
for example, initiate a conversation with Google's servers on their own network
(or in reality many networks but that's a whole other thing). Now here's the big
difference: internet conversations can't always be initiated by either party.
For example, you can talk to Google's servers because Google's router allows you
to talk to those servers only if you're talking to them to see the google website.

Now what does all this mean? It means that typically, you set up a internet
connection to only be one way. As in, you can talk to Google's servers, but
Google can't talk to you unless you talk to them first. This is a great thing
for security, because that also means that attackers can't talk to you without
you talking to them first either.

IoT devices add a little wrinkle to this model, unfortunately. Lets say you have
a set of smart lights that you can turn on and off from anywhere, even when
you're far away connected on a different network. This means that a server needs
to be able to send a signal to your internal network with the device on it. And
because that server needs to be able to do it, now everyone else can try to as
well.  Now, how secure this is based on how well-engineered the IoT device is,
and the device needn't necessarily be fully exposed to the internet, instead it
could maintain a constant connection to a server for example, which is much
better.  However, there's no way to know for sure that the server hasn't been
hack and that it's not an attacker's server mimicking the real server.  How
difficult that is for an attacker again depends on how well the device and the
server is engineered.

Once an attacker can talk to you, they can then attempt to control the device.
How hard this might be is again dependent on the engineering. It could be as
easy as the username and password being "admin" or (ideally) practically
impossible without knowing secrets only the real provider should know.

The short version is this: when you talk to the internet, the internet can talk
to you, and it only takes one mistake for it to be able to control your device
as a result, and IoT devices always need to talk to the internet.

### Security is Expensive and I Like Money

Now, this wouldn't be a problem if the device was just engineered really well
such that none of those nasty attackers could either connect to or take over the
device. Unfortunately, good security is very difficult, and difficult means
expensive.

It only takes one mistake for an attacker to gain access to a system, and it can
be anything from a flagrant error, like executing any code sent by an attacker
without question, to a nuanced bug that allows for arbitrary execution only if
you enter a seemingly random sequence of characters.

This means that cybersecurity is a constant cat and mouse game, and frankly it's
much easier for the cat, the attacker. This means that to have even decent
security you need skilled engineers, expensive security consultants. And for
internet connected services, they need to always be there, fixing issues when
they learn about them.

This a big enough problem for conventional services, but for IoT devices it's
worse. Not only are they harder to secure since many of them require the
aforementioned inbound connections, there are also many "knockoff" devices
operated by smaller companies undercutting the competition on price. These
companies often can't afford the kind of security resources and upkeep necessary
to protect such a vulnerable device, and most people don't realize how important
they are when buying the device.

### Single Points of Failure

The last issue smart home devices introduce is they aggregate a lot of data into
one place. For example, take the Ring doorbell camera. They have a service where
you can review the recent video feed from anywhere from their app. This means
that for all Ring cameras, there's some server (or well realistically a
networked set of servers) that has *all* of that data together. To an attacker,
that's called an enticing target, worth millions to the right buyer. For
instance, it has value to criminals so they can know when a valuable target
would be at home, and it's also possible to copy keys from a video feed in some
cases.

Now, Ring is quite a large company, and one would hope that they're decently
secure. However, you need to trust all the companies for any IoT device you buy
to be equally secure, and if you buy on the lower end of the market, that is
even less of a guarantee, as demonstrated by the vulnerability found by Fowler
we started with.

## What Can You Do?

### The Safest Smart Device is a Dumb One

I'm not going to go on a tirade and claim that you shouldn't ever use a smart
device. I get it, they're cool, they're useful, they're fun. When you do use one
though, always remember: **you are taking a risk**. Now, I can't tell you how
exactly big a risk it is, nor what degree of risk is acceptable to you, but it's
the same as whenever you get in a car, onto a plane, onto a bridge. Can you trust
those who made it, can you trust yourself, to keep you safe? And how do you know
you can trust them? The more devices you have, the bigger a risk you are taking
(the technical term would be you have a larger attack surface).

### Bigger Is (Usually) Better

Big companies have more scrutiny, more liability risk, and therefore more
security experts, and, generally speaking, better security. Now, of course, this
isn't necessarily true. Ideally, look into their history, see if they've had
incidents before. **Can you trust them?**

### Know What You're Doing (or Find Someone Who Does)

Many cybersecurity issues originate with a misconfiguration during setup,
something exposed that shouldn't be or a default credential left unchanged. **Do
you trust yourself to avoid these issues?** If you're not confident in your
ability to know about and detect these kinds of issues, consider finding someone
who is, ideally a professional.

### Keep Up-to-date

Smart devices are only ever remotely safe when they're constantly being
protected. At some point in almost any device's life, no matter how well
engineered, there will be some vulnerability that needs to be fixed. You need to
make sure that you get these security updates as soon as possible. Ideally, your
device will automatically update in these cases, but at least check whether
that's really the case. However, it should be noted that automatic updates can
also be an attack vector, do you trust them to do it securely?

### Be Aware of Service Life

Someday in any connected device's life, the updates will stop, and your device
will not longer be protected by a small army of talented experts. Eventually,
some vulnerability will be found, no one will be there to fix it, and any nerdy
highschooler (or a state actor from Russia) will be able to hack into your
network. **Every moment you keep it running past it's service life increases
that risk**. So you need to replace that device with a newer one, one that's
protected, get rid of it and it's associated risk, or never connect it to the
internet again so an attacker can never connect to it. 

## Final Thoughts

The world is a safe place, and sadly, neither is the internet. Smart home
devices are an attack vector to those who want to harm you, and often don't have
the security to match up to that. If you take one thing away from this remember
to always ask your self: **Can you trust them?**

## References

{% bibliography --cited %}

{% comment %} <!--  LocalWords:  Mirai IoT SSIDs Reddit --> {% endcomment %}
