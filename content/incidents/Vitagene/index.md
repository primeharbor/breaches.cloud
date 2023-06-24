---
title: "Vitagene"
date: 2023-06-21T14:58:49-04:00
lastmod: 2023-06-21T14:58:49-04:00

description: "Cloud Security synopsis of the FTC action against genetic sequencing company Vitagene."

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["S3 Buckets","CloudTrail","Logging"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Vitagene (now 1Health.io)"
incident_start_date: 2016-01-01
incident_end_date: 2019-07-01
disclosure_date: 2019-08-01
final_status: "FTC Action against the company."

---


Vitagene is a consumer DNA sequencing company that the FTC fined for several deceptive privacy practices. As part of their investigation, the FTC determined that a few thousand customers' DNA information was stored in public S3 buckets.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

Vitagene left approximately 2,500 health records and genetic sequences in a public S3 bucket. As part of an investigation into Vitagene's business practices, the FTC cited several deficiencies in Vitagen's cloud security practices.

> *Despite the fact that Respondent stores consumers' sensitive personal information in the Amazon S3 Datastore, Respondent did not uniformly apply basic safeguards to the data in each of its Amazon S3 Datastore Buckets. In or about 2016, Respondent created a publicly accessible Bucket in which Respondent stored Health Reports for at least 2,383 consumers and a publicly accessible Bucket in which Respondent stored raw genetic data (sometimes accompanied by first name) for at least 227 consumers. Respondent did not use any access controls to restrict access to this sensitive data, encrypt it, log or monitor access to it, or inventory it to help ensure ongoing security. As a result of Respondent's disregard for the basic security of the ... Buckets, Respondent publicly exposed online the health and genetic information of more than 2,600 consumers.* ([FTC Complaint #28 p8](complaint.pdf))

> *Between July 2017 and June 2019, Respondent received at least three warnings that it was storing consumers' unencrypted health, genetic, and other personal information in publicly accessible Buckets.* ([FTC Complaint #29 p8](complaint.pdf))

> *Vitagene said that the files dated from when the company was in “beta” testing and represented a small fraction of its customer base.* (source: [Bloomberg](https://www.bloomberg.com/news/articles/2019-07-09/dna-testing-service-exposed-thousands-of-customer-records-online?utm_source=website&utm_medium=share&utm_campaign=copy))

### Timeline

* On or about 2016, Vitagene created the public S3 Bucket
* July 2017 - AWS notified customers of S3 buckets with publicly readable ACLs. Vitagene was informed about six buckets that met these criteria.
* November 2018 - A security firm conducting a penetration test for Vitagen "found that uploaded DNA data was stored in Amazon S3 ... without any access controls." ([FTC Complaint #31](complaint.pdf))
* June 27th, 2019 - A researcher notified Vitagene about a public bucket with personal information.
* July 1st, 2019 - Researcher again tries to notify the company
* July 9th, 2019 - Bloomberg publishes the first article able the incident.
* August 2019 - Vitagene notifies customers of the breach
* October 2020 - Vitagene changes its branding to 1Health.io
* June 16, 2023 - FTC issues its [decision and order](decision_and_order.pdf) in the matter of *1HEALTH.IO INC., a corporation, also d/b/a VITAGENE, INC.*

### Long-term Impact
As part of the settlement with the FTC, 1Health.io (the successor company to Vitagene) must pay $75,000 and institute new privacy practices. They must submit to regular security audits and provide the findings to the FTC.

## Summary of Coverage
* Bloomberg: [DNA Test Service Exposed Thousands of Client Records Online](https://www.bloomberg.com/news/articles/2019-07-09/dna-testing-service-exposed-thousands-of-customer-records-online?utm_source=website&utm_medium=share&utm_campaign=copy) July 9, 2019 - ([LA Times version](https://www.latimes.com/business/la-fi-vitagene-dna-privacy-exposed-20190709-story.html))
* FTC Press Release: *[FTC Says Genetic Testing Company 1Health Failed to Protect Privacy and Security of DNA Data and Unfairly Changed its Privacy Policy](https://www.ftc.gov/news-events/news/press-releases/2023/06/ftc-says-genetic-testing-company-1health-failed-protect-privacy-security-dna-data-unfairly-changed)* June 16, 2023
* [FTC Complaint](complaint.pdf)


## Cloud Security Lessons Learned

As documented in the FTC Complaint:
* [Vitagene] *did not use access controls to restrict access to this sensitive data, encrypt it, log or monitor access to it, or inventory it to help ensure ongoing security.*
* Vitagne did not receive or chose not to act on notices sent to the root account from AWS regarding the public bucket.
* Based on the following statement, it seems that Vitagene did not enable CloudTrail logging for management events _or_ data events.
	> *Because Respondent had not taken steps to log access to the Health and Genetic Buckets, Respondent was **unable to determine exactly when the Buckets had been created** or whether anyone other than the security researcher had accessed, downloaded, or transferred any of the sensitive health, genetic, and personal information they contained.* ([FTC Complaint #33 p9](complaint.pdf))

