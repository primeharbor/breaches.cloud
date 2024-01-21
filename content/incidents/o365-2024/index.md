---
title: "Office 365 (2024 - Midnight Blizzard)"
date: 2024-01-20T20:14:38-05:00
lastmod: 2024-01-20T20:14:38-05:00

description: "Ongoing analysis of the Office 365 attack against Microsoft by Midnight Blizzard"

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AzureAD","M365", "Cloud Hygiene", "MFA"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Microsoft"
incident_start_date: 2023-11-01
incident_end_date: 2024-01-12
disclosure_date: 2024-01-19
final_status: "Ongoing"

---

Leveraging an unused account, the Russian APT Midnight Blizzard was able to pivot into Microsoft's corporate Office 365 to access the emails of key executives and cyber-security employees. Midnight Blizzard was searching for what information Microsoft knew about themselves.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

Per Microsoft (emphasis mine):
> Beginning in late November 2023, the threat actor used a password spray attack to ***compromise a legacy non-production test tenant account*** and gain a foothold, and then used the account’s permissions to access a very small percentage of Microsoft corporate email accounts, including members of our senior leadership team and employees in our cybersecurity, legal, and other functions, and exfiltrated some emails and attached documents.

[Mandiant has outlined a number of methods](https://www.mandiant.com/resources/blog/apt29-continues-targeting-microsoft) APT29 uses against Microsoft 365 customers. One passage on the above report from 2021 may be relevant:
> Mandiant has begun to observe another trend where threat actors, including APT29, **take advantage of the self-enrollment process** for MFA in Azure Active Directory and other platforms. When an organization first enforces MFA, most platforms allow users to enroll their first MFA device at the next login. This is often the workflow chosen by organizations to roll out MFA. In Azure AD and other platform’s default configuration, there are no additional enforcements on the MFA enrollment process. **In other words, anyone with knowledge of the username and password can access the account from any location and any device to enroll MFA, so long as they are the first person to do it.**



### Timeline
| Date | Event |
| ------ | ----- |
| **Late November, 2023** | Threat actor compromised a legacy account |
| **January 12, 2024** | Microsoft detects compromise of their corporate systems |
| **January 19, 2024** | Microsoft disclosed the incident in a SEC filing and on their blog |


### Attribution / Perpetrator

Microsoft specifically placed the blame on [Midnight Blizzard](https://www.microsoft.com/en-us/security/blog/tag/midnight-blizzard-nobelium/), otherwise known as [Cozy Bear](https://web.archive.org/web/20201215193550/https://www.crowdstrike.com/blog/who-is-cozy-bear/) or [APT29](https://attack.mitre.org/groups/G0016/). This group attributed to the Russian SVR was believed to be responsible for the Solar Winds compromise and the DNC hack of 2015.


### Long-term Impact

To soon to tell. This is the second major incident of a nation-state compromising Office 365 mailboxes, after the [2023 compromise of the US State Department](incidents/o365-2023/) by China's Storm-0558.

In its initial disclosure Microsoft states:
> As we said late last year when we announced Secure Future Initiative (SFI), given the reality of threat actors that are resourced and funded by nation states, we are shifting the balance we need to strike between security and business risk – the traditional sort of calculus is simply no longer sufficient. For Microsoft, this incident has highlighted the urgent need to move even faster. We will act immediately to apply our current security standards to Microsoft-owned legacy systems and internal business processes, even when these changes might cause disruption to existing business processes.

## Summary of Coverage
* Microsoft: [Microsoft Actions Following Attack by Nation State Actor Midnight Blizzard](https://msrc.microsoft.com/blog/2024/01/microsoft-actions-following-attack-by-nation-state-actor-midnight-blizzard/) January 19, 2024
* Securities and Exchange Commission: [Form 8-K](https://www.sec.gov/ix?doc=/Archives/edgar/data/789019/000119312524011295/d708866d8k.htm) January 17, 2024
* Ars Technica: [Microsoft network breached through password-spraying by Russian-state hackers](https://arstechnica.com/security/2024/01/microsoft-network-breached-through-password-spraying-by-russian-state-hackers/) January 19, 2024

## Cloud Security Lessons Learned

From the highlighted paragraph a number of very concerning things are presented:
1. Microsoft didn't clean up the "legacy non-production test tenant", or the accounts in it
2. Microsoft didn't enforce 2FA on accounts in it's non prod environment, if the Russians were able to use a password spray attack.
3. There was a **trust relationship** between this "legacy non-production test tenant", and the primary Microsoft O365 tenant that their most senior executives used.
4. Self-Enrollment for MFA should expire promptly if not enabled.

