---
title: "Microsoft (Storm-0558)"
date: 2023-07-14T14:12:47-04:00
lastmod: 2024-04-13T19:43:38-05:00

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
final_status: "CSRB Report Issued"

---

In July of 2023, Microsoft [disclosed](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/) a compromise of Exchange Online that targeted "25 organizations ... including government agencies as well as related consumer accounts of individuals likely associated with these organizations." The vector of compromise was several validation flaws in the Microsoft-hosted Exchange Online and AzureAD services.

As part of the [Cyber Safety Review Board investigation](CSRB_Review_of_the_Summer_2023_MEO_Intrusion_Final_508c.pdf) of this incident, [CISA](https://www.cisa.gov/) issued a number of findings citing Microsoft's negligence in securing their cloud infrastructure and make recommendations to both Microsoft and all cloud service providers.

From their [press-release](https://www.dhs.gov/news/2024/04/02/cyber-safety-review-board-releases-report-microsoft-online-exchange-incident-summer:
> “Cloud computing is some of the most critical infrastructure we have, as it hosts sensitive data and powers business operations across our economy,” said DHS Under Secretary of Policy and CSRB Chair Robert Silvers. “It is imperative that cloud service providers prioritize security and build it in by design."

<!--more--> <!-- This separates the synopsis from the main body -->


## Incident

### Details of the Incident

As reported by [CISA](CISA-Advisory.pdf):
> In June 2023, a Federal Civilian Executive Branch (FCEB) agency [subsequently [identified by CNN](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) as the US State Dept] identified suspicious activity in their Microsoft 365 (M365) cloud environment. The agency reported the activity to Microsoft and the Cybersecurity and Infrastructure Security Agency (CISA), and Microsoft determined that advanced persistent threat (APT) actors accessed and exfiltrated unclassified Exchange Online Outlook data.

In as yet undiscovered method, the threat actor obtained a Microsoft Account (MSA) consumer signing key. Leveraging that very sensitive key, the threat actor pivoted into enterprise Exchange environments due to a validation error on Microsoft's part. Per Microsoft: **"The method by which the actor acquired the key is a matter of ongoing investigation."**[^1][^3]

Identified victims include:
* US Department of State
* US Department of Commerce
* Commerce Secretary Gina Raimondo’s email account
* "email accounts at the House of Representatives"[^2]
* The US Ambassador to China, Nicholas Burns

> Storm-0558 had access to some of these cloud-based mailboxes for at least six weeks, and during this time, the threat actor downloaded approximately 60,000 emails from State Department alone.(CSRB Report: p1)

All told Storm-0558 had access to "22 enterprise organizations, as well as 503 related personal accounts" (CSRB Report: p2)

In a [follow up research post](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr), cloud security company Wiz noted:

> "Our researchers concluded that the compromised MSA key could have allowed the threat actor to forge access tokens for multiple types of Azure Active Directory applications, including every application that supports personal account authentication, such as SharePoint, Teams, OneDrive, customers’ applications that support the “login with Microsoft” functionality, and multi-tenant applications in certain conditions."

> This led us to believe that although the compromised key acquired by Storm-0558 was a private key designed for Microsoft's MSA tenant in Azure, it was also able to sign OpenID v2.0 tokens for multiple types of Azure Active Directory applications.


#### Breach of the Microsoft Account (MSA) consumer signing key

The initial point of compromise was a MSA consumer signing key from 2016.

[At first](https://msrc.microsoft.com/blog/2023/09/results-of-major-technical-investigations-for-storm-0558-key-acquisition/) Microsoft believed the key was compromised when it was moved from an isolated environment to their corporate environment as part of a crash dump. However, in response to the CSRB report indicating that information was false, Microsoft eventually updated their post to say:
> *The blog below states that the actor access may have resulted from a crash dump in 2021, but we have not found a crash dump containing the impacted key material.*

The CSRB report disclosed why the MSA key was not properly rotated:
>Over time, Microsoft automated the key rotation process in the enterprise system with the intent for the consumer MSA system to follow and use the same technology, but it had not done so in the consumer MSA system before the intrusion. Microsoft continued to rotate consumer MSA keys infrequently and manually until it stopped the rotation entirely in 2021 following a major cloud outage linked to the manual rotation process. While Microsoft had paused manual key rotation, it neither had, nor created, an automated alerting system to notify the appropriate Microsoft teams about the age of active signing keys in the consumer MSA service.

> The decision to completely stop manual rotation of signing keys in 2021 after a large cloud outage, along with failing to prioritize the development of an automated key rotation solution, are troubling examples of decision-making processes within the company that did not prioritize security risk management at a level commensurate with the threat and with Microsoft technology’s vital importance to more than one billion of its customers worldwide. (CSRB Report: p17)

As for the initial point of compromise:
> Microsoft learned that, in 2021, Storm-0558 had accessed a variety of documents stored in SharePoint and assessed
that the threat actor was specifically looking for information on Azure service management and identity-related
information. Despite Microsoft’s pursuit of the 46 key-theft hypotheses, the Board assesses that Microsoft does not
know how Storm-0558 obtained the 2016 MSA key. Microsoft stated in a September 6, 2023 blog post that the most
probable way Storm-0558 had obtained the key was from a crash dump to which it had access during the 2021
compromise of Microsoft’s systems. However, Microsoft had only theorized that such a scenario was technically
feasible in the 2016 timeframe. While Microsoft updated this blog on March 12, 2024 to correct its assessment of
these theories,it has not determined that this is how Storm-0558 obtained the key. \
The Board further determines that Microsoft has no evidence or logs showing the stolen key’s presence in or exfiltration
from a crash dump. During the Board’s interview with Microsoft in November 2023, Microsoft said that soon after
publication, it realized that the statements in the September 6 blog were inaccurate: Microsoft had found no evidence
of a crash dump containing the 2016 MSA key material. While Microsoft’s latest update about this incident
acknowledges that it did not find a crash dump containing the impacted 2016 MSA key material, **the possibility that
the threat actor had accessed other keys and sensitive data, in addition to the 2016 MSA key, also remains
unresolved**, adding to the Board’s concern about the full consequences of the incident and remaining uncertainty.

#### Compromise of system related to Microsoft acquisition

> Microsoft told the Board that Storm-0558 had compromised Microsoft’s corporate network via an engineer’s account,
which occurred between April and August 2021. Microsoft believes, although it has produced no specific evidence to
such effect, that this 2021 intrusion was likely connected to the 2023 Exchange Online compromise because it is the
only other known Storm-0558 intrusion of Microsoft’s network in recorded memory. During this 2021 incident,
Microsoft believes that Storm-0558 gained access to sensitive authentication and identity data. \
As announced on March 26, 2020 and completed on April 23, 2020, Microsoft acquired a company called Affirmed
Networks 86 that worked in 5G technology and advanced networking. Microsoft believes that prior to the acquisition,
Storm-0558 targeted an engineer and compromised their device due to their experience in 5G technology and
advanced networking. After the acquisition, Microsoft supplied corporate credentials to the acquired engineer that
allowed access to Microsoft’s corporate environment with the compromised device. Leveraging this access, Storm-0558 captured an authentication token, then replayed the token to authenticate as the Microsoft employee on Microsoft’s corporate network. (CSRB p7)

#### Big Yellow Taxi

The attack was detected via the US State Department's detection capability.

> State Department was the first entity to detect the intrusion when on June 16, 2023, a State SOC analyst observed
multiple alerts from the “Big Yellow Taxi” custom alert rule. Detecting an intrusion like this is difficult; State Department
found Storm-0558 because it had purchased enhanced logging through the **G5 licenses, which few, if any, victims
had similarly acquired**. As standard practice, State’s SOC uses that enhanced logging to build custom alerts like “Big
Yellow Taxi” in response to an evolving threat environment. Just purchasing the additional logging alone would not
have been enough; in fact, the Board heard that few organizations analyzed the voluminous `MailItemsAccessed` log in
detail, and **such in-depth analysis would be difficult for smaller organizations**. (CSRB p9)

> Victims found it difficult to investigate these intrusions after initial detection because Microsoft **could not, or in some
cases did not, provide victim organizations with holistic visibility** into all necessary data. Although Microsoft activated
enhanced logging for identified victims who did not have the appropriate license, **Microsoft could not give historical logs**
to customers unless they already had the premium licenses at the time of the intrusion. Thus, customers could capture
data from the time that Microsoft enabled additional logging capabilities but were unable to view past intrusion activity. (p10)


### Timeline
| Date | Event |
| ------ | ----- |
| **May 15, 2023** | Storm-0558 begins to use forged authentication tokens to access mailboxes |
| **June 16, 2023** | Federal Agency notices abnormal `MailItemsAccessed` in M365 Audit Logs |
| **June 16, 2023** | Microsoft disabled stolen keys |
| **July 11, 2023** | Microsoft quietly discloses the incident on their [security blog](https://msrc.microsoft.com/blog/2023/07/microsoft-mitigates-china-based-threat-actor-storm-0558-targeting-of-customer-email/)  |
| **July 12, 2023** | CISA issues an [advisory](https://www.cisa.gov/news-events/cybersecurity-advisories/aa23-193a) describing the incident   |
| **July 14, 2023** | Microsoft discloses a [signing key](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) was compromised and used in this incident   |
| **July 19, 2023** | Microsoft announces that the E5 Audit logs that enabled detection of this incident will now be available to all customers. |
| **July 20, 2023** | [WSJ Reports](https://www.wsj.com/articles/u-s-ambassador-to-china-hacked-in-china-linked-spying-operation-f03de3e4?st=l642zzi8wtmw1bo&reflink=desktopwebshare_permalink) the US Ambassador to China was one of the victims |
| **July 21, 2023** | Cloud Security firm [Wiz](https://wiz.io/) publishes a [blog post](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr) which outlines broader _potential_ impacts due to the signing key leak. ([Archived Copy](Compromised%20Microsoft%20Key%20More%20Impactful%20Than%20We%20Thought%20-%20Wiz%20Blog.pdf))  |
| **July 27, 2023** | Sen. Wyden [sends letter](wyden_letter_to_cisa_doj_ftc_re_2023_microsoft_breach.pdf) to the Attorney General and heads of CISA and the FTC asking them to investigate Microsoft's security practices. |
| **August 11, 2023** | DHS [announces](https://www.dhs.gov/news/2023/08/11/department-homeland-securitys-cyber-safety-review-board-conduct-review-cloud) the Cyber Safety Review Board to Conduct Review on Cloud Security, specifically focusing on this incident |
| **August 15, 2023** | US Representative Don Bacon [discloses](https://twitter.com/RepDonBacon/status/1691187487350177793?s=20) he was [notified by the FBI](https://www.washingtonpost.com/technology/2023/08/14/microsoft-china-hack-congress/) his personal and political email accounts were targeted by the attacker.  |
| **August 15, 2023** | US Representative Don Bacon [discloses](https://twitter.com/RepDonBacon/status/1691187487350177793?s=20) he was [notified by the FBI](https://www.washingtonpost.com/technology/2023/08/14/microsoft-china-hack-congress/) his personal and political email accounts were targeted by the attacker.  |
| **September 06, 2023** | Microsoft [issued a blog post](https://msrc.microsoft.com/blog/2023/09/results-of-major-technical-investigations-for-storm-0558-key-acquisition/) documenting how Storm-0558 was able to access the consumer account signing key.
| **March 12, 2024** | Microsoft [silently updates](https://msrc.microsoft.com/blog/2023/09/results-of-major-technical-investigations-for-storm-0558-key-acquisition/) its September 6th report to indicate they do no know how Storm-0558 got the initial consumer account signing key |
| **March 20, 2024** | [CISA](https://www.cisa.gov/) releases the Cyber Safety Review Board [CSRB](https://www.cisa.gov/resources-tools/groups/cyber-safety-review-board-csrb) Report: [Review of the Summer 2023 Microsoft Exchange Online Intrusion](CSRB_Review_of_the_Summer_2023_MEO_Intrusion_Final_508c.pdf)

### Attribution / Perpetrator
Microsoft has designated this threat actor ***Storm-0558*** "a China-based threat actor with espionage objectives" and "maintain[s] high confidence that Storm-0558 operates as its own distinct group".

CISA believes Storm-0558 was responsible for [a major attack on Google](https://en.wikipedia.org/wiki/Operation_Aurora), as well as the [RSA SecureID incident](https://www.wired.com/story/the-full-story-of-the-stunning-rsa-hack-can-finally-be-told/) in 2011.

### Long-term Impact

So far there have been [calls](https://arstechnica.com/security/2023/07/microsoft-takes-pains-to-obscure-role-in-0-days-that-caused-email-breach/#:~:text=Microsoft%20is%20under%20fire%20for%20withholding%20details%20that%20some%20of%20the%20victims%20could%20have%20used%20to%20detect%20the%20intrusion%2C%20something%20critics%20have%20called%20%E2%80%9Cpay%2Dto%2Dplay%20security.%E2%80%9D) for Microsoft to change it's licensing model to give _all customers_ the same level of audit logging that the Department of State had subscribed to. [Both CISA and Sen. Ron Wyden have called out Microsoft](https://www.wsj.com/articles/china-hacking-was-undetectable-for-some-who-had-less-expensive-microsoft-services-58730629) for only providing the logging necessary to detect this incident under their highest tier license.

> “Every organization using a technology service like Microsoft 365 should have access to logging and other security data out of the box to reasonably detect malicious cyber activity,” a senior CISA official said Wednesday on a press call discussing the incident.

Microsoft was forced to concede this revenue stream and will make these logs free starting in September 2023.

[Senator Ron Wyden](https://www.wyden.senate.gov/) (D-OR) [sent a letter](wyden_letter_to_cisa_doj_ftc_re_2023_microsoft_breach.pdf) to the US Attorney General, along with the heads of CISA and the FTC asking for:
1. The CISA director to investigate this breach under her shared authority to direct the Cyber Safety Review Board.
2. The Attorney General to determine if Microsoft violated federal law in failing to follow required cybersecurity standards for government contractors
3. The FTC to investigate Microsoft’s privacy and data security practices, and to determine if Microsoft violated a consent decree relating to Passport, a predecessor product to Microsoft Account.

In its report, the CSRB cited Microsoft's security culture:
> "*Individually, any one of the failings described above might be understandable. Taken together, they point to a failure of
Microsoft’s organizational controls and governance, and of its corporate culture around security.*" (p18)

The CSRB took issue with the broader industry which may lead to changes in how
> As a result of the CSRB’s recommendations, CISA plans to convene major CSPs to develop cloud security practices aligned with the CSRB recommendations and a process for CSPs to regularly attest and demonstrate alignment. ([source](https://www.dhs.gov/news/2024/04/02/cyber-safety-review-board-releases-report-microsoft-online-exchange-incident-summer))

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
* US Department of Homeland Security: [Cyber Safety Review Board Releases Report on Microsoft Online Exchange Incident from Summer 2023](https://www.dhs.gov/news/2024/04/02/cyber-safety-review-board-releases-report-microsoft-online-exchange-incident-summer) - April 2, 2024

## Cloud Security Lessons Learned

While this incident was the direct responsibility of Microsoft, one lesson for organizations operating in the cloud is to ensure that you're paying for the proper level of logging for your risk profile.

The Wiz blog has a number of [suggestions](https://www.wiz.io/blog/storm-0558-compromised-microsoft-key-enables-authentication-of-countless-micr#how-to-detect-the-compromised-key-in-your-environment-57) for detecting if your environment was impacted by the leaked MSA key.

The CSRB Report makes a number of recommendations for Microsoft _and_ the broader cloud service provider ecosystem (emphasis mine):

> **RECOMMENDATION 2**: Microsoft leadership should consider directing internal Microsoft teams to **deprioritize feature developments across the company’s cloud infrastructure and product suite until substantial security improvements have been made**. In all instances, security risks should be fully and appropriately assessed and addressed before new features are deployed. (p19)

> **RECOMMENDATION 4**: The Board notes that some CSPs, including Microsoft until recently, offer granular logging, which can be invaluable in security incident detection, investigation, and response—as a part of a paid package offering to their core services. **This course of business should stop. Security-related logging should be a core element of cloud offerings** and CSPs should provide customers the foundational tools that provide them with the information necessary to detect, prevent, or quantify an intrusion, recognizing that many customers will still require additional or third-party analytic capabilities to build a fully mature security program. (p19)

> **RECOMMENDATION 5**: Given Microsoft’s inability to determine how and when the adversary was able to steal
its signing key, **all CSPs should review and revise as appropriate their logging and overall forensics capabilities
around their identity systems and other systems that enable environment-level compromise**, such as root key
material. CSPs should maintain sufficient forensics to detect exfiltration of those data, including logging all
access to those systems and any private keys stored within them. These logs should be analyzed continuously
for any unauthorized insider or external threat actor activity. Retention should include all time the key was in
active use and extend at least two years beyond the expiration of that key. Longer retention periods of at least
10 years may be appropriate for some high-value log types. (p20)

> **RECOMMENDATION 6**: CSPs should engineer their digital identity and credential systems in such a way that
substantially reduces the risk of complete system-level compromise. This should be an overriding, top-priority,
design goal in the engineering process and be informed by a rigorous threat model developed by the CSP in
response to its understanding of the threat landscape. The Board spoke with all major U.S.-based CSPs to gain
an understanding of their existing practices and develop a set of recommended baseline best practices. While
the specific practices implemented may vary for different use cases and situations, the Board believes
technical mechanisms exist today across the industry that can, if broadly implemented, significantly reduce the
likelihood of complete system-level compromise. Each of these practices is implemented by at least one major
CSP, demonstrating their technical feasibility. Some of these practices, while compatible with accepted
industry standards, would also benefit from additional standards development, which is discussed in another
recommendation. These mechanisms include the following. (p20)

> **RECOMMENDATION 8**: The National Institute of Standards and Technology (NIST) and the Risk Management
Framework (RMF) Joint Task Force (JTF) should **update Special Publication (SP) 800-53’s control catalog to
better account for risks to cloud-based digital identity systems**, including incorporating the technical
recommendations of the Board from this incident, as appropriate.

> **RECOMMENDATION 9**: **Large enterprises need robust compromise assessment and remediation processes for
entities they acquire or with whom they merge.** These processes should recognize that smaller, acquiree
companies may have less robust security procedures and that adversaries may view them as an entry point
onto a parent company’s corporate network. This can include targeting them after announcement of an
acquisition but before closing

> **RECOMMENDATION 10**: CSPs, as part of a CISA-led task force, **should define and adopt a minimum standard
for default audit logging in cloud services.** This standard should, at a minimum, ensure that all access
(including access by the CSP itself) to customer business data in the cloud produces logs that **are available to
the customer without additional charges**, with a minimum **default retention of six months** by the CSP.

The report calls out all the cloud service providers (CSPs) for lack of transparency:
> **RECOMMENDATION 14**: U.S.-based **CSPs should report all incidents** suspected to have been perpetrated by an
actor affiliated with a nation-state targeting their infrastructure and corporate systems to the U.S. government,
even in the absence of a regulatory obligation to report. Separately, CISA and the Office of Management and
Budget (OMB) should consider appropriate contractual provisions with CSPs to require such reporting.

> **RECOMMENDATION 15**: CSPs should be **transparent** to U.S. government agencies, customers, and other
stakeholders **on what they know as well as what they do not know when initially investigating a cyber incident**.

> **RECOMMENDATION 16**: CSPs should **promptly correct significant factual inaccuracies** as they discover them in
their public or customer statements.

> **RECOMMENDATION 17**: **CSPs should commit to disclosing through the CVE** process all vulnerabilities, including
flaws such as the one in Microsoft's token validation logic and those that do not require customer action to
patch. CSPs should work with the CVE program to **develop necessary updates to Common Weakness
Enumeration (CWE) to account for the particulars of cloud environment**s. CSPs should collaborate with the CVE
Program to develop these norms and **commit to timely and comprehensive disclosure** of these vulnerabilities,
enabling organizations to make thoughtful risk decisions about all their vendors’ security programs, including
cloud services. The Board believes that incorporating all known vulnerabilities across the entire technology
stack in CVE’s comprehensive repository would be a public benefit for industry and government customers, as
well as security researchers.


[^1]: Microsoft: [Analysis of Storm-0558 techniques for unauthorized email access](https://www.microsoft.com/en-us/security/blog/2023/07/14/analysis-of-storm-0558-techniques-for-unauthorized-email-access/) July 14th, 2023
[^2]: CNN [China-based hackers breached US government email accounts, Microsoft and White House say](https://www.cnn.com/2023/07/12/politics/china-based-hackers-us-government-email-intl-hnk/index.html) July 12th, 2023
[^3]: Microsoft: [Results of Major Technical Investigations for Storm-0558 Key Acquisition](https://msrc.microsoft.com/blog/2023/09/results-of-major-technical-investigations-for-storm-0558-key-acquisition/)


