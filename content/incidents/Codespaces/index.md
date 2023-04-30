---
title: "Codespaces 2014"
date: 2023-04-28T13:28:36-04:00

description: "A Cloud Security focused analysis of the Codespaces Breach in 2014"

# Set to false before publishing
# draft: true

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "S3", "EC2"]

showToc: true # Do not change
author: "Juan Rodriguez-Cardenas"
author_url: "https://github.com/seraphjrc"

# These details are used to populate the Incident Index page.
victim: "Codespaces"
incident_start_date: 2014-06-17
incident_end_date: 2014-06-18
disclosure_date: 2014-06-18
final_status: "Threat Actor Unknown"
---

In June of 2014, The code hosting and project management provider known as CodeSpaces.com was forced to shut down after a series of events in which an Unknown threat actor performed a well-organized Denial of Service attack and attempted to demand payment. The threat actor accessed Codespaces Amazon Account when negotiations fell through, deleting data and backups.

## Incident

### Details of the Incident

In June 2014, Code hosting and project management provider Codespaces.com was subject to a DDoS (Denial of Service Attack).  During the attack, the attacker claimed access to their “Amazon EC2 Control panel” leaving behind a [number of messages](https://web.archive.org/web/20140618165208/http://www.codespaces.com/) to contact them via Hotmail.

Once access to the EC2 Panel had been restored, Codespaces changed all passwords. However, the threat actor created multiple backdoor logins. When the attacker realized Codespaces was attempting to recover access, the threat actor deleted all EBS snapshots, S3 Buckets, AMIs, and several machines.

Following the damage assessment, it became clear that most Codespaces backups, data, and machine configurations were gone.

> "Code Spaces will not be able to operate beyond this point, the cost of resolving this issue to date and the expected cost of refunding customers who have been left without the service they paid for will put Code Spaces in an irreversible position both financially and in terms of ongoing credibility. As such at this point in time we have no alternative but to cease trading and concentrate on supporting our affected customers in exporting any remaining data they have left with us. [^1]"

### Timeline
**June 17, 2014** - Code Spaces is hit with a DDoS (Denial of Service) attack. \
**June 18, 2014** - Code Spaces is shut down permanently.

### Attribution / Perpetrator

Per the statement from the Codespaces website, “An unauthorized person who at this point who is still unknown (All we can say is that we have no reason to think it’s anyone who is or was employed with Code Spaces)”. No one has ever been identified as the perpetrator.

### Long-term impact

Codespaces never recovered the data and shut down permanently.

## Summary of Coverage

* Codespaces: [Official Notice to Customers](https://web.archive.org/web/20140618165208/http://www.codespaces.com/) - June 18, 2014
* ComputerWorld: [Blog Post](https://www.computerworld.com/article/2695663/hacker-puts--full-redundancy--code-hosting-firm-out-of-business.html) - June 19, 2014
* ThreatPost: [Blog Post](https://threatpost.com/hacker-puts-hosting-service-code-spaces-out-of-business/106761/) - June 24, 2014

## Cloud Security lessons learned.

* Maintain a copy of critical data in a non-workload AWS account
* When an incident occurs, engage AWS Support. AWS would have been able to identify the backdoor and might have been able to recover the data.

<!-- Footnotes themselves at the bottom. -->
[^1]: [Codespaces Apology and Statement](https://web.archive.org/web/20140618165208/http://www.codespaces.com/)


