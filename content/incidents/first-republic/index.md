---
title: "First Republic Bank"
date: 2023-12-13T04:16:54-05:00
lastmod: 2023-12-13T04:16:54-05:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS","Insider Threat"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "First Republic Bank"
incident_start_date: 2020-03-11
incident_end_date: 2020-03-12
disclosure_date: N/A
final_status: "Perpetrator Plead Guilty"

---

In March 2020, a cloud engineer was terminated from First Republic Bank and subsequently accessed their AWS & GitHub environment to cause damage.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

Miklos Daniel Brody was employed as a cloud engineer for First Republic Bank. In March of 2020, he was terminated for violation of company policies. He had in his possession a company-issued PC and Macbook. He surrendered the PC at his termination on March 11, 2020, but did not have his Macbook present at the time. Later that evening, he used the Macbook to log in to the corporate VPN.

Once logged into the corporate VPN, Brody, as alleged in the criminal complaint:
1. Logged into a Linux jump box
2. Overwrote system logs
3. "used a Linux administrator account to impersonate" another employee
4. From an enterprise GitHub server, used a script to "terminate almost all instances in Amazon Web Services".
5. Deleted code repositories
6. "broke the Ansible Tower."
7. "locked users out of an Amazon service called EMR. The primary purpose of this is to do mathematics."


### Timeline
| Date | Event |
| ------ | ----- |
| **March 2, 2020** | Brody plugs in two USB Sticks to his company-issued PC |
| **March 11, 2020 3 pm** | Brody is terminated from First Republic Bank |
| **March 11, 2020 7:16 pm** | Brody signs into First Republic VPN using MFA. |
| **March 11, 2020 7:55 to <br>March 12, 2020 10:30 am** | Malicious Activity at the bank  |
| **March 12, 2020 10:30 am** | Brody's credentials were finally deactivated |
| **March 13 - 30, 2020** | FRB attempts to recovery Brody's Macbook |
| **March 16, 2020** | Brody files police report claiming the Macbook was stolen |
| **April 5, 2023** | Brody pled guilty to two counts |
| **December 11, 2023** | Brody sentenced to 24 months, and fined $529k |

### Attribution / Perpetrator

Miklos Daniel Brody was indicted in 2020 and pled guilty in April 2023. He was sentenced on December 11, 2023, to 24 months in prison and ordered to pay restitution of $529k.

### Long-term Impact

The [Criminal Complaint](gov.uscourts.cand.375169.1.0_1.pdf) lists monetary damages to First Republic Bank in excess of $220,000.

## Summary of Coverage
* US District Court: [Criminal Complaint](gov.uscourts.cand.375169.1.0_1.pdf) March 11, 2021
* DOJ: ["Disgruntled Cloud Engineer Sentenced To Two Years In Prison For Intentionally Damaging His Former Employer’s Computer Network After He Was Fired"](https://www.justice.gov/usao-ndca/pr/disgruntled-cloud-engineer-sentenced-two-years-prison-intentionally-damaging-his) December 11, 2023
* Bleeping Computer: [Cloud engineer gets 2 years for wiping ex-employer’s code repos](https://www.bleepingcomputer.com/news/security/cloud-engineer-gets-2-years-for-wiping-ex-employers-code-repos/) December 12, 2023


## Cloud Security Lessons Learned

From 3 pm, when his termination meeting began, to 10:30 am, the next morning, First Republic neglected to disable Brody's VPN access.
