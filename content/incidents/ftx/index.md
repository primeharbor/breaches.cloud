---
title: "FTX Bankruptcy"
date: 2023-04-16T10:35:11-04:00
lastmod: 2024-02-02T09:20:00-04:00

description: "An analysis of FTX's cloud security practices leading up to their bankruptcy"

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "MultiAccount", "Secrets"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "FTX & its creditors"
incident_start_date: 2022-11-11
incident_end_date: 2022-11-12
disclosure_date: 2022-11-11
final_status: "Most of the FTX funds have not been recovered. Forensic analysis of FTX is ongoing."

---

FTX, a crypto-currency exchange, found itself in bankruptcy. At the moment of the leadership transition, over $400 million in crypto-currency was transferred from FTX's wallets. The FTX trustee management discovered many poor cloud practices during the unwinding process.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

After a liquidity crisis, [FTX is forced into Chapter 11 bankruptcy](https://en.wikipedia.org/wiki/Bankruptcy_of_FTX), and the United States Bankruptcy Court for the District of Delaware appoints new management. During the chaos of the crisis, new management, and the founders' departure, an unknown party or parties transfer more than $400M of different cryptocurrencies out of FTX's control. This is subsequently referred to in court filings as the "November 2022 Breach". As [stated](FirstInterimReport.pdf) by the new CEO in April:
> The Debtors took over responsibility for a computing environment that had been compromised. A malicious actor had just drained approximately $432 million worth of crypto assets in hours; the FTX Group did not have the controls to detect the compromise, much less to stop it; and due to the FTX Group’s deficient controls to secure crypto assets, the Debtors faced the threat that billions of dollars of additional assets could be lost at any moment. (pg 42)

The new management, supported by a number of law firms, [Kroll](https://www.kroll.com/en), [Chainalysis](https://www.chainalysis.com/), and [Sygnia](https://www.coindesk.com/policy/2023/02/06/ftx-being-advised-by-cybersecurity-firm-sygnia-on-hack-inquiry-ceo-ray-says/) were tasked with finding the assets of FTX and 138 associated companies, identifying the creditors, and securing the FTX cloud environment.

### Timeline
| Date | Event |
| ------ | ----- |
| **November 2nd, 2022** | [Questions](https://www.coindesk.com/business/2022/11/02/divisions-in-sam-bankman-frieds-crypto-empire-blur-on-his-trading-titan-alamedas-balance-sheet/) start to be raised about the balance sheet of one FTX-related company Alameda Research.|
| **November 11th, 2022** | FTX Officially files for Chapter 11 Bankruptcy, founder Sam Bankman-Fried resigned as CEO ; John Ray appointed new CEO by the United States Bankruptcy Court of the District of Delaware.|
| **November 11th, 2022** | Reports of unauthorized transactions surface in the crypto-currency community. [Employees of FTX acknowledge](https://www.coindesk.com/business/2022/11/12/ftx-crypto-wallets-see-mysterious-late-night-outflows-totalling-more-than-380m/) a potential compromise and urge customers not to use the platform|
| **November 12th, 2022** | FTX's new management [acknowledges](https://www.cnbc.com/2022/11/12/ftx-says-it-is-investigating-unauthorized-transactions.html) unauthorized transfers of crypto-currency and begins to move funds to off-line (cold) wallets.|
| **November 17th, 2022** | John Ray files an [initial statement](Nov17Filing.pdf) with the Bankruptcy Court stating, "Never in my career have I seen such a complete failure of corporate controls and such a complete absence of trustworthy financial information as occurred here."|
| **April 9th, 2023** | FTX publishes "[First Interim Report of John J. Ray III to The Independent Directors on Control Failures at the FTX Exchanges](FirstInterimReport.pdf)," which outlines the bulk of the cloud security issues documented here. |
| **August 25th, 2023** | Kroll, the firm that was contracted to manage FTX Creditors, [suffers breach due to SIM Swapping attack](https://www.kroll.com/en/about-us/news/security-incident). Apparently scammers are using this to [conduct phishing attacks](https://krebsonsecurity.com/2023/08/kroll-employee-sim-swapped-for-crypto-investor-data/#more-64675) against FTX creditors. |
| **January 24th, 2024** | Three individuals were [indicted](USA-v-Powell-Order-on-Motion-for-Miscellaneous-Relief-1-25-2024.pdf) in the case of the missing $400M in crypto-currency |


### Attribution / Perpetrator

~~The identity of the perpetrator of the *"November 2022 Breach"* has not been identified.~~ The DOJ has [indicted](USA-v-Powell-Order-on-Motion-for-Miscellaneous-Relief-1-25-2024.pdf) three individuals for SIM Swapping in relation to a $400M crypto-currency theft that occured around this time.

Sam Bankman-Fried has been [indicted](https://www.justice.gov/usao-sdny/press-release/file/1557571/download) on multiple counts related to his management of the FTX companies. A number of other senior-level employees of the company, including Bankman-Fried's co-founders, are cooperating with the Department of Justice.


## Summary of coverage & other resources

* Kroll: [FTX Trading Ltd](https://restructuring.ra.kroll.com/FTX/) - The restructuring main site.
* DOJ Office of the United States Trustee: [FTX Trading Official Committee of Unsecured Creditors](https://dm.epiq11.com/case/ftx/info)
* CoinDesk: [Divisions in Sam Bankman-Fried’s Crypto Empire Blur on His Trading Titan Alameda’s Balance Sheet](https://www.coindesk.com/business/2022/11/02/divisions-in-sam-bankman-frieds-crypto-empire-blur-on-his-trading-titan-alamedas-balance-sheet/) - November 2nd, 2022
* CoinDesk: [FTX Has Been Hacked: Crypto Disaster Worsens as Exchange Sees Mysterious Outflows Exceeding $600M](https://www.coindesk.com/business/2022/11/12/ftx-crypto-wallets-see-mysterious-late-night-outflows-totalling-more-than-380m/) - November 11th, 2022
* CoinDesk: [FTX Hack or Inside Job? Blockchain Experts Examine Clues and a ‘Stupid Mistake’](https://www.coindesk.com/business/2022/11/14/ftx-hack-or-inside-job-blockchain-experts-examine-clues-and-a-stupid-mistake/) - November 14th, 2022
* FTX: [DECLARATION OF JOHN J. RAY III IN SUPPORT OF CHAPTER 11 PETITIONS AND FIRST DAY PLEADINGS](Nov17Filing.pdf) - November 17th, 2022
* CoinDesk: [Who's Who in the FTX Inner Circle](https://www.coindesk.com/layer2/2022/11/22/the-whos-who-of-the-ftx-inner-circle/)
* CoinDesk Opinion: [10 Questions for FTX CEO John J. Ray III From a Securities Lawyer](https://www.coindesk.com/consensus-magazine/2022/12/12/10-questions-for-ftx-ceo-john-j-ray-iii-from-a-securities-lawyer/) - December 12th, 2022
* CoinDesk: [FTX CEO Warned Not to ‘Obstruct’ Bahamas Probe as He Gives Testimony](https://www.coindesk.com/policy/2022/12/13/john-j-ray-iii-warned-not-to-obstruct-bahamas-ftx-probe-as-he-gives-testimony/) - December 13th, 2022
* CoinDesk: [FTX Being Advised by Cybersecurity Firm Sygnia on Hack Inquiry, CEO Ray Says](https://www.coindesk.com/policy/2023/02/06/ftx-being-advised-by-cybersecurity-firm-sygnia-on-hack-inquiry-ceo-ray-says/) - February 6th, 2023
* FTX: [FIRST INTERIM REPORT OF JOHN J. RAY III TO THE INDEPENDENT DIRECTORS ON CONTROL FAILURES AT THE FTX EXCHANGES](FirstInterimReport.pdf) - April 9th, 2023
* TechTarget: [FTX bankruptcy filing highlights security failures](https://www.techtarget.com/searchsecurity/news/365535116/FTX-bankruptcy-filing-highlights-security-failures) - April 11th 2023
* KrebsOnSecurity: [Arrests in $400M SIM-Swap Tied to Heist at FTX?
](https://krebsonsecurity.com/2024/02/arrests-in-400m-sim-swap-tied-to-heist-at-ftx/) - February 2nd, 2024

## Cloud Security lessons learned

The following Cloud Security lessons come primarily from John J. Ray III's [First Interim Report](FirstInterimReport.pdf), and are cited by page number.

1. MultiAccount Strategy - FTX primarily kept all private keys in the same AWS account with over a thousand compute workloads
	> "the FTX exchanges and Alameda used a single, shared AWS account, meaning that a compromise of that AWS account would expose all three entities’ assets to misuse or theft." (pg 37)

	> "The FTX Group stored the private keys to its crypto assets in its cloud computing environment, which included over one thousand servers and related system architecture, services, and databases that it leased from Amazon Web Services." (pg 24)

	> "The FTX Group appears to have recognized the deficiency, because as of the petition date, FTX.US had begun a process of migrating to its own dedicated AWS account; because it did not complete that work, its assets remained within the shared account such that FTX.US lost approximately $139 million of its crypto assets during the November 2022 Breach." (footnote 34 pg 33)

2. Wallet Keys stored in Secrets Manager
	> "private keys to billions of dollars in crypto assets were stored in AWS Secrets Manager ... any of the many FTX Group employees who had access to AWS Secrets Manager or the password vault could access certain of the keys and unilaterally transfer the corresponding assets." (pg 28)

	> Footnote: "In the infrequent instances in which the FTX Group stored private keys in encrypted form, it stored the decryption key in AWS Secrets Manager and not in a protected form, such as HSM. As a result, the decryption keys could easily be retrieved by an unauthorized actor, thereby dramatically reducing the value of encryption" (pg 28)

3. Secrets Mismanagement
	> "the passwords for encrypting the private keys of wallet nodes were stored in plain text, committed to the code repository..., and reused across different wallet nodes such that if one were compromised, every other node with the same password could be compromised as well. Furthermore, wallet node servers were not securely segregated from connected servers such that anyone who compromised the FTX Group’s computing environment could potentially compromise its wallet nodes. (pg 29-30)

1. MFA
	> The FTX Group did not enforce the use of MFA in connection with two of its most critical corporate services—Google Workspace, its primary tool for email and document storage and collaboration, and 1Password, its password-management program. (pg 31)

1. Lack of Monitoring or other security controls
	> "the FTX Group did not have any mechanism to identify promptly if someone accessed the private keys of central exchange wallets holding hundreds of millions or billions of dollars in crypto assets, and it did not fully enable even the basic features offered by AWS to assist with cyber threat detection and response." (pg 34)

	> "the FTX Group did not learn of the November 2022 Breach until the Debtors’ restructuring advisor alerted employees after observing, via Twitter and other public sources, that suspicious transfers appeared to have occurred from FTX Group crypto wallets." (pg 34)

	> "The FTX Group similarly failed to institute any basic mechanism to be alerted to any “root” login to its AWS account" (pg 34)

	> "For example, Amazon GuardDuty, an AWS feature that supports threat detection, was not enabled at all on FTX.com, and across the entities, VPC flow logs that can capture IP traffic information were only enabled to log the rejected traffic (and only in some networks)—they were not enabled to log the permitted traffic at all. The lack of these and other logs complicated the Debtors’ investigation of the November 2022 Breach." (Footnote 36, pg 34)
