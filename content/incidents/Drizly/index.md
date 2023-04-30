---
title: "Drizly 2020"
date: 2023-04-13T14:38:46-04:00

description: "A Cloud Security focused analysis of the Drizly breach in 2020"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "GitHub"]

showToc: true # Do not change
author: "Mark Gaddy"
author_url: "https://github.com/TheFunky1Markimark"


# These details are used to populate the Incident Index page.
victim: "Drizly"
incident_start_date: 2020-06-12
incident_end_date: 2020-06-13
disclosure_date: 2020-06-28
final_status: "Threat Actor Unknown"

---
In July 2020, Drizly, an on-demand alcohol delivery service, suffered a data breach that exposed the personal information of over 2 million users data. In April 2018, Drizly granted a company executive access to the company's GitHub repository so that he could participate in a one-day hackathon. However, the executive maintained permissions long after the hackathon ended. In July 2020, an attacker accessed the executive's GitHub, which granted him access to Drizly's GitHub repository. The attacker began investigating the source code for vulnerabilities and was able to find credentials to access the company's AWS infrastructure. The attacker then exfiltrated data the information of over 2 million users.

\<!--more--\>

## Incident

### Details of the Incident

In July 2020, Drizly, an on-demand alcohol delivery service, suffered a data breach from an unknown attacker. In April 2018, Drizly granted a company executive access to the company's GitHub repositories so that he could participate in a one-day hackathon. The executive maintained permissions long after the hackathon ended. In July 2020, an attacker accessed the executive's GitHub account by reusing credentials from an unrelated breach. The executive's password was only seven characters long with no special characters. The executive also did not have Mult-factor Authentication enabled on his GitHub account. This granted the attacker access to all of Drizly's GitHub repositories. The attacker cloned one of these repositories, which held credentials later used to access the company's AWS infrastructure. The attacker modified security group settings allowing them to access the AWS RDS database that contained customer data. The attacker then exfiltrated 2.5 million consumer records.

### Timeline

**April 2018** - Drizly grants a company executive access to its GitHub repository so that he could participate in a one-day hackathon.

**July 2020** - An attacker accessed the company's executive personal Github account using credentials from an unrelated breach. The attacker accessed all of Drizly's GitHub repositories through the executive's GitHub account. One repository contained AWS credentials which allowed the attacker access to the AWS infrastructure, where they manipulated security settings to allow them access to the company's RDS Databases, which contained the data of over 2 million users.

**July 28th, 2020** - Drizly releases a public statement regarding the breach.

**October 24th, 2022** - FTC begins investigating Drizly.

**January 10th, 2023** - FTC finalizes a complaint against Drizly, requiring them to destroy any personal data collected if it's not necessary to provide products or services. If it's essential, they must outline a specific retention schedule. Lastly, Drizly and its CEO must implement a security program and establish safeguards to protect against further security incidents.

### Attribution / Perpetrator

No known attribution at this time.

### Long-term impact

The incident prompted an investigation by the Federal Trade Commission. The investigation primarily looked at Drizly's current security practices. The FTC concluded from this investigation that there were multiple failures by Drizly that allowed the attacker to access the customer's data. The FTC order required CEO James Cory Rellas to implement information security programs at any future company he works for in the future.

Drizly was also sued by those whose data was leaked. The settlement is valued between $3.35 million and $7 million.

## Summary of coverage

- TechCrunch: [Drizly 2020 Data Breach](https://techcrunch.com/2020/07/28/drizly-data-breach/) - July 28th, 2020
- Westlaw: [Class Action Settlement](https://today.westlaw.com/Document/I771917ce92c411ebbea4f0dc9fb69570/View/FullText.html?transitionType=Default&contextData=(sc.Default)&firstPage=true) - April 1st, 2021
- Drizly: [Final Settlement Order](https://alcoholdeliverydatabreach.com/assets/Docs/FINAL%20APPROVAL%20ORDER.pdf) - October 26th, 2021
- Drizly: [Lawsuit information](https://alcoholdeliverydatabreach.com/) - October 26th, 2021
- FTC: [Drizly Complaint](https://www.ftc.gov/system/files/ftc_gov/pdf/202-3185-Drizly-Complaint.pdf) - October 24th, 2022
- BeerExchange: [Drizly Data Breach](https://thebeerexchange.io/drizly-data-breach/) - April 5th, 2023
- FTC: [Drizly LLC.](https://www.ftc.gov/legal-library/browse/cases-proceedings/2023185-drizly-llc-matter) - January 10th, 2023

## Cloud Security lessons learned

Initially, when the executive was given access to Drizly's GitHub repository, it was only supposed to be for a day-long hackathon. Drizly failed to monitor this executive's access and did not disable access following the hackathon leaving the executive with access for over three years. The following practices should be applied to ensure this does not happen again.

- Maintaining audit data of cloned repos
- Monitoring of privileged activity
- Ensuring that logging data is written to an AWS account that is not used for other activities
- Monitoring & questioning any activities in AWS accounts that service a security, audit, or compliance purpose
- Enable S3 Versioning on buckets that contain security sensitive log data.
