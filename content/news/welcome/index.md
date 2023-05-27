---
title: "Welcome to Breaches.Cloud"
date: "2023-05-10"
description: "Welcome to Breaches.Cloud - the soon-to-be definitive source for analysis on cloud security-related breaches."
# draft: true
tags: ["news"]

preview_image: /icons/android-chrome-384x384.png

author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"
author_twitter: "@jcfarris"
---

Welcome to Breaches.Cloud - the soon-to-be definitive source for analysis on cloud security-related breaches.

## Why are we doing this?

As a cloud security practitioner, I often find myself trying to explain cloud security risks to my developer, operator, and builder constituency. Within the Cloud Security community, we know the potential risks of long-term access keys, publicly writable buckets, and insecure services exposed to the world. <!--more--> But when we have to describe these risks to our builder community, we sometimes end up looking like this:

![Pepe Silvia meme from Its Always Sunny In Philadelphia](pepe.jpg)

Our goal with breaches.cloud is to provide the security community a go-to place for identifying real-world examples of how cloud security misconfigurations have impacted real customers. It's one thing for us to say *"It's a bad idea to attach the S3FullAccess policy to your instance role when you only need to write to a single logging bucket,"* and quite another to say *"The 2019 Capital One breach wouldn't have resulted in a 100 million dollar fine if the engineer deploying the WAF hadn't attached the S3FullAccess to the \*\*\*WAF-Role"*

## What we're going to do
Our initial research push is being done with funding from my consulting firm [PrimeHarbor](https://www.primeharbor.com/). Our initial backlog is based on [Rami McCarthy](https://ramimac.me/)'s excellent list of [AWS Customer Security Incidents](https://github.com/ramimac/aws-customer-security-incidents).

Breaches.cloud will work to catalog (and preserve) as much primary source material as possible. This will include court filings, customer breach notifications, and incident write-ups. Where primary sources aren't available, we will include non-paywalled news reports.

Incidents don't happen all at once. Instead, details trickle out and the justice system works at its own pace. Part of what this site will do is ensure that as additional information is made public, it is incorporated into each incident's page.

## How you can help

Once we're done with the initial site, the [breaches.cloud](https://github.com/primeharbor/breaches.cloud) source repository will be made public, and the community is welcome to add any additional information on the cataloged incidents.

## What's next

The next phase for us will be to purchase trial transcripts from [PACER](https://pacer.uscourts.gov/). While we have a [right to a speedy and public trial](https://www.law.cornell.edu/constitution/sixth_amendment#:~:text=The%20Sixth%20Amendment%20guarantees%20the,charges%20and%20evidence%20against%20you.) here in the United States, we apparently don't have a right to get a digital copy of court proceedings. As indicated in Ryan McGeehan's [excellent write-up](https://medium.com/starting-up-security/a-blameless-post-mortem-of-usa-v-joseph-sullivan-a137162f7fc9) of United States vs Sullivan, a lot of details about these cases come out at trial. These details are critical for uncovering how cloud breaches happen. 

When we have a complete catalog with trial details, we want to sort and index the data to allow us to understand better which cloud security issues are responsible for what sort of incidents. For example, we may attempt to map to frameworks like MITRE ATT&CK or index the proximate causes by misconfiguration type.

Our research may become a regular email newsletter if there is enough interest.

