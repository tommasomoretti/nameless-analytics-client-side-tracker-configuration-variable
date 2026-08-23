# Nameless Analytics | Client-side Tracker Configuration Variable

The Nameless Analytics Client-side Tracker Configuration Variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side Tracker Tag](https://github.com/nameless-analytics/client-side-tracker-tag/). 

For an overview of how Nameless Analytics works [start from here](https://github.com/nameless-analytics/nameless-analytics/#overview).

### 🚧 Nameless Analytics and the documentation are currently in beta and subject to change



## Table of Contents
- [Nameless Analytics Client-side Tracker Configuration Variable UI](#nameless-analytics-client-side-tracker-configuration-variable-ui)
- [User data](#user-data)
  - [User parameters](#user-parameters)
    - [Add user level parameters](#add-user-level-parameters)
- [Session data](#session-data)
  - [Session parameters](#session-parameters)
    - [Add User ID](#add-user-id)
    - [Add session level parameters](#add-session-level-parameters)
- [Page data](#page-data)
  - [Page parameters](#page-parameters)
    - [Override default page parameters](#override-default-page-parameters)
    - [Add page level parameters](#add-page-level-parameters)
    - [Add page status code](#add-page-status-code)
- [Event data](#event-data)
  - [Shared event parameters](#shared-event-parameters)
    - [Add shared event level parameters](#add-shared-event-level-parameters)
- [Server-side endpoint settings](#server-side-endpoint-settings)
  - [Endpoint domain name](#endpoint-domain-name)
    - [Endpoint requirements for Cross-domain](#endpoint-requirements-for-cross-domain)
  - [Endpoint path](#endpoint-path)
    - [Endpoint path requirements for Cross-domain](#endpoint-path-requirements-for-cross-domain)
- [Advanced settings](#advanced-settings)
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Override default acquisition parameters](#override-default-acquisition-parameters)
  - [Enable cross-domain tracking](#enable-cross-domain-tracking)
  - [Load JavaScript libraries in first-party mode](#load-javascript-libraries-in-first-party-mode)
    - [Custom library domain name](#custom-library-domain-name)
    - [Custom library path](#custom-library-path)
  - [Add current dataLayer state](#add-current-datalayer-state)
  - [Enable logs in JavaScript console](#enable-logs-in-javascript-console)



## Nameless Analytics Client-side Tracker Configuration Variable UI
The Nameless Analytics Client-side Tracker Configuration Variable provides a centralized architecture for managing global tracking parameters. 

It unifies essential settings including user identity, cross-domain logic and consent management to ensure consistent data governance across all tags.

This is the UI of the Nameless Analytics Client-side Tracker Configuration Variable.

![Nameless Analytics Client-side Tracker Configuration Variable UI](https://github.com/user-attachments/assets/ede9f7f4-6090-42a8-9249-4af277bd68ae)



## User data
### User parameters
Add user parameters in the user_data object. See [Parameter Hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy) in the main project documentation.

> [!WARNING]
> Be mindful when adding custom **User parameters** as they might cause you to hit the Firestore 1 MiB document limit faster. Read the [Firestore limitations in the main documentation](https://github.com/nameless-analytics/nameless-analytics#known-limitations-firestore-1-mib-document-limit) for more details.

They will be:
- written in Google Cloud Firestore every time they change --> latest values 
- sent to BigQuery with the last available values --> all values

These user parameters are reserved and can't be modified:
- user_channel_grouping  
- user_source  
- user_tld_source  
- user_campaign  
- user_campaign_id  
- user_campaign_click_id
- user_campaign_content  
- user_campaign_term  
- user_device_type  
- user_country  
- user_city
- user_language  
- user_first_session_timestamp
- user_last_session_timestamp

#### Add user level parameters
Accepted values: strings, integers, floats, JSON and booleans.

These parameters can be overridden by:
- User parameters added in Nameless Analytics Server-side Client Tag



## Session data
### Session parameters
Add session parameters in the session_data object. See [Parameter Hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy) in the main project documentation.

> [!WARNING]
> Be mindful when adding custom **Session parameters** as they might cause you to hit the Firestore 1 MiB document limit faster. Read the [Firestore limitations in the main documentation](https://github.com/nameless-analytics/nameless-analytics#known-limitations-firestore-1-mib-document-limit) for more details.

They will be:
- written in Google Cloud Firestore every time they change --> latest values 
- sent to BigQuery with the last available values --> all values

These session parameters are reserved and can't be modified:
- user_id
- session_number 
- cross_domain_session 
- session_channel_grouping 
- session_source 
- session_tld_source 
- session_campaign 
- session_campaign_id 
- session_campaign_click_id
- session_campaign_content 
- session_campaign_term 
- session_device_type 
- session_city
- session_country 
- session_language 
- session_hostname 
- session_browser_name 
- session_landing_page_category 
- session_landing_page_url 
- session_landing_page_path 
- session_landing_page_title 
- session_exit_page_category 
- session_exit_page_url
- session_exit_page_path 
- session_exit_page_title 
- session_start_timestamp 
- session_end_timestamp

#### Add User ID
Add User ID parameter at session level. Accepted values: strings, integers, floats, JSON and booleans.

These parameters can be overridden by:
- User ID parameter added in Nameless Analytics Server-side Client Tag

#### Add session level parameters
Add session level parameters. Accepted values: strings, integers, floats, JSON and booleans.

These parameters can be overridden by:
- Session parameters added in Nameless Analytics Server-side Client Tag



## Page data
### Page parameters
Add page parameters in the page_data object. Read how to track [page views](https://github.com/nameless-analytics/nameless-analytics/tree/main/setup-guides/SETUP-GUIDES.md#how-to-track-page-views) for more information.

They will be sent to BigQuery with every event.

These page parameters are reserved: they cannot be used as custom parameter names in [Add page level parameters](#add-page-level-parameters). Six of them can still be replaced through the dedicated [Override default page parameters](#override-default-page-parameters) fields:
- page_id
- page_load_timestamp
- page_hostname_protocol
- page_hostname
- page_title
- page_url
- page_path
- page_fragment
- page_query
- page_extension
- page_referrer
- page_status_code

#### Override default page parameters
If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document parameters.

> **Both Page title and Page path must be filled in.** The override is applied only when both fields have a value: if either one is left empty, none of the six parameters is overridden and the tag silently falls back to the values read from the browser.

- Page title: Add the `page_title` parameter to the request in `page_data`.

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document title.

  If virtual page view is triggered by a GTM history change trigger (pushState or replaceState), the page title will be taken from the `document.title` property.  

- Page url: Add the `page_url` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document location.

  If virtual page view is triggered by pushState or replaceState, the page location will be taken from the `document.location.href` property. 

- Page path: Add the `page_path` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document path.

  If virtual page view is triggered by pushState or replaceState, the page location will be taken from the `document.location.pathname` property. 

- Page fragment: Add the `page_fragment` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document fragment.

  If virtual page view is triggered by pushState or replaceState, the page fragment will be taken from the `document.location.hash` property. 

- Page query: Add the `page_query` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document query.

  If virtual page view is triggered by pushState or replaceState, the page query will be taken from the `document.location.search` property. 

- Page extension: Add the `page_extension` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document extension.

  If virtual page view is triggered by pushState or replaceState, the page extension will be taken from the `document.location.pathname` property. 

#### Add page level parameters
Add or override custom page level parameters. Accepted values: strings, integers, floats, JSON and booleans.

These parameters can't be overridden by any other tags.

`page_category` is not a dedicated field: add it here as a custom parameter. It is an optional dimension used to group pages into high-level categories, and the reporting functions expose it as `page_category`, `session_landing_page_category` and `session_exit_page_category`.

#### Add page status code
This feature captures the HTTP status code (e.g., 200, 404, 500) of the current page and adds it to the `page_data` object during the `page_view` event. This is essential for monitoring broken links and server-side errors directly within your analytics reports.

**How it works:**
To ensure accuracy, the tracker performs a lightweight asynchronous `HEAD` request to the current URL. This allows it to fetch the server response status without downloading the entire page content again.

**Technical Note:**
Enabling this feature adds one extra network call to the start of the tracking sequence. While the `HEAD` request is extremely fast and efficient, keep in mind this additional interaction when evaluating site performance and network logs.



## Event data
### Shared event parameters
Add shared event parameters in the event_data object. See [Parameter Hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy) in the main project documentation.

They will be sent to BigQuery with every event.

These event parameters are reserved and can't be modified:
- event_type 
- channel_grouping 
- source 
- campaign 
- campaign_id
- campaign_click_id
- campaign_term 
- campaign_content 
- user_agent 
- browser_name 
- browser_language 
- browser_version 
- device_type 
- device_vendor 
- device_model 
- os_name 
- os_version 
- screen_size 
- viewport_size
- tld_source
- city
- country
- cross_domain_id

#### Add shared event level parameters
Add shared event parameters for every event. Accepted values: strings, integers, floats, JSON and booleans.

These parameters can override:
- Event parameters from dataLayer added in Nameless Analytics Client-side Tracker Tag

These parameters can be overridden by:
- Event parameters added in Nameless Analytics Server-side Client Tag
- Event parameters added in Nameless Analytics Client-side Tracker Tag



## Server-side endpoint settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

#### Endpoint requirements for Cross-domain
When tracking multiple domains, the Server-side GTM endpoint configuration becomes critical due to how browsers handle the `Set-Cookie` header:

* **Static Endpoint**: If all domains are subdomains of the same root (e.g., `a.site.com` and `b.site.com`), a single static endpoint (e.g., `gtm.site.com`) works.
* **Dynamic Endpoints**: If domains are completely different (e.g., `domain-a.com` and `domain-b.com`), the requests must be sent to a first-party subdomain of the *current* page (e.g., `gtm.domain-a.com` on site A and `gtm.domain-b.com` on site B). This ensures that the `Domain` attribute in the `Set-Cookie` header matches the request origin, allowing the browser to accept the cookie. Otherwise, cookies will be rejected by the browser due to cross-site security policies. See the [Cross-domain Architecture](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture) section for more information.


### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

#### Endpoint path requirements for Cross-domain
The endpoint path must be the same for all domains.



## Advanced settings
### Respect Google Consent Mode
Fully integrated with Google Consent Mode. Choose between respect or not respect consent mode:
- When Google Consent Mode is present and `respect_consent_mode` is enabled, the events are sent only if a user consents. 
  - if `analytics_storage` is equal to `denied`, the Nameless Analytics Client-side Tracker waits until consent is granted.
  - if `analytics_storage` changes from `denied` to `granted`, all pending tags for the page will be fired in execution order
- When Google Consent Mode not present and `respect_consent_mode` is enabled, none of the events are sent. 

When `respect_consent_mode` is disabled, all events are sent regardless of presence of Google Consent Mode.


### Override default acquisition parameters
Override the default URL query parameter names used as acquisition parameters. By default these values are taken from standard UTM parameters.

Default values: 
- source = utm_source
- campaign = utm_campaign
- campaign_id = utm_id
- campaign_click_id = utm_click_id
- campaign_term = utm_term
- campaign_content = utm_content

If `utm_click_id` is missing, the Nameless Analytics Client-side Tracker Tag attempts to populate `campaign_click_id` using the following URL query parameters in order of priority. If none of these parameters are present, `campaign_click_id` will be null:
- For Google Ads: gclid or dclid or gclsrc or wbraid or gbraid
- For Bing: msclkid
- For Facebook: fbclid
- For TikTok: ttclid
- For X: twclid
- For Pinterest: epik
- For Linkedin: li_fat_id
- For SnapChat: scclid


### Enable cross-domain tracking
Enables session stitching across two or more websites.

When consent permits identity transfer, the Client-side Tracker Tag performs a real-time server-side handshake to retrieve the active `client_id` and `session_id`.

The tracker combines the server-issued `session_id` with the current URL-decoration timestamp using the following internal structure:

```text
{session_id}.{decoration_timestamp_ms}
```

The complete value is Base64-encoded and transferred through the `na_id` URL parameter.

On the destination domain, the Client-side Tracker Tag decodes and validates `na_id`. The original `session_id` is added to the event payload as `cross_domain_id` only when all the following conditions are met:

- cross-domain tracking is enabled
- the current event is the first `page_view` of the physical page
- the value can be decoded from Base64
- the decoded value follows the expected structure
- the `session_id` matches the required format: 15 alphanumeric characters, an underscore, 15 alphanumeric characters
- the decoration timestamp is not in the future
- no more than five minutes have elapsed since URL decoration

Malformed, expired or otherwise invalid values are ignored, and `cross_domain_id` remains `null`.

The Server-side Client Tag validates the `session_id` format again before using it as an identity. Values that do not match are discarded and a new session is created, while the event itself is still processed and stored.

This allows Nameless Analytics to preserve the same session across configured domains instead of creating a separate session on each website.

For an in-depth explanation of the server-side handshake and URL-decoration process, see the [Cross-domain Architecture documentation](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture).


### Load JavaScript libraries in first-party mode
Load libraries in first-party mode, from the website server or from a CDN. Add the domain name and the path to the permission list.

![Add library permissions](https://github.com/user-attachments/assets/660b41a8-9f3c-45cb-89c1-264d0f69e889)

#### Custom library domain name
Add the domain name of the server or CDN from where the libraries are loaded. 

#### Custom library path
Add the path to the libraries. This must be the full path to the libraries files. 


### Add current dataLayer state
Add the current state of the dataLayer in dataLayer field in the payload.  


### Enable logs in JavaScript console
Enable console log for all events in JavaScript console.

# 

[Website](https://namelessanalytics.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics_client_side_tracker_configuration_variable_readme) | [Twitter](https://x.com/nmlssanalytics) | [LinkedIn](https://www.linkedin.com/company/nameless-analytics/)
