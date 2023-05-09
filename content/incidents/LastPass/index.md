---
title: "LastPass"
date: 2023-03-18T10:53:42-04:00

description: "A Cloud Security focused analysis of the LastPass incidents of 2022"

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Access Keys", "Spear Phishing", "Mishandled Secrets"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "LastPass"
incident_start_date: 2022-08-08
incident_end_date: 2022-10-26
disclosure_date: 2022-12-22
final_status: "Threat Actor unknown"

---

In 2022, LastPass suffered a series of breaches, eventually leading to customer password vaults being taken. This incident is notable because it is the first time we've seen evidence that a threat actor targeted a specific employee's home network to capture privileged cloud credentials.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident
### Details of the Incident
LastPass published two detailed incident reports from the [August](https://support.lastpass.com/help/incident-1-additional-details-of-the-attack
) and [December](https://support.lastpass.com/help/incident-2-additional-details-of-the-attack
) Incidents.

In August of 2022, an unknown party compromised a developer's corporate laptop to access non-production environments and source code repositories. *"Some of these source code repositories included cleartext embedded credentials, stored digital certificates related to our development environments, and some encrypted credentials used for production capabilities such as backup."[^1]*

The employee laptop's *"Endpoint Detection Response (EDR) agent, … was tampered with and was not triggered during the initial activity."*[^1]

Per LastPass's disclosures, their production environment was on-prem, and only their non-production was "cloud-based". No customer data was exposed in the August incident. However,
> *"The second incident saw the threat actor quickly make use of information exfiltrated during the first incident, prior to the reset completed by our teams, to enumerate and ultimately exfiltrate data from the cloud storage resources."[^2]*
>
> The *"threat actor targeted one of the four DevOps engineers who had access to the decryption keys needed to access the cloud storage service. This was accomplished by targeting the DevOps engineer’s home computer and exploiting a vulnerable third-party media software package, which enabled remote code execution capability and allowed the threat actor to implant keylogger malware. The threat actor was able to capture the employee’s* [LastPass] *master password as it was entered, after the employee authenticated with MFA, and gain access to the DevOps engineer’s LastPass corporate vault."*
>
> *"Ultimately AWS GuardDuty Alerts informed us of anomalous behavior as the threat actor attempted to use Cloud Identity and Access Management (IAM) roles to perform unauthorized activity."*

### Timeline
| Date | Event |
| ------ | ----- |
| **August 8th, 2022** | Threat-actor activity began.|
| **August 12th, 2022** | LastPass detects "unusual activity" in their development environment.|
| **August 13th, 2022** | Mandiant was engaged to assist in the IR process.|
| **August 25th, 2022** | LastPass discloses that *"an unauthorized party"* *"took portions of source code and some proprietary LastPass technical information"*. No customer vaults were impacted.|
| **August 12th to October 26th, 2022** | The threat actor *"was actively engaged in a new series of reconnaissance, enumeration, and exfiltration activities aligned to the cloud storage environment"*[^2]|
| **December 22nd, 2022** | LastPass discloses that "an unknown threat actor accessed a cloud-based storage environment" and "The threat actor was also able to copy a backup of customer vault data".|
| **January 3rd, 2023** | Class Action Suit filed in the US District Court of Massachusetts|
| **March 1st, 2023** | LastPass discloses how the threat actor compromised both engineers to execute both the first and second incidents.|

### Attribution / Perpetrator
Per the March 1st disclosure:
> "the identity of the threat actor and their motivation remains unknown. There has been no contact or demands made, and there has been no detected credible underground activity indicating that the threat actor is actively engaged in marketing or selling any information obtained during either incident."[^3]

## Summary of coverage
* LastPass: [Original disclosure from Aug 2022](https://web.archive.org/web/20220831034948/https://blog.lastpass.com/2022/08/notice-of-recent-security-incident/) - August 25, 2022
* LastPass: [Notice of Recent Security Incident](https://blog.lastpass.com/2022/12/notice-of-recent-security-incident/
) - December 22nd, 2022
* ArsTechnica: [LastPass users: Your info and password vault data are now in hackers’ hands](https://arstechnica.com/information-technology/2022/12/lastpass-says-hackers-have-obtained-vault-data-and-a-wealth-of-customer-info/
) - December 22, 2022
* [Class Action Lawsuit filing](https://assets.law360news.com/1562000/1562534/https-ecf-mad-uscourts-gov-doc1-095111497456.pdf)  - January 3, 2023
* ArsTechnica: [LastPass says employee’s home computer was hacked and corporate vault taken](https://arstechnica.com/information-technology/2023/02/lastpass-hackers-infected-employees-home-computer-and-stole-corporate-vault/) - February 27, 2023
* LastPass: [Security Incident Update and Recommended Actions](https://blog.lastpass.com/2023/03/security-incident-update-recommended-actions/
) - March 1, 2023
* LastPass: [Incident 1 Report](https://support.lastpass.com/help/incident-1-additional-details-of-the-attack) - undated support post
* LastPass: [Incident 2 Report](https://support.lastpass.com/help/incident-2-additional-details-of-the-attack) - undated support post


## Cloud Security Implications of this incident.
A number of cloud security lessons jump out from LastPass's two incident reports:
* LastPass had clear-text credentials in their source code which were used to conduct the second, more serious attack.
* Per the August disclosure, they then *"deployed a market-leading Cloud Security Posture Management (CSPM)"* indicating they may not have had one before.
* Per the August disclosure, they *"restricted and removed access of engineers/developers to the underlying cloud platform"*, indicating they may have had more people with access than necessary.
* *"The threat actor was able to leverage valid credentials stolen from a senior DevOps engineer to access a shared cloud-storage environment, which initially made it difficult for investigators to differentiate between threat actor activity and ongoing legitimate activity."*
* Based on the December incident report, LastPass was using long-term access keys and IAM Users and had a number of inactive development IAM users.

A few other incident response things to note:
* Per the August disclosure, the attacker had a four-day dwell time before detection.


[^1]: https://support.lastpass.com/help/incident-1-additional-details-of-the-attack
[^2]: https://support.lastpass.com/help/incident-2-additional-details-of-the-attack
[^3]: https://blog.lastpass.com/2023/03/security-incident-update-recommended-actions
