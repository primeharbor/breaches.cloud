---
title: "Office 365 (2023)"
date: 2023-07-14T14:12:47-04:00
lastmod: 2023-07-21T07:54:00-04:00

description: "Ongoing analysis of the O365 Hack"

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

As reported by [CISA](CISA-Advisory.pdf):
> In June 2023, a Federal Civilian Executive Branch (FCEB) agency [subsequently [identified by CNN](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) as the US State Dept] identified suspicious activity in their Microsoft 365 (M365) cloud environment. The agency reported the activity to Microsoft and the Cybersecurity and Infrastructure Security Agency (CISA), and Microsoft determined that advanced persistent threat (APT) actors accessed and exfiltrated unclassified Exchange Online Outlook data.

In as yet undisclosed method, the threat actor obtained a Microsoft Account (MSA) consumer signing key. Leveraging that very sensitive key, the threat actor pivoted into enterprise Exchange environments due to a validation error on Microsoft's part. Per Microsoft: **"The method by which the actor acquired the key is a matter of ongoing investigation."**[^1]

Identified victims include:
* US Department of State
* US Department of Commerce
* Commerce Secretary Gina Raimondo’s email account
* "email accounts at the House of Representatives"[^2]
* The US Ambassador to China, Nicholas Burns

In a follow up research post, cloud security company Wiz noted:

> "Our researchers concluded that the compromised MSA key could have allowed the threat actor to forge access tokens for multiple types of Azure Active Directory applications, including every application that supports personal account authentication, such as SharePoint, Teams, OneDrive, customers’ applications that support the “login with Microsoft” functionality, and multi-tenant applications in certain conditions."

> This led us to believe that although the compromised key acquired by Storm-0558 was a private key designed for Microsoft's MSA tenant in Azure, it was also able to sign OpenID v2.0 tokens for multiple types of Azure Active Directory applications.



### Timeline
| Date | Event |
| ------ | ----- |
| **May 15, 2023** | Storm-0558 begins to use forged authentication tokens to access mailboxes |
| **June 16, 2023** | Federal Agency notices abnormal `MailItemsAccessed` in M365 Audit Logs |
| **June 16, 2023** | Microsoft disabled stolen keys and disables  |
| **July 11, 2023** | Microsoft quietly discloses the incident on their [security blog](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/)  |
| **July 12, 2023** | CISA issues an [advisory](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-193a) describing the incident   |
| **July 14, 2023** | Microsoft discloses a [signing key](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) was compromised and used in this incident   |
| **July 19, 2023** | Microsoft announces that the E5 Audit logs that enabled detection of this incident will now be available to all customers. |
| **July 20, 2023** | [WSJ Reports](https://www.wsj.com/articles/u-s-ambassador-to-china-hacked-in-china-linked-spying-operation-f03de3e4?st=l642zzi8wtmw1bo&reflink=desktopwebshare_permalink) the US Ambassador to China was one of the victims |
| **July 21, 2023** | Cloud Security firm [Wiz](https://wiz.io/) publishes a [blog post](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr) which outlines broader _potential_ impacts due to the signing key leak.  |
| **July 27, 2023** | Sen. Wyden [sends letter](wyden_letter_to_cisa_doj_ftc_re_2023_microsoft_breach.pdf) to the Attorney General and heads of CISA and the FTC asking them to investigate Microsoft's security practices. |


### Attribution / Perpetrator
Microsoft has designated this threat actor ***Storm-0558*** "a China-based threat actor with espionage objectives" and "maintain[s] high confidence that Storm-0558 operates as its own distinct group".

### Long-term Impact

So far there have been [calls](https://arstechnica.com/security/2023/07/microsoft-takes-pains-to-obscure-role-in-0-days-that-caused-email-breach/#:~:text=Microsoft%20is%20under%20fire%20for%20withholding%20details%20that%20some%20of%20the%20victims%20could%20have%20used%20to%20detect%20the%20intrusion%2C%20something%20critics%20have%20called%20%E2%80%9Cpay%2Dto%2Dplay%20security.%E2%80%9D) for Microsoft to change it's licensing model to give _all customers_ the same level of audit logging that the Department of State had subscribed to. [Both CISA and Sen. Ron Wyden have called out Microsoft](https://www.wsj.com/articles/china-hacking-was-undetectable-for-some-who-had-less-expensive-microsoft-services-58730629) for only providing the logging necessary to detect this incident under their highest tier license.

> “Every organization using a technology service like Microsoft 365 should have access to logging and other security data out of the box to reasonably detect malicious cyber activity,” a senior CISA official said Wednesday on a press call discussing the incident.

Microsoft was forced to concede this revenue stream and will make these logs free starting in September 2023.

[Senator Ron Wyden](https://www.wyden.senate.gov/) (D-OR) [sent a letter](wyden_letter_to_cisa_doj_ftc_re_2023_microsoft_breach.pdf) to the US Attorney General, along with the heads of CISA and the FTC asking for:
1. The CISA director to investingate this breach under her shared authority to direct the Cyber Safety Review Board.
2. The Attorney General to determine if Microsoft violated federal law in failing to follow required cybersecurity standards for government contractors
3. The FTC to investigate Microsoft’s privacy and data security practices, and to determine if Microsoft violated a consent decree relating to Passport, a predecessor product to Microsoft Account.

It is too early to determine what if any impact will occur to Microsoft from the DOJ or FTC, or what other practices CISA will find.

## Summary of Coverage

* Microsoft: [Microsoft mitigates China-based threat actor Storm-0558 targeting of customer email](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/) - July 11th, 2023
* CISA: [Enhanced Monitoring to Detect APT Activity Targeting Outlook Online](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-193a) - July 12th, 2023
* Wired: [How a Cloud Flaw Gave Chinese Spies a Key to Microsoft’s Kingdom](https://www.wired.com/story/microsoft-cloud-attack-china-hackers/?redirectURL=%2Fstory%2Fmicrosoft-cloud-attack-china-hackers%2F) - July 12th, 2023
* CNN: [China-based hackers breached US government email accounts, Microsoft and White House say](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) - July 12th, 2023
* WSJ: [China Hacking Was Undetectable for Some Who Had Less Expensive Microsoft Services](https://www.wsj.com/articles/china-hacking-was-undetectable-for-some-who-had-less-expensive-microsoft-services-58730629) - July 13, 2023
* Microsoft: [Analysis of Storm-0558 techniques for unauthorized email access](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) - July 14th, 2023
* Ars Technica: [Microsoft takes pains to obscure role in 0-days that caused email breach](https://arstechnica.com/security/2023/07/microsoft-takes-pains-to-obscure-role-in-0-days-that-caused-email-breach/) - July 14th, 2023
* CISA: [CISA and Microsoft Partnership Expands Access to Logging Capabilities Broadly](https://www.cisa.gov/news-events/news/cisa-and-microsoft-partnership-expands-access-logging-capabilities-broadly) - July 19th, 2023
* Wiz: [Compromised Microsoft Key: More Impactful Than We Thought](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr) - July 21st, 2023

## Cloud Security Lessons Learned

While this incident was the direct responsibility of Microsoft, one lesson for organizations operating in the cloud is to ensure that you're paying for the proper level of logging for your risk profile.

The Wiz blog has a number of [suggestions](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr#how-to-detect-the-compromised-key-in-your-environment-57) for detecting if your envionment was impacted by the leaked MSA key.

[^1]: Microsoft: [Analysis of Storm-0558 techniques for unauthorized email access](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) July 14th, 2023
[^2]: CNN [China-based hackers breached US government email accounts, Microsoft and White House say](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) July 12th, 2023





