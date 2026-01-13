---
layout: post
title: "How Lights Can Leak Your Wi-Fi Password: The Cybersecurity Nightmare of Smart Homes"
date: 2025-03-19 14:35:20 -0800
categories: security IoT
---

## Setting the Scene

In February 2025, cybersecurity researcher Jeremiah Fowler found a
vulnerability in the smart device (IoT) provider Mars Hydro, a provider or
LED Lights for hydroponics in industry and the home. He found a database
containing 2.7 Billion (with a B) entries of tracking data, including network
names (SSIDs), passwords, and email addresses.  They were entirely unprotected,
not even by a password. This means that anyone who had a device from the company
or its subsidiaries at the time of the vulnerability is at risk of having an
attacker access their network, though they'd have to be physically near them. To
make matters worse, when those network passwords get reused on other accounts
under the same email, as is unfortunately all-too-common, it could provide
attackers access to an unknown number of other accounts.

Thankfully, in this case, there was somewhat of a happy ending, with Fowler
ethically disclosing the vulnerability, and ensuring it got fixed before
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
Outside the tech bubble though, the risks are less well-understood. So let's
talk about it a bit, from first principles. We'll cover what IoT is, how does it
relate to Smart Homes, why it's such a problem for privacy and security, and
what you can (and can't) do about it.

I'd like to be clear on the stakes up front here. You should care because the
digital security of your home is also that of your secrets, both private and
financial. For instance, if an attacker is able to hack a smart speaker (like
the popular Amazon Echo), they can order items with your money with your Amazon
account, and in the worst case they might have access to your credit card number
directly. It also means your privacy, from the history of every command said to
the smart speaker, and in the worst cast every word said in your house.

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
that bothers you, you probably don't need to be reading this) {% cite
Lakhwani2020 %}.

Smart Home devices are becoming incredibly popular, with a projected market
revenue of $174 Billion US dollars in 2025 and be present in some form in 78% of
households {% cite smart-market %}.

This is understandable, as smart home devices are convenient. It's nice to, for
example, turn off your lights when you're not at home, or watch your porch when
you're away. However, they're often installed without a proper understanding of
their inherent risks.

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
prefix inter in internet means *between* networks. This allows
you to, for example, initiate a conversation with Google's servers on their own
network (or in reality multiple networks, but that's a whole other thing). Now here's
the big difference: internet conversations can't always be initiated by either
party.  For example, you can talk to Google's servers because Google's router
allows you to talk to those servers only if you're talking to them to see the
Google website.

Now what does all this mean? It means that typically, you set up an internet
connection to only be one way. As in, you can talk to Google's servers, but
Google can't talk to you unless you talk to them first. This is a great thing
for security, because that also means that attackers can't talk to you without
you talking to them first either.

IoT devices add a little wrinkle to this model, unfortunately. Let's say you have
a set of smart lights that you can turn on and off from anywhere, even when
you're far away connected on a different network. This means that a server needs
to be able to send a signal to your internal network with the device on it. And
because that server needs to be able to do it, now everyone else can try to as
well.  Now, how secure this is depends on how well-engineered the IoT device is,
and the device needn't necessarily be fully exposed to the internet, instead it
could maintain a constant connection to a server for example, which is much
better.  However, there's no way to know for sure that the server hasn't been
hacked and that it's not an attacker's server mimicking the real server.  How
difficult that is for an attacker again depends on how well the device and the
server are engineered.

Once an attacker can talk to your IoT device, they can then attempt to control
the device, and use the device to gain access to other devices on your local
network, such as a computer (so called lateral movement). How hard this might be
is again dependent on the engineering. It could be as easy as the username and
password being "admin" or (ideally) practically impossible without knowing
secrets only the real provider should know {% cite fortinet-iot-vulnerabilities %}.

The short version is this: when you talk to the internet, the internet can talk
to you, and it only takes one mistake for it to be able to control your device
as a result, and IoT devices always need to talk to the internet.

### Security is Expensive and I Like Money

Now, this wouldn't be a problem if the device was just engineered really well
such that none of those nasty attackers could either connect to or take over the
device. Unfortunately, good security is difficult, and difficult means
expensive.

It only takes one mistake for an attacker to gain access to a system, and it can
be anything from a flagrant error, like executing any code sent by an attacker
without question, to a nuanced bug that allows for arbitrary execution only if
you enter a seemingly random sequence of characters.

This means that cybersecurity is a constant cat and mouse game, and frankly it's
much easier for the cat, the attacker. This means that to have even decent
security you need skilled engineers, expensive security consultants. And for
internet connected services, they need to always be there, preventing issues
from happening and fixing them when they learn about them.

This is a big enough problem for conventional services, but for IoT devices it's
worse. Not only are they harder to secure since most have the inherent issue of
requiring connections from outside your local network, there are also "knockoff"
devices operated by smaller companies undercutting the competition on price.
These companies often can't afford the kind of security resources and upkeep
necessary to protect such a vulnerable device, and most people don't realize how
important they are when buying the device. {% cite xenofontos-2021 %}

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
we started with. {% cite xenofontos-2021 %}

## What Can You Do?

### The Safest Smart Device is a Dumb One

If it can't connect to the internet, it can't be hacked remotely, making "dumb"
devices the most secure in a technical sense in all cases.

I'm not going to go on a tirade and claim that you shouldn't ever use a smart
device. I get it, they're cool, they're useful, they're fun. When you do use one
though, always remember: **you are taking a risk**. Now, I can't tell you
exactly how big a risk it is, nor what degree of risk is acceptable to you, but
it's the same as whenever you get in a car, onto a plane, onto a bridge. Can you
trust those who made it, can you trust yourself, to keep you safe? And how do
you know you can trust them? The more devices you have, the bigger a risk you
are taking (the technical term would be you have a larger attack surface).

### Bigger Is (Usually) Better

Big companies have more scrutiny, more liability risk, and therefore more
security experts, and, generally speaking, better security. The flip side of
this is that smaller companies often have quite poor security {% cite schutz2020
%}. Now, of course, this isn't necessarily true. Ideally, look into their
history, see if they've had incidents before. **Can you trust them?**

### Know What You're Doing (or Find Someone Who Does)

Many cybersecurity issues originate with a misconfiguration during setup,
something exposed that shouldn't be, or a default credential left unchanged. **Do
you trust yourself to avoid these issues?** If you're not confident in your
ability to know about and detect these kinds of issues, consider finding someone
who is, ideally a professional. {% cite fortinet-iot-vulnerabilities %}.

### Keep Up-to-date

Smart devices are only ever remotely safe when they're constantly being
protected. At some point in almost any device's life, no matter how well
engineered, there will be some vulnerability that needs to be fixed. You need to
make sure that you get these security updates as soon as possible. Ideally, your
device will automatically update in these cases, but at least check whether
that's really the case. However, it should be noted that automatic updates can
also be an attack vector, do you trust them to do it securely? {% cite
fortinet-iot-vulnerabilities %}.

### Be Aware of Service Life

Someday in any connected device's life, the updates will stop, and your device
will no longer be protected by a small army of talented experts. Eventually,
some vulnerability will be found, no one will be there to fix it, and any nerdy
high schooler (or a state actor from Russia) will be able to hack into your
network. **Every moment you keep it running past it's service life increases
that risk**. So you need to replace that device with a newer one, one that's
protected, get rid of it, and it's associated risk, or never connect it to the
internet again, so an attacker can never connect to it. {% cite
fortinet-iot-vulnerabilities %}.

## Harm to Society

It should be noted that while I've chosen to focus largely on individual harms,
but vulnerable smart devices have a variety of large-scale implications on a
larger scale.

### Botnets and DDoS Attacks

As alluded to earlier, one of the big uses from the perspective of an attacker
for IoT devices is to build what are called botnets. These are massive networks
of hacked devices that can be controlled by an attacker. Most of the time, these
are used in distributed denial of service, or DDoS, attacks. These are attacks
that attempt to disable pieces of infrastructure, such as a website, by
overwhelming it with so many connections it cannot hope to keep up. This was/is
the application for the Mirai botnet mentioned earlier. While on an individual
level, the change in traffic is fairly minimal, the harm to our shared
infrastructure as a whole by these kinds of systems is massive. {% cite
fortinet-iot-vulnerabilities %}.

### Disproportionate Risk

One thing that you've likely picked up on by now is that cheap smart home stuff
can be more than simply bad, it can be dangerous. However, not everyone can
afford the top-of-the-line gear. For example, it's not feasible for someone who
lives paycheck to paycheck to buy an expensive pet camera just to keep an eye on
their cat while they're at work.

This points to a need for better security regulation for these devices. Think of
it like regulating pharmaceuticals. In the developed world, you can go buy
generic drugs and know you (probably) won't die because of great regulation by
the FDA.  While the scale of harm for failure is more extreme in that case, I
think it's clear that a great deal of less concrete harm is being done by the
current state of security regulation for smart devices. While the right level of
regulation is arguable, I would contend that right now we're solidly in the
realm of not enough (though that's a whole different discussion). {% cite
xenofontos-2021 %}

## Final Thoughts

The world is a safe place, and sadly, neither is the internet. Smart home
devices are an attack vector to those who want to harm you, and often don't have
the security to match up to that. I hope this serves as a primer on some of the
risks, but this is not a definitive guide. If you take one thing away from this
remember to always ask yourself: **Can you trust them?**

## References

{% bibliography --cited %}

<!-- LocalWords: cybersecurity jeremiah njccic mirai vigdor somebodys Mirai IoT SSIDs Reddit 
 -->
