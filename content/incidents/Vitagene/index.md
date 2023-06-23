---
title: "Vitagene"
date: 2023-06-21T14:58:49-04:00
lastmod: 2023-06-21T14:58:49-04:00

description: "Update this with a social media and SEO synopsis"

# Set to false before publishing
draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["REPLACE","THIS WITH","VALID TAGS"]

showToc: true # Do not change
author: "First Last"
author_url: "https://www.cnn.com/"

# These details are used to populate the Incident Index page.
victim: "Capital One"
incident_start_date: 2023-03-01
incident_end_date: 2023-03-02
disclosure_date: 2023-03-01
final_status: "Perpetrator Plead Guilty"

---

Vitagene is a consumer DNA sequencing company that was fined by the FTC for a number of deceptive privcy practices. As part of their investigation, the FTC determined that a few thousand customer's DNA information was stored in public S3 buckets.

<!--more--> <!-- This separates the synopsis from the main body -->

## Incident

### Timeline

In or about 2016, Vitagene created the public S3 Bucket
July 2017 - AWS sent a notice to it's customers regarding S3 bucekts with publicly readable ACLs. Vitagene was informed about six buckets. 
July 1st, 2019 - A researcer notified Vitagene about the public bucket. 
*The security researcher later reported his findings to the news media, which published articles about this breach of security in July 2019.*
August 2019 - Vitagene notifies customers of breach


### Attribution / Perpetrator

### Long-term Impact

## Summary of Coverage
* Source: [News Article One](FIXME) Month Day, Year
* Source: [News Article Two](FIXME) Month Day, Year
* [Press Release](FIXME) Month Day, Year
* [Victim Blog Post 1](FIXME) Month Day, Year

https://www.latimes.com/business/la-fi-vitagene-dna-privacy-exposed-20190709-story.html

https://healthitsecurity.com/news/dna-testing-service-vendor-reports-years-long-consumer-data-breach

https://www.bloomberg.com/news/articles/2019-07-09/dna-testing-service-exposed-thousands-of-customer-records-online



## Cloud Security Lessons Learned

As documented in the FTC Complaint:
* [Vitagene] *did not use any access controls to restrict access to this sensitive data, encrypt it, log or monitor access to it, or inventory it to help ensure ongoing security.*
* Vitagne did not recieve or chose not to act on notices sent to the root account from AWS regarding the public bucket.
* Based on the following statement, it seems that Vitagene did not enable CloudTrail logging for management events _or_ data events. 
	> *Because Respondent had not taken steps to log access to the Health and
Genetic Buckets, Respondent was **unable to determine exactly when the Buckets had been
created** or whether anyone other than the security researcher had accessed, downloaded, or
transferred any of the sensitive health, genetic, and personal information they contained.*




