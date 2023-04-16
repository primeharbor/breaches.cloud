---
title: "LA Times Cryptomining"
date: 2023-04-11T13:28:36-04:00

description: "A Cloud Security focused analysis of the LA Times Cryptomining incident in 2018"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "S3", "Public-Bucket"]

showToc: true # Do not change
author: "Juan Rodriguez-Cardenas"
author_url: "https://github.com/seraphjrc"

# These details are used to populate the Incident Index page.
victim: "The Los Angeles Times"
incident_start_date: 2018-02-09
incident_end_date: 2018-02-22
disclosure_date: 2018-02-21
final_status: "Threat Actor Unknown"

---

In February 2018, The Los Angeles Times was unwittingly part of a crypto jacking scheme. A publicly writable S3 Bucket on their website was discovered and configured to serve a Coinhive Monero Miner Javascript code. The injected code used the CPU power of any browser that visited the site.

<!--more-->

## Incident

### Details of the Incident

In February 2018, Security Researcher [Troy Mursch](https://scholar.google.com/citations?user=I35Lgl4AAAAJ&hl=en) discovered a crypto-jacking script running on The Los Angeles Times website. The script came from the website known as [Coinhive](https://www.troyhunt.com/i-now-own-the-coinhive-domain-heres-how-im-fighting-cryptojacking-and-doing-good-things-with-content-security-policies/), a now shutdown crypto-mining business, that enabled users to inject designed Javascript code that would mine Monero by using the CPU processing from the site's visitors' devices.

The discovered vulnerability was due to a misconfiguration in The Los Angeles Times AWS S3 bucket that allowed write access to anyone. An unauthorized 3rd party took advantage of this opening and modified a Javascript file inside the bucket, adding the Coinhive script to begin mining.  According to Mursch, The code was located on The Los Angeles Times [Homicide Report](https://homicide.latimes.com/) Web page, a page with frequent visitors using the website scanning tool [urlscan.io](https://urlscan.io/)[^1].

Mursch states that "the miner was throttled to reduce the impact on visitors’ CPUs and would be harder to detect" compared to the traditional full 100% CPU throttle that most Crypto Jackers use. Mursch said the code might have at least been there since February 9th. Mursch emailed The Los Angeles Times, advising them to remove the malicious javascript.

While researching this, Mursch discovered[^2] another file, `BugDisclosure.txt`, which contained a warning to the site operators, urging them to secure it.

### Timeline

**February 9th, 2018** - First known evidence the LA Times' S3 Bucket hosted the Coinhive miner. \
**February 21, 2018** - Security Researcher Troy Mursch identifies that unauthorized users uploaded a cryptocurrency miner to the LA Times website. \
**February 22, 2018** - The Los Angeles Times removes the Coinhive code from the [Homicide Report](https://homicide.latimes.com/)  page.

 ### Attribution / Perpetrator

The threat group has never been identified or disclosed.

## Summary of Coverage

* Urlscan.io: [The tool used to discover the Coinhive Code](https://urlscan.io/) - February 21, 2018 \
* Bad Packets Report: [Original Tweet report by Troy Mursch](http://web.archive.org/web/20190727220916/https://twitter.com/bad_packets/status/966368819722596353) - February 21, 2018 \
* Threat Post: [Interview with Security Researcher who discovered the Code](https://threatpost.com/cryptojacking-attack-found-on-los-angeles-times-website/130041/) - February 22, 2018 \
* RegMedia: [The injected code found on The Los Angeles Times Website](https://regmedia.co.uk/2018/02/22/la_times_bad_code.png?x=648&y=244&infer_y=1) - February 22, 2018 \
* The Register: [LA Times homicide site hacked to mine crypto-coins on netizens' PCs](https://www.theregister.com/2018/02/22/la_times_amazon_aws_s3/) - February 22, 2018

## Cloud Security lessons learned
* The LA Times did not have a cloud security posture management (CSPM) tool in place or had not prioritized the remediation of findings.
* The LA Times did not have any file integrity checking in place to ensure that the code served customers was verified and from a known source repository

<!-- Footnotes themselves at the bottom. -->
[^1]: [Urlscan.io Tool](https://urlscan.io/)
[^2]: [Code Used and Message left behind](https://www.theregister.com/2018/02/22/la_times_amazon_aws_s3/)


