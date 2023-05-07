# Contributing to breaches.cloud

Thank you for your interest in keeping [breaches.cloud](https://breaches.cloud) up to date. Hopefully, this document covers the details you need to submit a new breach or update an existing one.

## What sort of incidents belong on breaches.cloud?

This site is for security incidents where a *customer's mistake* in public cloud configuration was a direct or [proximate cause](https://en.wikipedia.org/wiki/Proximate_cause) of the incident or breach. Vulnerabilities and issues with the _cloud providers themselves_ belong at [The Open Cloud Vulnerability & Security Issue Database](https://www.cloudvulndb.org/).

## Editorial Guidelines

It's essential to provide as much detail via press releases, indictments, FTC civil actions, or court filings as possible.  Technical detail is critical to inform the cloud security community of the measures they must take to avoid being involved in a similar incident.

Avoid speculation where possible; however, it's ok to "fill in the gaps" between details in an indictment and how that detail might have occurred technically in a cloud provider.

Avoid sensational language unless it is part of a news article or press release headline.

### Naming Individuals

If a person or company is named, that person or company **must be explicitly named** in a sourced document. Traditionally, the United States treats all individuals as innocent until proven guilty. As such, any mention of a suspect must ***clearly indicate*** if that person is indicted, convicted, pleaded guilty, or was found not guilty by a court of law.

Any mention of an individual must include a link to the indictment where that person is named.

## Setting up the Hugo environment to preview your pages

This site uses [Hugo](https://gohugo.io/) to render the content in markdown to HTML. To create a testing version of this site:

1. Fork & clone this repository
2. Download the Submodule for the [Fuji theme](https://github.com/dsrkafuu/hugo-theme-fuji/)
	```bash
	$ git submodule init
	$ git submodule update
	```
3. Download [Hugo Extended v0.111.1](https://github.com/gohugoio/hugo/releases/tag/v0.111.1). You must download the _extended_ version. Extract the binary into your path and call it `hugox`
4. Run `make test-preview`
	1. A browser window will open to localhost:1315 and the hugo webserver will start.

You should have a functioning copy of the breaches.cloud site.

To create a new page for a new incident run:
```bash
make incident name=INCIDENT_NAME
```
You will find the new files under `content/incidents/INCIDENT_NAME`


## Guidance for making pull requests.

All pull requests (PRs) will be reviewed to ensure they follow the Editorial Guidelines above. We will ask for changes if the language is sensationalist or provides facts without proper citation. Please make PRs to the `preview` branch of https://github.com/primeharbor/breaches.cloud

Please do _not_ disclose facts about an incident you were involved in that might be under NDA. :police_car: Please consult your attorney if you were responsible for an incident and disclosing new facts on a case. :)  :police_car:

### FrontMatter
Please complete the FrontMatter of each new incident:
```yaml
---
title: "Imperva RDS Snapshot"
date: 2023-04-09T16:51:47-04:00
# lastmod: 2023-04-09T16:51:47-04:00

description: "A Cloud Security focused analysis of a data breach at Imperva in October 2018"

# Set to false before publishing
draft: false

# This is not used for SEO, but allows users on the site to view incidents by keyword
tags: ["AWS", "Public Snapshots", "Public Instance"]

showToc: true # Do not change
author: "Chris Farris"
author_url: "https://www.chrisfarris.com/"

# These details are used to populate the Incident Index page.
victim: "Imperva"
incident_start_date: 2018-10-01
incident_end_date: 2018-10-31
disclosure_date: 2019-08-27
final_status: "Closed"

---
```

* `title` is what is seen on the front page and in the title tag
* `date` is the publishing date
* `lastmod` should be updated if you're changing or updating an incident
* `description` is for SEO and is designed to help people find the content
* `tags` are how we map causes. It's intended to allow a visitor to filter to see all cases where a particular provider or problem led to an incident or breach.
* `author` and `author_url` is for the original author of a post.
* `victim`, `incident_start_date`, `incident_end_date`  `disclosure_date` are used on the [Incidents Page](http://www.breaches.cloud/incidents/) and in the details table in the top of each post. Dates should be YYYY-MM-DD
* `final_status` should indicate the current status of the case (yes, it is misnamed)

If a company has had more than one incident, please put the year in the title (ie, `Chegg (2018)`).

### Format of a page
The general format of a page should be a brief introduction, followed by a `<!--more-->` tag followed by this outline:
```
## Incident

### Details of the Incident

### Timeline of the Incident

### Attribution / Perpetrator

### Long-term Impact

## Summary of Coverage

## Cloud Security Lessons Learned
```

The `Long-term impact` section is optional for new incidents, as we do not know what that impact will be. Otherwise, the purpose of this section is to state the costs, penalties, etc, for the victim and people associated with the victim.

The `Attribution / Perpetrator` should cite primary sources if an individual or group is named, otherwise state: `No known attribution at this time.`

The `Cloud Security lessons learned` section is where you can highlight how the Perpetrator was able to use cloud mistakes in order to conduct their attack. The goal is to highlight best practices and why they should be followed.

## Questions or Discussions

If you are a member of the [Cloud Security Forum](https://cloudsecurityforum.slack.com) Slack, you can join the #breaches.cloud channel where questions or discussion can occur.
