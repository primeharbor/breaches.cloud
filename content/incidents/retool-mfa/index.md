---
title: "Retool MFA"
date: 2023-11-10T19:43:16-05:00
lastmod: 2023-11-10T19:43:16-05:00

description: "Retool is impacted by a spear phishing that compromised the MFA tokens for a number of sensitive internal systems."

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["Google","MFA","Spear Phishing"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Retool"
incident_start_date: 2023-08-27
incident_end_date: 2023-08-29
disclosure_date: 2023-08-29
final_status: ""

---

An engineer at [Retool](https://retool.com/) fell victim to a social engineering attack that led to the compromise of an engineer's MFA tokens and the account takeover of a small number of Retool customers.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

On August 27th, a Retool engineer fell victim to a social engineering attack. As part of the attack, the perpetrator managed to gain access to the engineer's Google account. Google Authenticator (the MFA mobile app) syncs the Temporary One Time Passcode (TOTP) seeds to the cloud. By compromising the engineer's Google Session, the perpetrator could gain access to all of the engineer's MFA tokens. From there, the attacker was able to pivot to several internal systems at Retool.

The incident at Retool has been [linked](https://www.coindesk.com/business/2023/09/13/phishing-attack-on-cloud-provider-with-fortune-500-clients-led-to-15m-crypto-theft-from-fortress-trust/) to a theft of $15M in cryptocurrency from [Fortress Trust](https://fortresstrust.com/)

### Details of the Incident

The Retool employee was spear phished to a fake Okta domain under the guise of "an issue with Open Enrollment". After the first access, the attackers used a deep-fake voice and inside knowledge of the company to convince the engineer to provide a second MFA token. From the Retool blog post:

> The caller claimed to be one of the members of the IT team, and deepfaked our employee’s actual voice. The voice was familiar with the floor plan of the office, coworkers, and internal processes of the company. Throughout the conversation, the employee grew more and more suspicious, but unfortunately did provide the attacker one additional multi-factor authentication (MFA) code.

From there, they were able to access the MFA tokens.

> Unfortunately Google employs dark patterns to convince you to sync your MFA codes to the cloud, and our employee had indeed activated this “feature”. If you install Google Authenticator from the app store directly, and follow the suggested instructions, your MFA codes are by default saved to the cloud. If you want to disable it, there isn’t a clear way to “disable syncing to the cloud”, instead there is just a “unlink Google account” option. In our corporate Google account, there is also no way for an administrator to centrally disable Google Authenticator’s sync “feature”. We will get more into this later.

The MFA tokens granted access to the VPN and allowed the attacker to move laterally with ease:

> Getting access to this employee’s Google account therefore gave the attacker access to all their MFA codes. With these codes (and the Okta session), the attacker gained access to our VPN, and crucially, our internal admin systems. This allowed them to run an account takeover attack on a specific set of customers (all in the crypto industry). (They changed emails for users and reset passwords.) After taking over their accounts, the attacker poked around some of the Retool apps.




### Timeline
| Date | Event |
| ------ | ----- |
| **April 23, 2023** | Google [announces](https://security.googleblog.com/2023/04/google-authenticator-now-supports.html) that the Google Authenticator Application now supports sync to the cloud. |
| **August&nbsp;27,&nbsp;2023** | Retool engineer falls victim to spear phishing attack. |
| **August&nbsp;29,&nbsp;2023** | Retool notifies the 27 impacted customers. |
| **September&nbsp;7,&nbsp;2023** |Fortress [tweets](https://twitter.com/Fortress_io/status/1699793873395191813) about a third-party compromise. ([screenshot](FortressTweet.png)) |
| **September&nbsp;13,&nbsp;2023** | Retool publishes a [blog post](https://retool.com/blog/mfa-isnt-mfa) outlining the details of the attack. ([PDF](RetoolBlogPost.pdf))  |
| **September&nbsp;14,&nbsp;2023** | [CoinDesk attributes](https://www.coindesk.com/business/2023/09/13/phishing-attack-on-cloud-provider-with-fortune-500-clients-led-to-15m-crypto-theft-from-fortress-trust/) a $15M crypto-heist to the Retool incident. |


### Attribution / Perpetrator

No disclosure has been made about the Perpetrator; however, Retool indicated the 27 impacted customers were in the cryptocurrency industry.

## Summary of Coverage
* Retool Blog: [When MFA isn't actually MFA](https://retool.com/blog/mfa-isnt-mfa) Sept 13, 2023
* Bleeping Computer: [Retool blames breach on Google Authenticator MFA cloud sync feature ](https://www.bleepingcomputer.com/news/security/retool-blames-breach-on-google-authenticator-mfa-cloud-sync-feature/) Sept 15, 2023
* CoinDesk: [Phishing Attack on Cloud Provider With Fortune 500 Clients Led to $15M Crypto Theft From Fortress Trust](https://www.coindesk.com/business/2023/09/13/phishing-attack-on-cloud-provider-with-fortune-500-clients-led-to-15m-crypto-theft-from-fortress-trust/) Sept 14, 2023

## Cloud Security Lessons Learned

Storage of seeds for TOTP-based multi-factor authentication is something that every organization needs to threat model. If the TOTP seeds are stored in the same vault as the password, the compromise of the vault provides both factors of authentication.

As with Retool, the TOTP seeds were stored in Google Workspace without the explicit knowledge of the security team because Google "enhanced" their product to offer the ability to sync these tokens. Another popular free TOTP MFA application, Authy from Twillio, will also sync to the cloud. This syncing feature is free, which means it is typically outside the control or review of the enterprise security team.

While hardware keys provide better protection from phishing than TOTPs, not all systems support hardware keys, and hardware keys are impractical for shared accounts. Security teams should implement a sanctioned solution for their privileged users rather than forcing their technologists to figure it out independently.

