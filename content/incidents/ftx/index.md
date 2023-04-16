---
title: "FTX"
date: 2023-04-16T10:35:11-04:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["REPLACE THIS WITH VALID TAGS"]

showToc: true # Do not change
author: "Donald Trump"
author_url: "https://www.cnn.com/"

# These details are used to populate the Incident Index page.
victim: "FTX's Depositors"
incident_start_date: 2023-03-01
incident_end_date: 2023-03-02
disclosure_date: 2023-03-01
final_status: "Perpetrator Plead Guilty"

---


FTX, a crypto-currency exchange found itself in bankrupcy. During the undwinding process, the FTX trustee management discovered a number of poor cloud practices.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

Court Documents reference the "November 2022 Breach" - this is probably really how this incident fits on this site.


> The Debtors took over responsibility for a computing environment that had
been compromised. A malicious actor had just drained approximately $432
million worth of crypto assets in hours; the FTX Group did not have the
controls to detect the compromise, much less to stop it; and due to the FTX
Group’s deficient controls to secure crypto assets, the Debtors faced the threat
that billions of dollars of additional assets could be lost at any moment. (pg 42)

### Attribution / Perpetrator

Maybe related:
https://www.coindesk.com/business/2022/11/14/ftx-hack-or-inside-job-blockchain-experts-examine-clues-and-a-stupid-mistake/


### Long-term impact

## Summary of coverage
* Source: [News Article One](FIXME) Month, Day, Year
* Source: [News Article Two](FIXME) Month, Day, Year
* [Press Release](FIXME) Month, Day, Year
* [Victim Blog Post 1](FIXME) Month, Day, Year

https://restructuring.ra.kroll.com/FTX/
https://dm.epiq11.com/case/ftx/info

https://en.wikipedia.org/wiki/John_J._Ray_III
https://www.coindesk.com/policy/2022/12/13/john-j-ray-iii-warned-not-to-obstruct-bahamas-ftx-probe-as-he-gives-testimony/

https://www.coindesk.com/business/2022/11/12/ftx-crypto-wallets-see-mysterious-late-night-outflows-totalling-more-than-380m/

## Cloud Security Implications of this incident.


> The debtors claimed in the report that FTX lacked "even the most widely accepted controls relating to identity and access management," including a failure to implement both least privilege principles as well as multifactor authentication in critical corporate spaces such as its 1Password password manager. https://www.techtarget.com/searchsecurity/news/365535116/FTX-bankruptcy-filing-highlights-security-failures

> Perhaps the most alarming claims in the filing pertained to how FTX stored cryptocurrency funds. The debtors alleged that FTX stored the private keys for billions of dollars in cryptocurrency assets in its AWS cloud computing environment. While FTX stored the keys in AWS Secrets Manager, a service designed to safeguard sensitive data such as passwords and API keys, the filing said it's inadequate for cryptocurrency key storage and far too many FTX employees had access to the service. https://www.techtarget.com/searchsecurity/news/365535116/FTX-bankruptcy-filing-highlights-security-failures
> "Any of the many FTX Group employees who had access to AWS Secrets Manager or the password vault could access certain of the keys and unilaterally transfer the corresponding assets," the debtors claimed.


> The FTX Group stored the private keys to its crypto assets in its cloud computing environment, which included over one thousand servers and related system architecture, services, and databases that it leased from Amazon Web Services (the “AWS account”). AWS’s cloud computing platform offers businesses a range of infrastructure-as-a-service (IaaS), platform-as-aservice (PaaS), and software-as-a-service (SaaS) capabilities, and through it, like other businesses, the FTX Group customized, configured, and controlled its own cloud environment. (pg 24 - gov.uscourts.deb.188450.1242.1.pdf)

> Single-signature-based private keys to billions of dollars in crypto assets were stored in AWS Secrets Manager (a cloud-based tool used to manage sensitive information), and/or a password vault (a tool for secure storage of passwords), neither of which is designed to meet the needs of secure-key storage; any of the many FTX Group employees who had access to AWS Secrets Manager or the password vault could access certain of the keys and unilaterally transfer the corresponding assets. Footnote: In the infrequent instances in which the FTX Group stored private keys in encrypted form, it stored the decryption key in AWS Secrets Manager and not in a protected form, such as HSM. As a result, the decryption keys could easily be retrieved by an unauthorized actor, thereby dramatically reducing the value of encryption (pg 28 - gov.uscourts.deb.188450.1242.1.pdf) )



> Despite the obvious importance of securing its wallet nodes, the FTX Group’s security controls for its wallet nodes were grossly deficient. For example, the passwords for encrypting the private keys of wallet nodes were stored in plain text, committed to the code repository (where they could be viewed by many and were vulnerable to compromise), and reused across different wallet nodes such that if one were compromised, every other node with the same password could be compromised as well. Furthermore, wallet node servers were not securely segregated from connected servers such that anyone who compromised the FTX Group’s computing environment could potentially compromise its wallet nodes. (pg 29-30)


> The FTX Group did not enforce the use of MFA in connection with two of its most critical corporate services—Google Workspace, its primary tool for email and document storage and collaboration, and 1Password, its password-management program. (pg 31)


> Among many examples, the FTX exchanges and Alameda used a single, shared AWS account, meaning that a compromise of that AWS account would expose all three entities’ assets to misuse or theft. (pg 37)

> The FTX Group appears to have recognized the deficiency, because as of the petition date, FTX.US had begun a process of migrating to its own dedicated AWS account; because it did not complete that work, its assets remained within the shared account such that FTX.US lost approximately $139 million of its crypto assets during the November 2022 Breach. (footnote 34 pg 33)

> Footnote 36: For example, Amazon GuardDuty, an AWS feature that supports threat detection, was not enabled at all on FTX.com, and across the entities, VPC flow logs that can capture IP traffic information were only enabled to log the rejected traffic (and only in some networks)—they were not enabled to log the permitted traffic at all. The lack of these and other logs complicated the Debtors’ investigation of the November 2022 Breach.

> Among many examples of its control deficiencies in this area, the FTX Group did not have any mechanism to identify promptly if someone accessed the private keys of central exchange wallets holding hundreds of millions or billions of dollars in crypto assets, and it did not fully enable even the basic features offered by AWS to assist with cyber threat detection and response.36 In fact, due to the lack of such controls, the FTX Group did not learn of the November 2022 Breach until the Debtors’ restructuring advisor alerted employees after observing, via Twitter and other public sources, that suspicious transfers appeared to have occurred from FTX Group crypto wallets. The FTX Group similarly failed to institute any basic mechanism to be alerted to any “root” login to its AWS account, the cloud computing environment where it operated the FTX exchanges and stored keys to billions of dollars in crypto assets, even though such access would provide virtually complete access to the environment.  (pg 34)




> You have filed a motion in the bankruptcy court seeking to keep the creditors list secret. This is highly unusual. According to the U.S. Supreme Court, the public has a First Amendment right to know what is going on in our court system, and secrecy of this kind can lead to cynicism about what might be happening behind closed doors. https://www.coindesk.com/consensus-magazine/2022/12/12/10-questions-for-ftx-ceo-john-j-ray-iii-from-a-securities-lawyer/



