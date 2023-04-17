---
title: "Ubiquiti Insider Threat"
date: 2023-04-13T14:38:46-04:00

description: "A Cloud Security focused analysis of the Ubiquiti breach in 2020"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Insider Threat"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"


# These details are used to populate the Incident Index page.
victim: "Ubiquiti"
incident_start_date: 2020-12-10
incident_end_date: 2020-12-26
disclosure_date: 2021-01-11
final_status: "Perpetrator Plead Guilty"

---

In December of 2020, Ubiquiti suffered a breach at the hands of an employee. This employee masked his presence via a VPN and was able to clone the company's GitHub repository and alter logs in AWS to hide their presence and evidence of the breach. After the attacker leaked details of the attack to a well-known security blogger, Ubiquiti's stock lost 4 billion dollars in value.

<!--more-->

## Incident

### Details of the Incident

Beginning in December of 2020, a senior cloud engineer at Ubiquiti used his employee credentials to exfiltrate source code and customer information. Before starting the data exfiltration, the employee validated the credentials from his home network. Then shortly after successfully testing the credentials, he turned on a VPN to mask his IP address, logged into the company's Github account, and began cloning repositories to his local machine.

While cloning the repositories with sensitive information, the attacker's internet connection and VPN dropped. As a result, for around 30 minutes, the employee was cloning the repositories using his residence IP.

After cloning most of the repositories from GitHub, the employee went into the company's AWS account, again under the mask of his VPN, and altered the lifecycle retention policy on the S3 Bucket holding the logs relating to his attack. The employee configured the lifecycle policy to delete after one day.

Within the following days, the other Ubiquiti employees realized an incident had occurred and began responding. The employee joined the team handling the incident to monitor Ubiquiti's response.

In January, senior Ubiquiti employees received a ransom email demanding 25 BTC not to release the customer information. After the company did not respond, the information was leaked to the public. Rather than paying the ransom, the company changed all employee passwords and released a security update to all customers urging them to reset their passwords and enable multi-factor authentication on their accounts.

In March, a whistleblower reached out to reporter Brian Krebs, released details of the previously unknown incident to the public, and claimed Ubiquiti was downplaying the incident.

Shortly after, the FBI identified the employee as Nickolas Sharp and searched his residence. In December 2021, Nickolas Sharp was charged with four counts relating to the incident. Sharp pleaded guilty in February 2023 and is scheduled to be sentenced in May 2023.

### Timeline

**December 10th, 2020** - An attacker logs into Ubiquiti's AWS infrastructure. The attacker ran the "GetCallerIdentity" command to return the username and account information for the AWS account.

**December 21st, 2020** - An attacker masked by a Surfshark VPN begins cloning Ubiquiti's GitHub Repositories.

**December 22nd, 2020** - The Internet at the Sharp residence goes down for 30 minutes. Cloning commands continue when it comes back up, but VPN is turned off temporarily.

**December 26th, 2020** - Nickolas Sharp altered the lifecycle retention policy on the S3 Bucket storing the CloudTrail events to erase logs of their attack after a day.

**December 28th, 2020** - Other employees detected the incident and began investigating.

**January 7th, 2021** - Senior employees received a ransom email from the attacker.

**January 9th, 2021** - The attacker sent another email after not receiving the ransom, which contained a link to a public Keybase, which contained proprietary data of Ubiquiti.

**January 11th, 2021** - Ubiquiti emails customers stating to change passwords and enable multi-factor authentication, disclosing a breach had occurred.

**March 21st-28th, 2021** - An anonymous whistleblower, who turned out to be Nickolas Sharp, reaches out to Brian Krebs, outlining details of the attack and stating Ubiquiti was downplaying the breach.

**March 24th, 2021** - Federal Bureau of Investigation executes a search warrant on the Sharp residence.

**March 31st, 2021** - Ubiquiti releases a [statement](https://www.justice.gov/usao-sdny/press-release/file/1452706/download) regarding the attack.

**December 1st, 2021** - Nickolas Sharp is indicted.

**February 2nd, 2023** - Nickolas Sharp enters a Guilty plea in the case of this attack.

**May 10th, 2023** - Scheduled date for the sentencing hearing.

### Attribution / Perpetrator

Per the [Department of Justice](https://www.justice.gov/usao-sdny/pr/former-employee-technology-company-pleads-guilty-stealing-confidential-data-and), Nickolas Sharp "_pled guilty to intentionally damaging a protected computer, wire fraud, and making false statements to the Federal Bureau of Investigation._" The Department of Justice Identified Nickolas Sharp as the attacker when his VPN temporarily disconnected and revealed his home IP Address.

### Long-term impact:

After Brian Krebs released his article, Ubiquiti's stock price plummeted over 20%, resulting in a $4 billion loss to shareholders. Ubiquiti filed a defamation lawsuit against Brian Krebs for his article. The company later dropped the lawsuit after Krebs agreed to take down his original post about the incident. In his [retraction](https://krebsonsecurity.com/2022/08/final-thoughts-on-ubiquiti/), Krebs acknowledged that the sole basis of his reporting was the person federal prosecutors have since indicted.

## Summary of Coverage

Ubiquiti: [Account Notification](https://community.ui.com/questions/Account-Notification/96467115-49b5-4dd6-9517-f8cdbf6906f3) - January 11th, 2021

Brian Krebs: [Ubiquiti Change Your Password](https://krebsonsecurity.com/2021/01/ubiquiti-change-your-password-enable-2fa/) - January 11th, 2021

Brian Krebs: [Whistleblower: Ubiquiti Breach "Catastrophic"](https://web.archive.org/web/20210331165953/https://krebsonsecurity.com/2021/03/whistleblower-ubiquiti-breach-catastrophic/#more-55007) - March 21st, 2021

Ubiquiti: [Update to January 2021](https://community.ui.com/questions/Update-to-January-2021-Account-Notification/3813e6f4-b023-4d62-9e10-1035dc51ad2e) March 31st, 2021

Brian Krebs: [Final Thoughts](https://krebsonsecurity.com/2022/08/final-thoughts-on-ubiquiti/) - August 31st, 2021

DOJ: [Press Release of Indictment](https://www.justice.gov/usao-sdny/pr/former-employee-technology-company-charged-stealing-confidential-data-and-extorting) - December 1st, 2021

DOJ: [Indictment of Nicholas Sharp](https://www.justice.gov/usao-sdny/press-release/file/1452706/download) - December 1st, 2021

Court Listener: [Ubiquiti Inc. vs. Krebs](https://www.courtlistener.com/docket/63197557/ubiquiti-inc-v-krebs/) - September 1st, 2022

Department of Justice: [Guilty Plea](https://www.justice.gov/usao-sdny/pr/former-employee-technology-company-pleads-guilty-stealing-confidential-data-and) February 2nd, 2023

Verge: [Report on Breach](https://www.theverge.com/2023/2/3/23584414/ubiquiti-developer-guilty-extortion-hack-security-breach-bitcoin-ransom) February 3rd, 2023

## Cloud Security lessons learned.

As a "senior software engineer … responsible for software development and cloud infrastructure security", Nickolas Sharp needed admin level permissions to perform his job functions. However the ancient adage _Quis custodiet ipsos custodes_ still applies. While cloud engineers should have admin level access to AWS, the following practices still should be applied:

- Monitoring of privileged activity
- Ensuring that logging data is written to an AWS account that is not used for other activities
- Monitoring & questioning any activities in AWS accounts that service a security, audit, or compliance purpose
- Enable S3 Versioning on buckets that contain security sensitive log data
- Enable MFA Delete or two-person control via SCPs

As Sharp already had privileged access, it is unclear what role the cloning of GitHub repositories played in this data breach. However, the following GitHub practices might have made the insider activity more clear to the company:

- Maintaining audit data of cloned repos
- Using a secrets scanning service like GitGuardian or GitHub Advanced Security
- Ensuring that every member of the GitHub organization does not have the ability to clone all the repos.
