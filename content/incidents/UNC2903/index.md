---
title: "UNC2903"
date: 2023-05-10T14:38:46-04:00
lastmod: 2023-05-17T15:48:46-04:00

description: "A Cloud Security focused analysis of UNC2903"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Metadata Abuse", "IMDSv1"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"


# These details are used to populate the Incident Index page.
victim: "Unknown"
incident_start_date: 2021-06-21
incident_end_date: 2021-06-21
disclosure_date: 2022-05-04
final_status: "Victim Unknown"

---

Mandiant identified a new threat actor, UNC2903, attempting to harvest and abuse credentials using Amazon's Instance Metadata Service (IMDS). Mandiant observed that UNC2903 scanned the internet for a particular vulnerability and utilized a relay box to carry out exploitation and related IMDSv1 abuse.

<!--more-->

## Incident

### Details of the Incident

Mandiant studies the common tactics used by various threat actors. In June 2021, Mandiant identified UNC2903 attempting to harvest and abuse credentials using Amazon Instance Metadata Service (IMDS). This [uncategorized threat actor](https://www.mandiant.com/resources/blog/how-mandiant-tracks-uncategorized-threat-actors) began by scanning externally facing AWS infrastructure hosting Adminer, an open-source database management tool written in PHP. Adminer versions 4.0-4.7.9 are vulnerable to [CVE-2021-21311](https://nvd.nist.gov/vuln/detail/CVE-2021-21311), a server-side request forgery.

Once the vulnerable infrastructure was identified, UNC2903 performed further reconnaissance and exploited the web server. After further reconnaissance, UNC2903 would also identify and attempt to exploit other vulnerabilities on the system if there were any.

UNC2903 hosted a pre-configured web server on a relay box with a 301 redirect script back to the `http://169.254.169.254/latest/meta-data/iam/security-credentials/` URL. From the exposed Adminer interface, The attacker entered the address of the relay box hosting the redirect script and then pressed the login button. This fooled the victim's server into following the 301 redirect. The victim's server returned an error, including the redirect output, which contained AWS API credentials. The attacker can then use the access keys provided to access the victim's AWS account.

### Timeline

| Date | Event |
| ------ | ----- |
| **February 2021** | [CVE-2021-21311](https://advantage.mandiant.com/cve/vulnerability--5a1fbe9b-f51e-5cdb-8e5f-25681276b02f) was published for the vulnerable version of adminer. |
|**June 2021** | Mandiant observed that UNC2903 infrastructure was used to scan over 2100 IP addresses, focusing on web services such as port 80 or 443. Eighteen minutes after the CVE-2021-21311, vulnerable adminer.php was discovered by the threat actor through scanning. An automated session from a free VPN service also scanned the adminer.php. |

### Attribution / Perpetrator

This attack has been attributed to UNC2903 by [Mandiant](https://www.mandiant.com/resources/blog/cloud-metadata-abuse-unc2903). However, no other activity has been attributed to his group.

The victim is currently unknown.

## Summary of coverage

* NIST - [NVD - CVE-2021-21311](https://nvd.nist.gov/vuln/detail/CVE-2021-21311) February 11th, 2021
* Mandiant - [Cloud Metadata Abuse by UNC2903](https://www.mandiant.com/resources/blog/cloud-metadata-abuse-unc2903) May 04th, 2022
* SummitRoute - [IMDSv2 Wall of Shame](https://github.com/SummitRoute/imdsv2_wall_of_shame) - List of vendors that do not support IMDSv2

## Cloud Security lessons learned.

As part of Mandiant's write-up, they highlighted a number of failures of the un-identified victim:

- Update to IMDSv2 - This attack would be mitigated by IMDSv2. IMDSv2 remediates this kind of attack by a user obtaining a token from a PUT statement, and that token is then used and repeated from all requests to the IMDS via a special header.
- They didn't restrict the scope of IAM role / credential access to S3 buckets
- There was nothing that prevented the credentials from being used from the internet
- There was no Internet egress filtering to prevent outbound server traffic
- They didn't implement S3 Bucket Policies to further restrict access to the S3 Bucket
- They didn't limit service ports allowed inbound or outbound to the server
- Madiant recommends "Log all the things, and prioritize alerting for possible credential abuse"

