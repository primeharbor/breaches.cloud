---
title: "Imperva RDS Snapshot"
date: 2023-04-09T16:51:47-04:00

description: "A Cloud Security focused analysis of a data breach at Imperva in October 2018"

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Public Snapshots", "Public Instance"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Imperva"
incident_start_date: 2018-10-01
incident_end_date: 2018-10-31
disclosure_date: 2019-08-27
final_status: "Closed"

---

An unknown threat actor compromised an un-use EC2 Instance, accessed AWS API Keys, and used them to exfiltrate a Database Snapshot from security vendor Imperva.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

In October 2018, an unknown attacker compromised an exposed EC2 instance and gained access to AWS API keys. These keys were subsequently used to access an RDS Snapshot in one of Imperva's production AWS Accounts. The database snapshot from a year prior was related to their Incapsula WAF product and contained customer email addresses, hashed passwords, API keys, and some customer-provided SSL Certificates.

### Timeline
| Date | Event |
| ------ | ----- |
| **September&nbsp;15,&nbsp;2017** | Database (RDS) Snapshot made|
| **October 2018** | Unauthorized use of an administrative API key in production AWS accounts|
| **August 20, 2019** | Imperva received a data set from a third party requesting a bug bounty|
| **August 27, 2019** | Imperva announced a security incident that affected a subset of its Cloud WAF customers|


## Summary of Coverage
* Brian Krebs: [Cybersecurity Firm Imperva Discloses Breach](https://krebsonsecurity.com/2019/08/cybersecurity-firm-imperva-discloses-breach/) August 27, 2019
* Imperva [Security Incident Update](https://www.imperva.com/blog/ceoblog/) October 19th, 2019
* ThreatPost: [Imperva: Data Breach Caused by Cloud Misconfiguration](https://threatpost.com/imperva-data-breach-cloud-misconfiguration/149127/) October 11, 2019


## Cloud Security Implications of this Incident
* The EC2 Instance was part of a scaling test and was no longer needed. It should have been terminated.
* The EC2 Instance was accessible via the public internet when not required.
* The instance used a long-term access key on an EC2 Instance instead of short-term keys from an EC2 Instance Profile.
