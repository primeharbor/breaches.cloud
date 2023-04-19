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
	1. A browser window will open up to localhost:1313 and then the hugo webserver will start.

You should have a functioning copy of the breaches.cloud site.

To create a new page for a new incident run:
```bash
make incident name=INCIDENT_NAME
```
You will find the new files under `content/incidents/INCIDENT_NAME`


## Guidance for making pull requests.







