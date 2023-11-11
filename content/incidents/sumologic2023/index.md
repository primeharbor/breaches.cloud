---
title: "Sumo Logic 2023"
date: 2023-11-10T19:22:26-05:00
lastmod: 2023-11-10T19:22:26-05:00

description: "Sumo Logic suffers an incident due to compromised AWS credentials"

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["Access Keys","AWS"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Sumo Logic"
incident_start_date: 2023-11-03
incident_end_date: ongoing
disclosure_date: 2023-11-07
final_status: ""

---

Sumo Logic notified customers of an incident and recommended customers rotate credentials in their platform.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

According to the announcemtn posted on the Sumo Logic [Security Response Center](https://www.sumologic.com/security-response-center/)

> On Friday, November 3rd, 2023, Sumo Logic discovered evidence of a potential security incident. The activity identified used a compromised credential to access a Sumo Logic AWS account. We have not at this time discovered any impacts to our networks or systems, and customer data has been and remains encrypted.

### Details of the Incident

Sumo Logic has not provided any further details.

### Attribution / Perpetrator

None at this time.

### Long-term Impact

Sumo Logic notified customers and recommended they rotate all credentials stored in their platform. In a subsequent update on 8 November, they revised the scope to only `Third-party credentials that have been stored with Sumo as part of webhook connection configuration`

## Summary of Coverage
* BleepingComputer: [Sumo Logic discloses security breach, advises API key resets
](https://www.bleepingcomputer.com/news/security/sumo-logic-discloses-security-breach-advises-api-key-resets/) Month Day, Year
* [Sumo Logic Notice](https://www.sumologic.com/security-response-center/#eede153a-8f3f-4eff-858d-1b653eaff457) November 9, 2023 ([Archive.org version](https://web.archive.org/web/20231110000857/https://www.sumologic.com/security-response-center/)) ([Screenshot](ScreenshotInitialDisclosure.png))



## Cloud Security Lessons Learned

Sumo Logic only disclosed the incident resulted from "a compromised credential to access a Sumo Logic AWS account", so we do not know if it was a long-term Access Key or some form of credential compromise of short-term credentials.