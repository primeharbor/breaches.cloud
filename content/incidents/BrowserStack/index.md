---
title: "BrowserStack"
date: 2023-05-25T05:15:19-04:00
lastmod: 2023-05-25T05:15:19-04:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS","SES","Access Keys", "Forgotten Cloud Resources"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"

# These details are used to populate the Incident Index page.
victim: "BrowserStack"
incident_start_date: 2014-11-09
incident_end_date: 2014-11-11
disclosure_date: 2014-11-11
final_status: "Perpetrator Unknown"

---

In November 2014 BrowserStack, a cloud testing platform for cross-platform testing of different applications, was breached through an old prototype machine that had not been updated and was vulnerable to the shellshock exploit. The attacker created an IAM user and generated a keypair. The attacker accessed the email list and used AWS Simple Email Service to send emails to 5,000 users falsely stating BrowserStack was shutting down.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident
### Details of the Incident

BrowserStack provides customers with a cloud testing platform to allow developers to test their applications on multiple browsers and mobile applications on all mobile devices without any virtual machines, devices, or emulators. BrowserStack’s configuration consists of thousands of servers.

An attacker discovered an EC2 instance that had been running since 2012, was not in active use, and was subject to the recently discovered [shellshock vulnerability](https://en.wikipedia.org/wiki/Shellshock_(software_bug)). BrowserStack had not patched that machine due to it being inactive. The old machine also held the AWS API access keys.

Using the compromised AWS Access Keys, the user established persistence by creating a new IAM User, SSH Key, and launching a new EC2 Instance. From that instance the attacker mounted a "backup disk" and discovered credentials to a database containing customer credentials. The attacker added his IP address to the database security group, and copied one of the database tables containing some user information, their email, hashed passwords, and the last tested URL. The attacker locked the database table, triggering an operational outage which alerted BrowerStack to the compromise.

While the BrowserStack team investigated the incident, the attacker used the data he was able to copy and credentials he had for the Amazon Simple Email Service (SES) to send out an email to the email addresses he exfiltrated stating that BrowserStack was shutting down and that BrowserStack was never as secure as they marketed themselves to be.


### Timeline
| Date | Event |
| ------ | ----- |
| **November 9th, 2014** | An attacker gained unauthorized access to BrowserStack’s AWS Infrastructure. The attacker then sent a phishing email to 1000 users stating BrowserStack was shutting down, citing that BrowserStack had lied regarding their security measures. |
| **November 11th, 2014** | BrowserStack releases a post-mortem statement regarding the attack. BrowserStack takes full responsibility for the attack and explains the remediation tactics they implemented.|

### Attribution / Perpetrator
No known attribution at this time.

## Summary of Coverage

* Tech Crunch:  [Hacker Emails Testing Service BrowserStacks](https://techcrunch.com/2014/11/10/hacker-emails-testing-service-browserstacks-customers-says-company-lied-about-security/?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAHZij-Q8M6sIGhgsZJztlekMHwi___X45RcbK0NCV4RhiV9uBrP7Ki8fHMfdsVF8RaBMu79L1Us5ZwHz6hloo0TGt3RqJcgAZGMeST7EMn0-srt4ifxOnOMwyuaXJFc0-RL9dIWuBDFuHE5-FdexgBL2GC6d4PImaEtuWp4yGAA7) November 10th, 2014
* BrowserStack: [Attack and Downtime on 9th November](https://web.archive.org/web/20141220062119/http://www.browserstack.com:80/attack-and-downtime-on-9-November) November 11th, 2014
* Data Breaches: [BrowserStack Analysis](https://archive.ph/rsmmS) November 12th, 2014
* eSecurityPlanet: [BrowserStack Hacked via ShellShock](https://www.esecurityplanet.com/networks/browserstack-hacked-via-shellshock/) November 12th, 2014


## Cloud Security lessons learned.
* Rotating Passwords and Access Keys - BrowserStack should regularly rotate the access keys to the cloud environment. In BrowserStack’s case, an old active access key was left in a prototype machine which granted the attacker access to the cloud environment.
* Terminate unnecessary cloud resources. The compromised machine was two years old and no longer needed. Not only did this present a security risk, but it's also wasted money.
* BrowserStack admitted, *"All our servers, running or not, … should have been patched with the latest security upgrades and updates."*
* Event Logging - BrowserStack stated they have *"put in several additional checks and alerts, which are triggered on specified AWS actions."* The attacker created a new user, generated a new key pair, and whitelisted his IP address before being detected. Additional checks and alerts on these actions would help prevent an attacker from establishing persistence on AWS.
* Use of CloudTrail - By enabling CloudTrail, BrowserStack was *"able to verify the actions of the hacker using AWS CloudTrail, which confirmed that no other services were compromised, no other machines were booted, and our AMIs and other data stores were not copied."*
