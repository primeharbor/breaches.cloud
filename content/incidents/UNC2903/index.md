---
title: "UNC2903"
date: 2023-04-13T14:38:46-04:00
lastmod: 2023-05-11T15:48:46-04:00

description: "A Cloud Security focused analysis of UNC2903"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Metadata Abuse", "IMDSv1]

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

Mandiant identified UNC2903 attempting to harvest and abuse credentials using Amazon's Instance Metadata Service (IMDS). Mandiant observed that UNC2903 utilized a relay box to perform web scanning and carry out exploitation and related IMDSv1 abuse.

\<!--more--\> \<!-- This separates the synopsis from the main body --\>

## Incident

### Details of the Incident

Mandiant has been studying the common tactics used by various threat actors. Mandiant identified UNC2903 attempting to harvest and abuse credentials using Amazon Instance Metadata Service (IMDS). This [uncategorized threat actor](https://www.mandiant.com/resources/blog/how-mandiant-tracks-uncategorized-threat-actors) begins by scanning externally facing AWS infrastructure hosting Adminer software. Adminer is an open-source database management tool written in PHP. Once Infrastructure is identified, they perform further reconnaissance and begin attempting to exploit the web server. Afterward, they will also try to do manual exploitation and test any exploits they identified prior. UNC2903 has been known to use [CVE-2021-21311](https://nvd.nist.gov/vuln/detail/CVE-2021-21311) to exploit out-of-date Adminer software. Adminer versions 4.0-4.7.9 are vulnerable to server-side request forgery. UNC2903 abuses this by hosting a preconfigured web server on a relay box with a 301 redirect script. The attacker will then navigate to the Adminer page, where they will perform the server-side request forgery vulnerability. The attacker will then type in the address of the relay box hosting the redirect script and then presses the login button. This fools the victim's server into following the 301 redirect. The victim server will then return an error to the attacker, but since IMDS returns results from the service, the metadata access keys are displayed in the error message. The attacker can then use the access keys provided to access the cloud infrastructure that the victim is using.

### Timeline

**June 2021** - Mandiant observed that UNC2903 infrastructure was used to scan over 2100 IP addresses, focusing on web services such as port 80 or 443. Eighteen minutes after the CVE-2021-21311, vulnerable adminer.php was discovered by the threat actor through scanning. An automated session from a free VPN service also scanned the adminer.php.



### Attribution / Perpetrator

This attack has been attributed to UNC2903 by [Mandiant](https://www.mandiant.com/resources/blog/cloud-metadata-abuse-unc2903). The victim is currently unknown.

## Summary of coverage

NIST - [NVD - CVE-2021-21311](https://nvd.nist.gov/vuln/detail/CVE-2021-21311) February 11th, 2021

Mandiant - [Cloud Metadata Abuse by UNC2903](https://www.mandiant.com/resources/blog/cloud-metadata-abuse-unc2903) May 04th, 2022

## Cloud Security lessons learned.

As part of Mandiant's write-up, they highlighted a number of failures of the un-identified victim:

- Update to IMDSv2 - This attack would be mitigated by IMDSv2. IMDSv2 remediates this kind of attack by a user obtaining a token from a PUT statement, and that token is then used and repeated from all requests to the IMDS via a special header.
- Restrict the scope of IAM role / credential access to S3 buckets
- Block or reduce IAM role / credential usage ability from the public Internet
- Limit server Internet egress to prevent outbound server traffic
- Implement S3 Bucket Policies to further restrict access to the S3 Bucket
- Enable VPC flows and S3 bucket/object level access data events
- Limit service ports allowed inbound or outbound to the server
- Log all the things, and prioritize alerting for possible credential abuse