---
title: "Uber Breaches (2014 & 2016)"
date: 2023-04-20T13:38:46-04:00

description: "A Cloud Security focused analysis of the Uber breach in 2014 and 2016"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "GitHub", "S3"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"


# These details are used to populate the Incident Index page.
victim: "Uber"
incident_start_date: 2014-05-12
incident_end_date: 2017-11-21
disclosure_date: 2022-10-05
final_status: "2014: Threat Actor Unknown 2016: Perpetrator's Pleaded Guilty"

---

In 2014 and again in 2016, Uber suffered a data breach where attackers gained access an unencrypted file containing sensitive user information. In both instances, the attackers used keys found in Uber's GitHub repositories. In 2014, the attacker found an access key in a public repository. In 2016, the attackers used stolen GitHub credentials to access an AWS key in an engineer's private repo.

Uber reported the 2014 incident to the Federal Trade Commission, which prompted an investigation into its security practices of Uber. As part of the 2016 incident, Uber's Chief Information Security Officer paid the attackers $100,000, supposedly as a bug bounty, to delete and not disclose the data. This incident is notable because the CISO, Joey Sullivan, was later convicted for not promptly notifying the Federal Authorities when the breach occurred. Uber was fined $148 million for concealing the breach.

<!--more-->

## Incident

### Details of the Incident

In recent years Uber suffered from 2 significant data breaches. One occurred in 2014 the other occurred in 2016. The attackers in both instances used similar attack strategies to compromise Uber's cloud accounts.

In 2014, an attacker could access users' data in plain text in an Amazon S3 bucket. The attacker leveraged GitHub, finding an engineer who had posted an access key to a public GitHub repository. This access key allowed the attacker to access the company's Amazon S3 Buckets. The attacker downloaded a file containing sensitive information to over 100,000 users' names and driver's license numbers. They also downloaded 215 users' bank accounts and domestic routing numbers.

In 2016, Uber was breached by two attackers who had gained access to an unencrypted S3 bucket containing personally identifiable information of over 57 million users. The attackers began by hiring a freelancer to write them a script that would ingest emails and passwords and attempt to log into GitHub. The script would then output if the login was valid and which organization the account belonged to. Seeing a high profile target like Uber in the results, the two attackers then accessed Uber's repos using these credentials. Next, they began looking for access keys to Uber's company servers. The attackers found an AWS key that granted them access to an S3 bucket containing sensitive data of 57 million users, including driver's license numbers and names associated with those accounts.

The attackers then sent a ransom email to Uber, stating they had found a significant vulnerability and had access to Uber's database. Sullivan agreed to pay each hacker $50,000 to delete the data and not disclose the data breach. However, this payment was masked as a bug bounty, and Sullivan withheld information regarding the breach from other employees who were obligated to disclose it to the Federal Trade Commission.

By leveraging the bug-bounty process, Uber identified the threat actors and found how they got in through GitHub.

As a result of the 2014 breach, Uber was under a consent decree with the FTC. In 2016 the FTC requested Uber to designate one or more officers to testify on behalf of the company on the company's security practices. Uber selected Joey Sullivan as their witness and, during his testimony, concealed details of the recent breach from the FTC. Uber approached the FTC to settle the investigation into the breach that occurred in 2014. During that time, Uber hired a new CEO, and Sullivan was asked to brief the CEO regarding the 2016 data breach and, at that time, omitted key details. Later the following year, the new CEO Dara Khosrowshahi released an open letter disclosing the breach and fired Sullivan for concealing the breach and paying the ransom. The FTC then announced they were reopening their investigation.

The Department of Justice indicted Brandon Charles Glover and Vasile Mereacre. They both pleaded guilty to the attack and agreed to cooperate with authorities for a reduced sentence. Sullivan was later charged with one count of Obstruction and one count of Misprision of a Felony in 2020. Uber was fined for the incident 148 million dollars for concealing the breach.

### Timeline

| Date | Event |
| ------ | ----- |
| **May&nbsp;12th,&nbsp;2014** | An attacker accesses Uber's AWS server using an access key from an engineer's public GitHub repository. Using this access key, the attacker accessed an S3 bucket containing the data of over 60,000 users. |
| **February 27th, 2015** | Uber [releases a statement](https://web.archive.org/web/20150227230058/http://blog.uber.com/2-27-15) disclosing the 2014 incident. |
| **April 27th, 2015** | Uber filed a John Doe lawsuit to expedite the investigation into the 2014 incident. |
| **October 2016** | Attackers access Uber's GitHub using stolen credentials and find an access key to Uber servers hosted on AWS. Using this access key, the attackers could access an S3 bucket containing over 200 user data files. |
| **November 14th, 2016** | Attackers sent a ransom email stating they exploited a significant vulnerability and gained access to Uber's database. |
| **December 8th, 2016** | Uber authorizes a $100,000 payment to the attackers through HackerOne's bug bounty platform. |
| **January 2017** | Uber identifies attackers behind the 2016 Breach as [Brandon Charles Glover and Vasile Mereacre](https://www.justice.gov/usao-ndca/pr/florida-man-and-canadian-national-plead-guilty-hackingextortion-conspiracy)[.](https://www.justice.gov/usao-ndca/pr/florida-man-and-canadian-national-plead-guilty-hackingextortion-conspiracy) |
| **April 19th, 2017** | Uber sends a letter to the FTC to close its investigation stating the company had fully cooperated with the FTC and provided all responses necessary to investigators. |
| **August 15th, 2017** | Uber and the FTC agree to a settlement regarding the previous 2014 data breach. |
| **August 29th, 2017** | Uber names new CEO Dara Khosrowshahi. |
| **November 21st, 2017** | Khosrowshahi released an open letter disclosing the 2016 breach, and later it was reported Sullivan was also fired. |
| **April 12th, 2018** | The FTC reopens its investigation into Uber and withdraws the proposed settlement criticizing the company for concealing the breach. |
| **August 2nd, 2018** | Grand jury indicts Brandon Charles Glover and Vasile Mereacre for a related breach of LinkedIn's parent company Lynda.com (now LinkedIn Learning). |
| **September&nbsp;26th,&nbsp;2018** | Uber agrees to pay a 148 million dollar settlement for concealing the breach. |
| **October 26th, 2018** | FTC provides and approves a revised settlement with Uber. |
| **October 30th, 2019** | Glover and Mereacre plead guilty to the Uber data breach. |
| **August 21st, 2020** | Sullivan is charged with one count of obstruction of justice and one count of Misprision of a Felony (i.e., knew that a federal felony had been committed and took affirmative steps to conceal that felony). |
| **October 5th, 2022** | Sullivan is found guilty of Obstruction of the FTC and Misprision of a felony. |
| **May 5th, 2023** | Sullivan is sentenced to three years probation. |

### Attribution / Perpetrator

Concerning the breach in 2014, No attacker has been named, but Uber [filed a "John Doe" lawsuit](https://casetext.com/case/uber-techs-inc-v-john-doe) to expedite investigating this breach with GitHub.

Per the [Department of Justice](https://www.justice.gov/usao-ndca/pr/florida-man-and-canadian-national-plead-guilty-hackingextortion-conspiracy) concerning the 2016 breach, "Brandon Charles Glover and Vasile Mereacre pleaded guilty in federal court today to their respective roles in an extortion conspiracy involving a plot to extract bounties from victim corporations in exchange for the defendant's promise to delete stolen confidential data."

### Long-term impact

As a result of this breach, Uber was fined 148 million dollars by the FTC. In their settlement with the FTC, they must also notify the customers, or they could face civil penalties. Sullivan was later charged and found guilty in October of 2022 for his role in covering up the data breach in 2016. The attackers were identified as Brandon Charles Glover and Vasile Mereacre. They were both indicted and pleaded guilty to their charges. They later agreed to testify in Sullivan's trial to lessen their sentence.

The perpetrators of this Uber Breach were also responsible for a similar data theft at Lynda.com (part of LinkedIn) and used similar ransom/bug bounty tactics[^1].

In sentencing Sullivan, District Judge William Orrick said
> that because of Mr. Sullivan’s character, the unusual nature of the case and that it was the first of its kind, he had shown Mr. Sullivan leniency, but he said chief information security officers shouldn’t expect that in future cases. [WSJ ($)](https://www.wsj.com/articles/former-uber-security-chief-gets-probation-in-obstruction-case-87c7c0b9)


## Summary of coverage

- Uber: [Uber Statement for 2014 breach](https://web.archive.org/web/20150227230058/http://blog.uber.com/2-27-15) - February 27th, 2015
- Casetext: [Uber Filing John Doe Case](https://casetext.com/case/uber-techs-inc-v-john-doe) (to identify the threat actor behind the 2014 breach) - April 27th, 2015
- Bloomberg: [Uber concealed cyber attack that exposed 57 million people's data](https://web.archive.org/web/20210824171652/https://www.bloomberg.com/news/articles/2017-11-21/uber-concealed-cyberattack-that-exposed-57-million-people-s-data) - November 21st, 2017
- CourtListener: [United States v. Glover and Mereacre](https://storage.courtlistener.com/recap/gov.uscourts.cand.330179/gov.uscourts.cand.330179.1.0.pdf) - August 2nd, 2018
- Computer Weekly: [Uber Fined 148m for data breach cover-up](https://www.computerweekly.com/news/252449446/Uber-fined-148m-for-data-breach-cover-up?_gl=1*wr5vp8*_ga*MTA5MDE1ODc2OC4xNjgwMDY3MDcw*_ga_TQKE4GS5P9*MTY4MTM2Mzc0OS4yLjEuMTY4MTM2NDEzNy4wLjAuMA..*_ga_RZDF13FDNT*MTY4MTM2Mzc1MC4yLjAuMTY4MTM2NDEzNy4wLjAuMA..*_ga_NLDTRJGG3Y*MTY4MTM2Mzc1MC4yLjAuMTY4MTM2NDEzNy4wLjAuMA..*_ga_H4TNQB84WS*MTY4MTM2Mzc1MC4yLjAuMTY4MTM2NDEzNy4wLjAuMA..*_ga_7FK328ZGNW*MTY4MTM2Mzc1MC4yLjAuMTY4MTM2NDEzNy4wLjAuMA..&_ga=2.257933131.1712761003.1681363750-1090158768.1680067070) - September 17th, 2018
- FTC: [Revised Complaint](https://www.ftc.gov/system/files/documents/cases/152_3054_c-4662_uber_technologies_revised_complaint.pdf) - October 25th, 2018 (Includes details of the 2016 breach)
- FTC: [Federal Trade Commission Gives Final Approval to Settlement with Uber](https://www.ftc.gov/news-events/news/press-releases/2018/10/federal-trade-commission-gives-final-approval-settlement-uber) - October 26th, 2018
- FTC: [Uber Technologies, Inc., In the Matter of](https://www.ftc.gov/legal-library/browse/cases-proceedings/152-3054-c-4662-uber-technologies-inc-matter) - October 26th, 2018
- DOJ: [Florida Man And Canadian National Plead Guilty To Hacking/Extortion Conspiracy](https://www.justice.gov/usao-ndca/pr/florida-man-and-canadian-national-plead-guilty-hackingextortion-conspiracy) - October 13th, 2019
- DOJ: [Former Chief Security Officer For Uber Charged With Obstruction Of Justice](https://www.justice.gov/usao-ndca/pr/former-chief-security-officer-uber-charged-obstruction-justice) - August 20th, 2020
- Tech Target: [The Uber data breach cover-up: A timeline of events](https://www.techtarget.com/searchsecurity/news/252488361/The-Uber-data-breach-cover-up-A-timeline-of-events) - August 31st, 2020
- DOJ: [Former Chief Security Officer Of Uber Convicted Of Federal Charges For Covering Up Data Breach](https://www.justice.gov/usao-ndca/pr/former-chief-security-officer-uber-convicted-federal-charges-covering-data-breach)- October 5th, 2022
- DOJ: [Sullivan Indictment](https://www.justice.gov/d9/pages/attachments/2022/06/28/sullivan_indictment.pdf) - June 28th, 2022
- DOJ: [United States vs. Joseph Sullivan](https://www.justice.gov/usao-ndca/united-states-vs-joseph-sullivan) - July 21, 2022
- Courthouse News: [Hacker details plot to breach Uber's data servers](https://www.courthousenews.com/hacker-details-plot-to-breach-ubers-data-servers-at-trial/) - September 12th, 2022
- Medium: [A blameless post-mortem of USA v. Joseph Sullivan](https://medium.com/starting-up-security/a-blameless-post-mortem-of-usa-v-joseph-sullivan-a137162f7fc9) - December 8th, 2022
- CourtListener: [United States v. Glover](https://www.courtlistener.com/docket/8082324/united-states-v-glover/) - April 6th, 2023

## Cloud Security lessons learned

- Per the [FTC Complaint](uber_technologies_revised_complaint.pdf):
	> until approximately September 2014, failed to require programs and engineers that access the Amazon S3 Datastore to use distinct access keys, instead permitting all programs and engineers to use a single AWS access key that provided full administrative privileges over all data in the Amazon S3 Datastore
- In both cases, the attackers found long-term AWS credentials in Uber GitHub repositories.
	- In the 2014 case, the GitHub repo was public. 
- In the case of the 2016 breach, Uber used client-side encryption for most of the backup data, however the attackers found a signle manually created backup that was not encrypted, or only used native AWS encryption the access key allowed for decryption.
- The access key used in the 2016 breach was created in 2013, and was scheduled to be rotated, but had not been rotated at the time the Uber user's GitHub was compromised and the access key found by Glover and Mereacre.[^2]
- Based on internal IR information "Hundred service centers must rotate their secrets."[^3] implies that a number of AWS IAM Users may have been in place in 2016 to support on-prem connectivity. While this might have been the appropriate solution _at the time_, the number of IAM access keys that had to be rotated made it difficult for Uber to properly secure its environment leading to the 2016 breach.
- Uber did not require MFA for access to GitHub, and the 2016 breach was due to a credential stuffing attack. Per the [FTC Complaint](uber_technologies_revised_complaint.pdf):
	> Uber did not have a policy prohibiting engineers from reusing credentials, and did not require engineers to enable multi-factor authentication when accessing Uber’s GitHub repositories. The intruders said that they accessed Uber’s GitHub page using passwords that were previously exposed in other large data breaches,


[^1]: [Glover / Mereacre Indictment ](IndictmentGloverMercerae2016.pdf)
[^2]: [Sullivan Complaint](Sullivan_Complaint_FTC.pdf) Paragraph 25, pg 9
[^3]: [Sullivan Complaint](Sullivan_Complaint_FTC.pdf) Paragraph 29, pg 10

