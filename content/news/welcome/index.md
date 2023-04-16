---
title: "Welcome to Breaches.Cloud"
date: "2023-05-01"
description: "Introducing Breaches.cloud"
# draft: true
tags: ["news"]

author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"
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

Once we're done with the initial site, the [breaches.cloud](https://github.com/jchrisfarris/breaches.cloud) source repository will be made public, and the community is welcome to add any additional information on the cataloged incidents.

## What's next

When we have a complete catalog, we want to sort and index the data to allow us to understand better which cloud security issues are responsible for what sort of incidents. For example, we may attempt to map to frameworks like MITRE ATT&CK or index the proximate causes by misconfiguration type.

Our research may become a regular email newsletter if there is enough interest.

