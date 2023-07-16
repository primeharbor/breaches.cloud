---
title: "Office 365 (2023)"
date: 2023-07-14T14:12:47-04:00
lastmod: 2023-07-14T14:12:47-04:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["Logging","AzureAD","M365"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "US Department of State & Department of Commerce, among others"
incident_start_date: 2023-05-15
incident_end_date: 2023-06-16
disclosure_date: 2023-07-11
final_status: "Investigation ongoing"

---

In July of 2023, Microsoft [disclosed](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/) a compromise of Exchange Online that targeted "25 organizations ... including government agencies as well as related consumer accounts of individuals likely associated with these organizations." The vector of compromise was several validation flaws in the Microsoft-hosted Exchange Online and AzureAD services.


<!--more--> <!-- This separates the synopsis from the main body -->


## Incident

### Details of the Incident

As reported by [CISA]():
> In June 2023, a Federal Civilian Executive Branch (FCEB) agency [subsequently [identified by CNN](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) as the US State Dept] identified suspicious activity in their Microsoft 365 (M365) cloud environment. The agency reported the activity to Microsoft and the Cybersecurity and Infrastructure Security Agency (CISA), and Microsoft determined that advanced persistent threat (APT) actors accessed and exfiltrated unclassified Exchange Online Outlook data.

In as yet undisclosed method, the threat actor obtained a Microsoft Account (MSA) consumer signing key. Leveraging that very sensitive key, the threat actor pivoted into enterprise Exchange environments due to a validation error on Microsoft's part. Per Microsoft: **"The method by which the actor acquired the key is a matter of ongoing investigation."**[^1]

Identified victims include:
* US Department of State
* US Department of Commerce
* Commerce Secretary Gina Raimondo’s email account
* "email accounts at the House of Representatives"[^2]

### Timeline
| Date | Event |
| ------ | ----- |
| **May 15, 2023** | Storm-0558 begins to use forged authentication tokens to access mailboxes |
| **June 16, 2023** | Federal Agency notices abnormal `MailItemsAccessed` in M365 Audit Logs |
| **June 16, 2023** | Microsoft disabled stolen keys and disables  |
| **July 11, 2023** | Microsoft quietly discloses the incident on their [security blog](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/)  |
| **July 12, 2023** | CISA issues an [advisory](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-193a) describing the incident   |
| **July 14, 2023** | Microsoft discloses a [signing key](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) was compromised and used in this incident   |

### Attribution / Perpetrator
Microsoft has designated this threat actor ***Storm-0558*** "a China-based threat actor with espionage objectives" and "maintain[s] high confidence that Storm-0558 operates as its own distinct group".

### Long-term Impact

So far there have been [calls](https://arstechnica.com/security/2023/07/microsoft-takes-pains-to-obscure-role-in-0-days-that-caused-email-breach/#:~:text=Microsoft%20is%20under%20fire%20for%20withholding%20details%20that%20some%20of%20the%20victims%20could%20have%20used%20to%20detect%20the%20intrusion%2C%20something%20critics%20have%20called%20%E2%80%9Cpay%2Dto%2Dplay%20security.%E2%80%9D) for Microsoft to change it's licensing model to give _all customers_ the same level of audit logging that the Department of State had subscribed to. [Both CISA and Sen. Ron Wyden have called out Microsoft](https://www.wsj.com/articles/china-hacking-was-undetectable-for-some-who-had-less-expensive-microsoft-services-58730629) for only providing the logging necessary to detect this incident under their highest tier license.

> “Every organization using a technology service like Microsoft 365 should have access to logging and other security data out of the box to reasonably detect malicious cyber activity,” a senior CISA official said Wednesday on a press call discussing the incident.

## Summary of Coverage

* CISA: [Enhanced Monitoring to Detect APT Activity Targeting Outlook Online](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-193a) - July 12th, 2023
* Microsoft: [Microsoft mitigates China-based threat actor Storm-0558 targeting of customer email](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/) - July 11th, 2023
* Microsoft: [Analysis of Storm-0558 techniques for unauthorized email access](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) - July 14th, 2023
* Wired: [](https://www.wired.com/story/microsoft-cloud-attack-china-hackers/?redirectURL=%2Fstory%2Fmicrosoft-cloud-attack-china-hackers%2F) - July 12th, 2023
* CNN: [China-based hackers breached US government email accounts, Microsoft and White House say](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) - July 12th, 2023
* Ars Technica: [Microsoft takes pains to obscure role in 0-days that caused email breach](https://arstechnica.com/security/2023/07/microsoft-takes-pains-to-obscure-role-in-0-days-that-caused-email-breach/) - July 14th, 2023
* WSJ: [China Hacking Was Undetectable for Some Who Had Less Expensive Microsoft Services](https://www.wsj.com/articles/china-hacking-was-undetectable-for-some-who-had-less-expensive-microsoft-services-58730629) - July 13, 2023

## Cloud Security Lessons Learned

While this incident was the direct responsibility of Microsoft, one lesson for organizations operating in the cloud is to ensure that you're paying for the proper level of logging for your risk profile.


[^1]: Microsoft: [Analysis of Storm-0558 techniques for unauthorized email access](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) July 14th, 2023
[^2]: CNN [China-based hackers breached US government email accounts, Microsoft and White House say](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) July 12th, 2023





