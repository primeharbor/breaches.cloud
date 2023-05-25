---
title: "DataDog (2016)"
date: 2023-05-25T04:57:54-04:00
lastmod: 2023-05-25T04:57:54-04:00

description: "A Cloud Security focused analysis of the DataDog incident in 2016"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS","Access Keys"]

showToc: true # Do not change
author: "Juan Rodriguez-Cardenas"
author_url: "https://github.com/seraphjrc"

# These details are used to populate the Incident Index page.
victim: "DataDog"
incident_start_date: 2016-07-07
incident_end_date: 2016-07-08
disclosure_date: 2016-07-08
final_status: "Perpetrator Unknown"

---

In July 2016, SaaS provider DataDog suffered a breach affecting its AWS customers. The breach stemmed from an attacker targeting production infrastructure servers and a database that stores user credentials. AWS users who attempted to use AWS credentials shared with Datadog also[ reported issues.](https://web.archive.org/web/20201128071102/https://www.datadoghq.com/blog/2016-07-08-security-notice/) DataDog immediately mitigated and notified users of the breach and ensured any precautions needed to be taken.

<!--more--> <!-- This separates the synopsis from the main body -->


## Incident

### Details of the Incident

In July 2016, DataDog suffered a security breach. In a[ statement](https://web.archive.org/web/20201128071102/https://www.datadoghq.com/blog/2016-07-08-security-notice/) by DataDog, they say that the attacker gained access through a leak of an AWS access key and a SSH private key that were used by their automated provisioning and release systems. The usage of both keys together allowed for unauthorized access to three of their AWS EC2 instances and a subset of their AWS S3 buckets. The resources breached included user credentials for DataDogs services, service metadata, and credentials for 3rd party integrations.

DataDog then quarantined the affected instances and sent out an email warning its users of the data breach, asking them to reset their passwords and for administrators to rotate or revoke **any** credentials stored in the DataDog system.

### Timeline
| Date | Event |
| ------ | ----- |
| **July 7, 2016** | Forensic activity shows attacker activity began. |
| **July 8, 2016** | DataDog releases a Security Notice disclosing the incident details. |

### Attribution / Perpetrator

The identity of the perpetrator of the breach has not been identified.

## Summary of coverage

* DataDog: [Security Notice](https://web.archive.org/web/20201128071102/https://www.datadoghq.com/blog/2016-07-08-security-notice/) - July 8th, 2016
* Naked Security: [Blog Post](https://nakedsecurity.sophos.com/2016/07/11/datadog-bitten-by-data-breach-kills-all-passwords/) - July 11th, 2016
* Threat Post: [Blog Post](https://threatpost.com/datadog-forces-password-reset-following-breach/119179/) - July 11th, 2016


## Cloud Security lessons learned.

* Avoid the use of long-term AWS Access Keys
* Per DataDog: only "a subset of our AWS S3 buckets" were impacted, indicating that the compromise credentials may have been properly least-privledge.
* As would be expected of an observability company, the time from initial compromise to incident detection was aprox 19 hrs.
