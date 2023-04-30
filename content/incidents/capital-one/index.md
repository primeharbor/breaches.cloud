---
title: "Capital One Hack"
date: 2023-03-02T10:49:23-05:00
lastmod: 2023-04-01T10:49:23-05:00
draft: true
# description: "Technical analysis of the 2019 Capital One Hack"
tags: ["AWS", "SSRF", "FinTech", "IMDSv1"]
showToc: true
# author: "Donald Trump"
# author_url: "https://www.cnn.com/"

victim: "Capital One"
incident_start_date: 2019-03-12
incident_end_date: 2019-07-17
disclosure_date: 2019-07-29
final_status: "Perpetrator Plead Guilty"

---

In July 2019, Capital One, a major US bank, announced that it had suffered a data breach affecting approximately 100 million individuals in the US and 6 million in Canada. The breach was caused by a hacker who exploited a vulnerability in Capital One's cloud-based infrastructure to access customer data, including names, addresses, dates of birth, credit scores, and Social Security numbers. The hacker was able to obtain this data by exploiting a "misconfigured firewall" in Capital One's cloud infrastructure.

<!--more-->  <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident
The [DOJ Criminal Complaint](thompson_complaint.pdf) outlines how the attacker was able to obtain credentials to Capital One's AWS Account, and use those credentials to exfiltrate data.

From March 12th 2019 to July 17th 2019, the attacker downloaded data from more than 100 million Capital One users, including 120,000 Social Security numbers and about 77,000 bank account numbers [cite](https://www.seattletimes.com/business/no-prison-for-seattle-hacker-behind-capital-one-250m-data-breach/).

As outlined in the Criminal Complaint, the attacker uploaded some data as a gist in GitHub. An un-disclosed indivdual notified Capital One via their responsible disclosure program. It is presumed that Capital One notified Law Enforcement at that point.


### Attribution / Perpetrator
The [DOJ Criminal Complaint](https://www.justice.gov/d9/press-releases/attachments/2019/07/29/thompson_complaint.pdf) cites Paige A. Thompson as the person behind the breach. She pled guilty on XX and was sentenced to probation on XX.

Thompson worked at Amazon prior to the incident. Her GitHub handle, as cited in the indictment, was `erratic`.

### Long-term impact

The Capital One breach was a large enough event that it triggered [Congressional inquiries](080519-Letter-to-Amazon-re-Capital-One-Hack.pdf). As a result of the Capital One Hack, AWS released the [Instance Metadata Service v2](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html), which makes it significantly more difficult to exploit SSRF vulnerabilities.

## Summary of coverage
* US DOJ: [Seattle Tech Worker Arrested for Data Theft Involving Large Financial Services Company](https://www.justice.gov/usao-wdwa/pr/seattle-tech-worker-arrested-data-theft-involving-large-financial-services-company) July 29, 2019
* US DOJ: [Criminal Complaint](https://www.justice.gov/d9/press-releases/attachments/2019/07/29/thompson_complaint.pdf) July 29, 2019
* Capital One Newsroom: [Capital One Announces Data Security Incident](https://www.capitalone.com/about/newsroom/capital-one-announces-data-security-incident/) July 29, 2019
* [Letter from Sen. Ron Wyden to AWS](https://www.wyden.senate.gov/imo/media/doc/081319%20Amazon%20Letter%20to%20Sen%20Wyden%20RE%20Consumer%20Data.pdf) Aug 5th, 2019
* [AWS Response to Sen. Ron Wyden](https://www.wyden.senate.gov/imo/media/doc/081319%20Amazon%20Letter%20to%20Sen%20Wyden%20RE%20Consumer%20Data.pdf) Aug 13th, 2019
* AWS: [Blog Post announcing IMDSv2](https://aws.amazon.com/blogs/security/defense-in-depth-open-firewalls-reverse-proxies-ssrf-vulnerabilities-ec2-instance-metadata-service/) Nov 19th, 2019
* Seattle Times: [Ex-Amazon worker convicted in massive Capital One hack](https://www.seattletimes.com/business/ex-amazon-worker-convicted-in-massive-capital-one-hack/) June 17, 2022
* Seattle Times: [No prison for Seattle hacker behind Capital One $250M data](https://www.seattletimes.com/business/no-prison-for-seattle-hacker-behind-capital-one-250m-data-breach/) October 4th, 2022
* Capital One: [Information on the Capital One cyber incident](https://www.capitalone.com/digital/facts2019/)
* SeattleMet: [Clouded Judgment: How a Former Amazon Employee Hacked Capital One](https://www.seattlemet.com/news-and-city-life/2023/04/how-a-former-amazon-web-services-employee-hacked-capital-one-paige-thompson-seattle) Apr 4th, 2023

## Cloud Security Implications of this incident.

The criminal complaint makes numerous references to a `****-WAF-Role`, and that Thompson was able to use credentials from that WAF-Role to access Capital One's "folders at the Cloud Computing Company". One of the commands used was the "List Buckets Command".


