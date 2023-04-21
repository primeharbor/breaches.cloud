—--
title: "Cisco WebEx Account Losses"
date: 2023-04-21T13:28:36-04:00

description: "A Cloud Security focused analysis of the Cisco WebEx Deletion Incident in 2020"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "IAM Users",]

showToc: true # Do not change
author: "Juan Rodriguez-Cardenas"
author_url: "https://github.com/seraphjrc"

# These details are used to populate the Incident Index page.
victim: "Cisco"
incident_start_date: 2020-09-24
incident_end_date: 2021-02-10
disclosure_date: 2020-09-24
final_status: "Threat Actor in custody and charged."

 
In September 2018 a former engineer leveraged AWS credentials, left over from his time of employment, which resulted in the deletion of 456 virtual machines for Cisco’s WebEx Teams application. Cisco cited the outage as costing over $2.4M dollars.  \


&lt;!--more--> &lt;!-- This separates the synopsis from the main body -->


## Incident


### Details of the Incident

In September of 2018, a former Cisco Engineer deleted 456 Virtual Machines for Cisco’s WebEx.  


The [official DOJ Press release](https://www.justice.gov/usao-ndca/pr/san-jose-man-sentenced-two-years-imprisonment-damaging-cisco-s-network) states Sudhish Kasaba Ramesh is the person behind the incident. Ramesh was a former engineer for Cisco. Ramesh worked as part of the platform team responsible for automation, logging metrics, and learning. He possessed an access key for the WebEx Application that was maintained by AWS Servers.[^1] 

Following his resignation from the company, Ramesh deployed code from his Google Project account, resulting in the deletion of 456 Virtual Machines for Cisco’s WebEx Team Application that allows for video meetings, messaging, file sharing, and more. Over 16,000 WebEx Teams accounts were shut down for 2 weeks causing roughly 2.4 million in damages for Cisco. In his plea, Ramesh [states](https://www.google.com/url?q=https://www.justice.gov/usao-ndca/pr/san-jose-man-sentenced-two-years-imprisonment-damaging-cisco-s-network&sa=D&source=docs&ust=1681955435174552&usg=AOvVaw1efeqpUAGtW0FmNrnadl0H) that “he took reckless actions and did not consider the possible risk and consequences it would bring to Cisco”.  
 



### Timeline



**April 24, 2018** - Ramesh resigns from Cisco.

**September 24, 2018** - Ramesh "used his AWS key to access Cisco’s AWS account that maintained the servers for WebEx through his Google Cloud Platform account. He then issued commands over the course of two hours that deleted approximately 456 servers, resulting in the complete shutdown of the WebEx Teams application."[^2]
 
**July 13, 2020** - Ramesh is charged with one count of  Intentionally Accessing a Protected Computer Without Authorization and Recklessly Causing Damage.

**July 30, 2020** - Ramesh enters a plea agreement citing his accessing Cisco's cloud infrastructure hosted on AWS without authorization.
 
**August 26, 2020** - Ramesh Pleads guilty to one count of intentionally accessing a protected computer unauthorized and causing damage to Cisco.

**December 9, 2020** - Ramesh is sentenced following his pleading guilty.

**February 10, 2021** - Ramesh begins his sentence of 24 months in prison, a fine of 15,000$, and another year of supervision following his release.



### Attribution / Perpetrator

Per the official DOJ press release, former engineer Sudhish Kasaba Ramesh plead guilty to one charge of_ Intentionally Accessing a Protected Computer Without authorization and Recklessly Causing Damage. He was sentenced to 24 months in prison and must pay a fine of $15,000 in December 2020. 
 
The case study also noted that the FBI identified him as the one responsible after seeing his name registered under the Google Platform account and the credit card used to pay for it. Ramesh also used his work laptop at the same IP Address from where the attack was launched._


### Long-term impact


Cisco had to pay out $1 million in damages and another $1.4 million in refunds to customers for the 2-week downtime. However, despite the damages attributed Cisco ultimately decided not to seek compensation from Ramesh.


## Summary of coverage


* Department of Justice: **[Press Release on Ramesh's Imprisonment](https://www.justice.gov/usao-ndca/pr/san-jose-man-sentenced-two-years-imprisonment-damaging-cisco-s-network)** - December 9, 2020 

* U.S District Court of California San Jose division: **[Sentencing Memorandum ](https://dd80b675424c132b90b3-e48385e382d2e5d17821a5e1d8e4c86b.ssl.cf1.rackcdn.com/external/showtemp-4.pdf)**- December 9, 2020 

* U.S District Court of California San Jose division: **[Violation and Charges](https://storage.courtlistener.com/recap/gov.uscourts.cand.362365/gov.uscourts.cand.362365.1.0.pdf)**- July 13, 2020 

* U.S District Court of California San Jose division: **[Stipulation Order](https://storage.courtlistener.com/recap/gov.uscourts.cand.362365/gov.uscourts.cand.362365.9.0.pdf)** - July 31, 2020 

* Threat Post: **[Cisco Spokesperson Discloses Information on Consumer Data](https://threatpost.com/ex-cisco-employee-pleads-guilty-to-deleting-16k-webex-teams-accounts/158748/)** - August 27, 2020 

* CDSE: **[Case Study](https://www.cdse.edu/Portals/124/Documents/casestudies/case-study-sudhish-kasaba-ramesh.pdf)** - October 18, 2022 






## Cloud Security lessons learned.

Cisco should have disabled Ramesh's access upon his departure. That he still had access **5 months** after departing the company indicates:



* Cisco was, in 2018, still using IAM Users instead of Federated Identities tied to employee systems
* Cisco was, in 2018, still issuing IAM Access Keys
* Cisco was, in 2018, not leveraging any form of CSPM solution or otherwise deactivating unused access keys. 

<!-- Footnotes themselves at the bottom. -->
## Notes

[^1]:
    [ ](https://www.cdse.edu/Portals/124/Documents/casestudies/case-study-sudhish-kasaba-ramesh.pdf)<span style="text-decoration:underline;">CDSE Case Study</span>

[^2]:
     [Sentencing](https://www.justice.gov/usao-ndca/pr/san-jose-man-sentenced-two-years-imprisonment-damaging-cisco-s-network)
