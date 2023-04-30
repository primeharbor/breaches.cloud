---
title: "Chegg (2018)"
date: 2023-04-14T13:19:36-04:00

description: "A Cloud Security focused analysis of the Chegg Data Breach in 2018"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "S3", "Root", "Shared Credentials"]

showToc: true # Do not change
author: "Juan Rodriguez-Cardenas"
author_url: "https://github.com/seraphjrc"

# These details are used to populate the Incident Index page.
victim: "Chegg Inc."
incident_start_date: 2018-04-29
incident_end_date: 2023-01-26
disclosure_date: 2018-09-25
final_status: "Threat Actor Unknown"

---

In April 2018, the educational platform Chegg Inc. suffered a breach leading to the exposure of sensitive data on over 40 million users. A former contractor used AWS root credentials to exfiltrate the data.

<!--more-->

## Incident
### Details of the Incident
In April 2018, Chegg allowed a former contractor to retain access to their AWS Account using root credentials. No multi-factor authentication was enabled for the account. Additionally, Chegg neglected to encrypt employee and user information and used a weak hashing algorithm for the user passwords.
> Using the AWS Root Credentials, the former contractor exfiltrated a database containing personal information of approximately 40 million users of the Chegg platform. The exposed personal information included the S3 User Data consisting of users’ email addresses, first and last names, passwords, and, for certain Chegg users, their Scholarship Search Data, consisting of their religious denomination, heritage, date of birth, parents’ income range, sexual orientation, and disabilities. ... Had Chegg employed reasonable access controls and monitoring, it would have likely detected and/or stopped the attack more quickly.[^1]

In September 2018, a threat intelligence vendor discovered an online forum containing 25 million user passwords in plain text. In response, Chegg required 40 million customers to reset their passwords.

### Timeline
| Date | Event |
| ------ | ----- |
| **April 29, 2018** | A former contractor accessed one of Chegg’s AWS S3 buckets using Root Credentials. |
| **April 29th, 2018** | According to an FTC complaint, the former contractor exfiltrated a database containing the personal information of approximately 40 million users of the Chegg platform.|
| **September 19th, 2018** | Chegg is informed that exfiltrated data has been found in an online forum [^2]. Upon additional investigation, Chegg discovers over 25 million user passwords from the exfiltrated files had been cracked.|
| **September&nbsp;25th,&nbsp;2018** | Chegg [notifies the SEC](https://www.sec.gov/Archives/edgar/data/1364954/000136495418000187/cyrus.htm) of the breach. |
| **September&nbsp;26th,&nbsp;2018** | Chegg [notifies the public](https://oag.ca.gov/system/files/California%20-%20Notice%20Letter%20to%20Consumers_0.PDF) and its users of the data breach.|
| **September&nbsp;28th,&nbsp;2018** | Chegg required over 40 million users to reset their passwords.|
| **September&nbsp;11th,&nbsp;2019** | Class Action [lawsuit filed](https://casetext.com/case/lyles-v-chegg-inc) against Chegg for the April 29th 2018 breach.|
| **April 28th, 2020** | Judge [rules](https://casetext.com/case/lyles-v-chegg-inc) Chegg breach lawsuit must proceed to arbitration. |
| **October 31st, 2022** | FTC Files an Official complaint against Chegg over the 2018 breach and other breaches that happened in 2017, 2019, and 2020 via a phishing attack. |
| **November 8th, 2022** | A [second class action lawsuit](https://www.classaction.org/news/chegg-hit-with-class-action-over-at-least-four-undisclosed-data-breaches-from-2017-2020) was filed against Chegg after the FTC accused the company of multiple cybersecurity faults that led to four data breaches between 2017-2020. |
| **January 26th, 2023** | The FTC and Chegg came to an agreement on an order that involved revamping their security practices, such as updating encryption and changing access controls. Chegg also changes their user data collection limits and how users can handle their own data.|

### Attribution / Perpetrator

According to the [FTC Complaint](2023151-Chegg-Complaint.pdf)[^1], an unnamed former contractor was responsible for using the root credentials to access the personal information.

### Long-term impact

The FTC Ordered Chegg to implement a proper security program[^3], including training for all employees. Chegg must also offer MFA to all users[^4] and submit to regular third-party assessments[^5]. The order also states that users must be allowed to access their own data and have the ability to delete their accounts when desired.

## Summary of Coverage

Chegg: [Letter of notice to Users](https://oag.ca.gov/system/files/California%20-%20Notice%20Letter%20to%20Consumers_0.PDF) - September 19,  2018\
SEC: [FORM 8‑K Disclosure of Security Event](https://www.sec.gov/Archives/edgar/data/1364954/000136495418000187/cyrus.htm)- September 25, 2018\
Reuters: [Judge orders Chegg Breach Cases sent to arbitration](https://www.reuters.com/article/dataprivacy-chegg/chegg-data-breach-lawsuit-heads-to-arbitration-idUSL2N2CG2JU) - April 18, 2020\
Class Action: [Class Action Lawsuit Keller vs Chegg](https://www.classaction.org/news/chegg-hit-with-class-action-over-at-least-four-undisclosed-data-breaches-from-2017-2020#embedded-document) - November 8, 2022 \
FTC: [Official Complaint against Chegg Inc](2023151-Chegg-Complaint.pdf) - October 31, 2022 \
New York Times: [Chegg Statement to the New York Times](https://www.nytimes.com/2022/10/31/business/ftc-chegg-data-security-legal-complaint.html) - October 31, 2022 \
FTC: [Final Decision on Chegg Breaches](Chegg-DecisionandOrder.pdf) - January 26, 2023 \
FTC: [Official Press Release ](https://www.ftc.gov/news-events/news/press-releases/2023/01/ftc-finalizes-order-ed-tech-provider-chegg-lax-security-exposed-student-data)- January 27, 2023
 

## Cloud Security lessons learned.
The cloud security issues outlined here were part of the [FTC's complaint](2023151-Chegg-Complaint.pdf) against Chegg (Paragraph 9, pg2-3):

* Chegg did not issue individual access credentials to each employee. All employees and contractors used the same _shared_ set of credentials.
* Chegg did not use IAM for access to their customer data in S3, instead, they used the root account which has been [against AWS best practices](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_root-user.html) for several years prior to the Chegg breach.
* Chegg did not require MFA on the root AWS account.
* Chegg did not rotate access keys for access to S3.
* Chegg "failed to adequately monitor its networks and systems for unauthorized attempts to transfer or exfiltrate users’ and employees’ personal information".


<!-- Footnotes themselves at the bottom. -->

[^1]: [FTC Complaint](2023151-Chegg-Complaint.pdf) Paragraph 12, pg 2
[^2]: [FTC Complaint](2023151-Chegg-Complaint.pdf) Paragraph 13, pg 2
[^3]: [FTC Decision and Order](Chegg-DecisionandOrder.pdf) Section V, pg 5
[^4]: [FTC Decision and Order](Chegg-DecisionandOrder.pdf) Section III, pg 5
[^5]: [FTC Decision and Order](Chegg-DecisionandOrder.pdf) Section VI, pg 8-10
