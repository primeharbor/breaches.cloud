---
title: "CommuteAir"
date: 2023-04-28T13:28:36-04:00

description: "A Cloud Security focused analysis of the CommuteAir Breach"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Jenkins", "S3 Buckets"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"

# These details are used to populate the Incident Index page.
victim: "CommuteAir"
incident_start_date: 2023-01-19
incident_end_date: 2023-01-19
disclosure_date: 2023-01-19
final_status: "Tillie Kottman"
---

In January of 2023, CommuteAir suffered a breach that exposed the US Department of Homeland Security's "No Fly" and Selective Screening lists containing over 1.5 million records, along with CommuteAir employee information. The attacker found an exposed Jenkins server and was able to access different build workspaces containing repositories for the build jobs. On the Jenkins server, the attacker found access keys that offered access to the CommuteAir environment. After investigating the AWS Infrastructure, the attacker found the No Fly List among test data on the Jenkins server.

\<!--more--\> \<!-- This separates the synopsis from the main body --\>

## Incident

### Details of the Incident

In January 2023, an attacker began scanning the internet for exposed Jenkins servers using ZoomEye, a Chinese search engine similar to Shodan. Using ZoomEye, the attacker found an exposed Jenkins server that belonged to a regional airline, CommuteAir. This exposed Jenkins server gave the attacker access to repositories for around 70 different build jobs. While most of these projects were smaller, one project involved ACARS, a digital data link system for transmitting short messages between aircraft and ground stations. With a quick look at the directory, the attacker was able to access an SFTP server filled with incoming and outgoing ACARS messages. The attacker also gained access to APIs that controlled refueling, canceling, and updating flights.

The two projects that caught the attacker's eye were "noflycomparison and noflycomparsionv2." These projects contained hard-coded credentials and the names of S3 buckets related to the no-fly list. Using these credentials, the attacker accessed most of CommuteAir's AWS infrastructure, including S3 buckets, dynamodb tables, and various servers.

While CommuteAir didn't persist the No Fly Lists in S3, the attacker was able to find a copy in the repositories' test data. The test data contained 3 CSV with employee information, The US Government's No Fly list, and the Selective Screening List. These highly sensitive lists contained over 1.5 million records of different names. It was later discovered that this list is from 2019. The attacker then made the data available [at DDOS Secrets](https://ddosecrets.com/wiki/No_Fly_List).

### Timeline

**January 19th, 2023** - maia arson crimew published her blog post outlining how she found the Jenkins servers and was able to download the No Fly List.

**January 25th, 2023 -** TSA [begins an investigation](https://www.cnn.com/2023/01/20/politics/tsa-no-fly-list-data-cybersecurity/index.html)

### Attribution / Perpetrator

_Maia arson crimew_, also known as Tillie Kottman, claimed responsibility. Kottman posted on her [blog](https://maia.crimew.gay/posts/how-to-hack-an-airline/) the technical details of how the breach occurred. Kottman was previously [indicted](https://www.justice.gov/media/1130281/dl?inline) on conspiracy to commit computer fraud, wire fraud, and aggravated identity fraud in 2021. Kottman currently remains in Switzerland.

## Summary of coverage

DOJ: [Swiss Hacker indicted for conspiracy, wire fraud, and aggravated identity theft](https://www.justice.gov/usao-wdwa/pr/swiss-hacker-indicted-conspiracy-wire-fraud-and-aggravated-identity-theft) - March 18th, 2021

Maia's Blog: [How to hack an airline](https://maia.crimew.gay/posts/how-to-hack-an-airline/) - January 19th, 2023

DailyDot: [U.S. airline accidentally exposes 'No Fly List' on an unsecured server](https://www.dailydot.com/debug/no-fly-list-us-tsa-unprotected-server-commuteair/) - January 21st, 2023

BleepingComputer: [U.S. No Fly list shared on a hacking forum, government investigating](https://www.bleepingcomputer.com/news/security/us-no-fly-list-shared-on-a-hacking-forum-government-investigating/) - January 30th, 2023

## Cloud Security lessons learned.

- Hardcoded AWS Credentials: CommuteAir held AWS access keys inside of their insecure Jenkins server. This allowed the attacker to access the AWS infrastructure. Ensuring these credentials are not left in code could ensure this type of breach does not occur again. The AWS credentials also gave the attacker very broad permissions allowing them to access most of the AWS infrastructure.
- Encryption of sensitive data: CommuteAir used an AWS S3 bucket to store the unencrypted information of thousands of employees and passengers, making it easy for attackers to obtain sensitive data.
- Publicly Exposed Jenkins Server: CommuteAir's Jenkins server was public and could easily be found by using ZoomEye or Shodan. If the server must remain public, monitor the server regularly and implement access controls if a user is able to connect.
- Sensitive Data Storage: CommuteAir's repositories were publically accessible to anyone with access to the server itself. The No Fly List and Selective Screening List were both contained in a test data folder. Implementing proper access controls on what privileges a base user should have would have helped mitigate this breach. Also evaluating what sensitive data is stored and what data does not need to be stored would be beneficial. The breached lists were both from 2019 meaning they are slightly outdated and could likely be deleted off the server.