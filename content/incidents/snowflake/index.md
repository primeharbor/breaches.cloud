---
title: "Snowflake"
date: 2024-06-30T11:08:05-04:00
lastmod: 2024-07-12T11:08:05-04:00

description: "Analysis of the Snowflake customer data breaches of 2024"

# # Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["MFA","Snowflake","Shared Responsibility", "Credential Rotation"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Multiple Customers"
incident_start_date: 2024-05-20
incident_end_date: 2023-03-02
disclosure_date: 2023-03-01
final_status: "N/A"

---

In the spring of 2024, a number of Snowflake customers suffered data breaches when cybercriminals announced they had data sets from high-profile customers like TicketMaster, LendingTree, Neiman Marcus, and Santander.

While Snowflake & [Mandiant found no evidence](https://cloud.google.com/blog/topics/threat-intelligence/unc5537-snowflake-data-theft-extortion) their cloud offering was compromised, these incidents became a serious public relations issue.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

The threat actor used infostealer tools to gain access to several companies' Snowflake credentials. These accounts lacked MFA, even though they had access to millions of records of sensitive personal information. [Mitiga](https://www.mitiga.io/blog/tactical-guide-to-threat-hunting-in-snowflake-environments) identified an attack tool named "rapeflake," which was then used to extract the data.

This first came to light when...
> ... one or more crooks going by the handle ShinyHunters was spotted putting what's understood to be 1.3TB of data stolen from Ticketmaster up for sale on an underworld forum. That trove, yours for $500,000, is said to contain records on 560 million Ticketmaster customers: Their names, email addresses, phone numbers, physical addresses, transaction details, and partial payment card information. ([The Register](https://www.theregister.com/2024/05/31/snowflake_breach_report/))




#### Victims

165 Victims have been identified and notified. The following notable organizations have confirmed breaches:

* Advanced Auto Parts
* [Los Angeles Unified School District](https://www.latimes.com/california/story/2024-06-07/lausd-investigates-claims-that-student-and-teacher-data-are-for-sale-on-the-dark-web)
* Lending Tree / QuoteWizard
* [Santander](https://www.bleepingcomputer.com/news/security/shinyhunters-claims-santander-breach-selling-data-for-30m-customers/)
* [Ticketmaster](https://www.bleepingcomputer.com/news/security/data-of-560-million-ticketmaster-customers-for-sale-after-alleged-breach/)



### Timeline
| Date | Event |
| ------ | ----- |
| **Apr 14th, 2024** | First activity identified by Mandiant |
| **May 22th, 2024** | Snowflake & Law Enforcement notified |
| **May 27th, 2024** | ShinyHunters offers up records on 560 million TicketMaster customers on BreachForums |
| **May 31st, 2024** | Hudson Rock [publishes report on the incident](https://web.archive.org/web/20240531140540/https:/hudsonrock.com/blog/snowflake-massive-breach-access-through-infostealer-infection), which [Snowflake pressured to have taken down](https://www.linkedin.com/posts/hudson-rock_activity-7203433945919578113-RH05/). |
| **May 31st, 2024** | Mitiga publishes [the first report](https://www.mitiga.io/blog/tactical-guide-to-threat-hunting-in-snowflake-environments) on issues with Snowflake breaches |
| **June 10th, 2024** | [Mandiant releases report](https://cloud.google.com/blog/topics/threat-intelligence/unc5537-snowflake-data-theft-extortion) confirming no breach with Snowflake itself and attributing the attack to UNC5537. |
| **July 9th, 2024** | Snowflake [finally allows customers to force MFA](https://www.snowflake.com/blog/snowflake-admins-enforce-mandatory-mfa/) on all their users |


### Attribution / Perpetrator

> It's believed ShinyHunters is acting as a broker for the data, which was stolen by someone else. ([The Register](https://www.theregister.com/2024/06/04/snowflake_report_pulled/))

Mandiant is tracking this group as UNC5537, "a financially motivated threat actor" primarily based in North America.

## Summary of Coverage
* Mitiga: [Tactical Guide to Threat Hunting in Snowflake Environments](https://www.mitiga.io/blog/tactical-guide-to-threat-hunting-in-snowflake-environments) May 31st, 2024
* SEC: [8-K Item 8.01 - Live Nation Entertainment](https://www.sec.gov/Archives/edgar/data/1335258/000133525824000081/lyv-20240520.htm?=7194ef805fa2d04b0f7e8c9521f97343) May 31, 2024
* TechCrunch: [Live Nation confirms Ticketmaster was hacked, says personal information stolen in data breach](https://techcrunch.com/2024/05/31/live-nation-confirms-ticketmaster-was-hacked-says-personal-information-stolen-in-data-breach/) May 31, 2024
* Australian Cyber Security Centre: [Increased cyber threat activity targeting Snowflake customers](https://www.cyber.gov.au/about-us/view-all-content/alerts-and-advisories/increased-cyber-threat-activity-targeting-snowflake-customers) June 1st, 2024
* Snowflake: [Detecting and Preventing Unauthorized User Access: Instructions](https://community.snowflake.com/s/article/Communication-ID-0108977-Additional-Information) June 3, 2024
* CISA: [Snowflake Recommends Customers Take Steps to Prevent Unauthorized Access](https://www.cisa.gov/news-events/alerts/2024/06/03/snowflake-recommends-customers-take-steps-prevent-unauthorized-access) June 03, 2024
* The Register: [Hudson Rock yanks report fingering Snowflake employee creds snafu for mega-leak](https://www.theregister.com/2024/06/04/snowflake_report_pulled/) June 4th, 2024
* TechCrunch: [Hundreds of Snowflake customer passwords found online are linked to info-stealing malware](https://techcrunch.com/2024/06/05/snowflake-customer-passwords-found-online-infostealing-malware/) June 5th, 2024
* BleepingComputer: [Advance Auto Parts stolen data for sale after Snowflake attack](https://www.bleepingcomputer.com/news/security/advance-auto-parts-stolen-data-for-sale-after-snowflake-attack/) June 5, 2024
* Wired: [https://www.wired.com/story/snowflake-breach-advanced-auto-parts-lendingtree/](https://www.wired.com/story/snowflake-breach-advanced-auto-parts-lendingtree/) June 6, 2024
* TechCrunch: [What Snowflake isn’t saying about its customer data breaches](https://techcrunch.com/2024/06/07/snowflake-ticketmaster-lendingtree-customer-data-breach/) June 7, 2024
* Wired: [Hackers Detail How They Allegedly Stole Ticketmaster Data From Snowflake](https://www.wired.com/story/epam-snowflake-ticketmaster-breach-shinyhunters/) June 17, 2024
* The Record: [More than 12,000 Santander employees in US affected by Snowflake customer breach](https://therecord.media/santander-employees-bank-breach-affected) June 20th, 2024
* BleepingComputer: [Neiman Marcus confirms data breach after Snowflake account hack](https://www.bleepingcomputer.com/news/security/neiman-marcus-confirms-data-breach-after-snowflake-account-hack/)

## Cloud Security Lessons Learned

This was not a breach for which Snowflake was directly responsible.
> Mandiant's investigation has not found any evidence to suggest that unauthorized access to Snowflake customer accounts stemmed from a breach of Snowflake's enterprise environment. Instead, every incident Mandiant responded to associated with this campaign was traced back to compromised customer credentials. ([Mandiant Report](https://cloud.google.com/blog/topics/threat-intelligence/unc5537-snowflake-data-theft-extortion#:~:text=Mandiant%27s%20investigation%20has,compromised%20customer%20credentials.))

However, Snowflake, like all cloud providers, is responsible for ensuring its products are used safely.
> Despite the sensitive data that Snowflake holds for its customers, Snowflake lets each customer manage the security of their environments and does not automatically enroll or require its customers to use multi-factor authentication, or MFA, according to Snowflake’s customer documentation. ([src](https://techcrunch.com/2024/06/05/snowflake-customer-passwords-found-online-infostealing-malware/))

Specific to the customer side of Shared-Responsibility, Mandiant indicates that the victimized customers
> ...**did not require multi-factor authentication** and in many cases, the **credentials had not been rotated** for as long as four years. **Network allow lists were also not used** to limit access to trusted locations.

Mandiant also calls out unmanaged contractor devices as the initial compromise point for several customers.

> In several Snowflake related investigations, Mandiant observed that the initial compromise of infostealer malware occurred on contractor systems that were also used for personal activities, including gaming and downloads of pirated software. Contractors that customers engage to assist with their use of Snowflake may utilize personal and/or non-monitored laptops that exacerbate this initial entry vector.


