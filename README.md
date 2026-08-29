# Nameless Analytics | Client-side Tracker Configuration Variable

The Nameless Analytics Client-side Tracker Configuration Variable provides shared parameters and settings to every [Nameless Analytics Client-side Tracker Tag](https://github.com/nameless-analytics/client-side-tracker-tag/) that uses it.

For an overview of how Nameless Analytics works [start from here](https://github.com/nameless-analytics/nameless-analytics/#overview).


### 🚧 Nameless Analytics and the documentation are currently in beta and subject to change


## Table of Contents

- [Template interface](#template-interface)
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
  - [Endpoint path](#endpoint-path)
- [Advanced settings](#advanced-settings)
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Override default acquisition parameters](#override-default-acquisition-parameters)
  - [Enable cross-domain tracking](#enable-cross-domain-tracking)
  - [Load JavaScript libraries in first-party mode](#load-javascript-libraries-in-first-party-mode)
    - [Custom library domain name](#custom-library-domain-name)
    - [Custom library path](#custom-library-path)
  - [Add current dataLayer state](#add-current-datalayer-state)
  - [Enable logs in JavaScript console](#enable-logs-in-javascript-console)
    - [Debug mode only](#debug-mode-only)
- [Verifying the setup](#verifying-the-setup)



## Template interface
Use the template to configure shared user, session, page and event parameters together with endpoint, consent, acquisition, cross-domain, library and logging settings.

![Nameless Analytics Client-side Tracker Configuration Variable UI](https://github.com/user-attachments/assets/ede9f7f4-6090-42a8-9249-4af277bd68ae)



## User data
### User parameters
Custom user parameters are added to `user_data` by every event that uses this Configuration Variable. Accepted values are strings, integers, floats, booleans and JSON-compatible values.

Firestore keeps the latest value for each user, while BigQuery preserves the value attached to each event. The Server-side Client Tag can add or override these parameters. See [Parameter hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy).

> [!WARNING]
> Custom user parameters increase the size of the Firestore user document. See [Firestore 1 MiB document limit](https://github.com/nameless-analytics/nameless-analytics/blob/main/setup-guides/TROUBLESHOOTING-GUIDE.md#firestore-1-mib-document-limit).

<details><summary>Reserved user parameters</summary>

These user parameters are reserved and can't be modified:
- user_date
- client_id
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

</details>

#### Add user level parameters
Add custom fields shared by all events. A matching parameter configured in the Server-side Client Tag replaces the value set here.



## Session data
### Session parameters
Custom session parameters are added to `session_data` by every event that uses this Configuration Variable. Accepted values are strings, integers, floats, booleans and JSON-compatible values.

Firestore keeps the latest value for the current session, while BigQuery preserves the value attached to each event. The Server-side Client Tag can add or override these parameters. See [Parameter hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy).

> [!WARNING]
> Custom session parameters increase the size of the Firestore user document. See [Firestore 1 MiB document limit](https://github.com/nameless-analytics/nameless-analytics/blob/main/setup-guides/TROUBLESHOOTING-GUIDE.md#firestore-1-mib-document-limit).

<details><summary>Reserved session parameters</summary>

These session parameters are reserved and can't be modified:
- session_date
- session_id
- user_id
- session_number
- cross_domain_session
- session_channel_grouping
- session_source
- session_tld_source
- session_campaign
- session_campaign_id
- session_campaign_click_id
- session_campaign_term
- session_campaign_content
- session_device_type
- session_country
- session_city
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

</details>

#### Add User ID
Set the optional `user_id` associated with the session. A value provided by the Server-side Client Tag takes precedence. The `login` and `logout` events manage this value separately; see [User ID lifecycle](https://github.com/nameless-analytics/nameless-analytics/#user-id-lifecycle).

#### Add session level parameters
Add custom fields shared by all events in the session. A matching parameter configured in the Server-side Client Tag replaces the value set here.



## Page data
### Page parameters
Page parameters describe the current page and are added to `page_data` on every event. Read [How to track page views](https://github.com/nameless-analytics/nameless-analytics/tree/main/setup-guides/SETUP-GUIDES.md#how-to-track-page-views) for the required `page_view` setup.

<details><summary>Reserved page parameters</summary>

These page parameters are reserved: they cannot be used as custom parameter names in [Add page level parameters](#add-page-level-parameters).

Six of them can still be replaced through the dedicated [Override default page parameters](#override-default-page-parameters) fields:
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

</details>

#### Override default page parameters
Enable this option when a virtual `page_view` needs values different from the current browser location, for example when it is triggered by a custom `dataLayer` event. **Page title**, **Page url** and **Page path** are required when the override is enabled; the remaining fields are optional.

| Field | Default browser value |
|:---|:---|
| **Page title** | `document.title` |
| **Page url** | Current complete URL |
| **Page path** | Current URL path |
| **Page fragment** | Current URL fragment |
| **Page query** | Current URL query string |
| **Page extension** | Extension derived from the current URL path |

For history-based SPA navigation, the tracker reads the updated browser values automatically when the `page_view` fires. Use overrides only when those values do not describe the virtual page correctly.

#### Add page level parameters
Add or override custom fields for the current page. Accepted values are strings, integers, floats, booleans and JSON-compatible values. They remain in the page context and are sent with the current and following events on that page; other tags cannot override them.

`page_category` is an optional custom field used to group pages. The reporting functions expose it as `page_category`, `session_landing_page_category` and `session_exit_page_category`.

#### Add page status code
Before each `page_view`, perform a `HEAD` request to the current URL and add its HTTP response code as `page_status_code`. Enable this only when the additional network request is useful for your reporting.



## Event data
### Shared event parameters
Shared event parameters are added to `event_data` by every Client-side Tracker Tag that uses this Configuration Variable. Accepted values are strings, integers, floats, booleans and JSON-compatible values.

The browser builds custom event parameters in this order:

1. parameters copied from the triggering `dataLayer` event;
2. shared parameters from this Configuration Variable;
3. parameters added, overridden or removed in the Client-side Tracker Tag.

After the request reaches the server, the Server-side Client Tag can add, override or remove custom parameters again. See [Parameter hierarchy](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy).

<details><summary>Reserved event parameters</summary>

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

</details>

#### Add shared event level parameters
Add custom fields shared by all events. A matching field in the Client-side Tracker Tag replaces the value set here before the request is sent.



## Server-side endpoint settings
### Endpoint domain name
Enter the bare domain of the server-side GTM container running the Nameless Analytics Server-side Client Tag. Do not include the protocol, path or trailing slash; HTTPS is used automatically.

For cross-domain tracking between unrelated root domains, provide a first-party endpoint for each website, usually through a GTM variable. Sites that share the same root domain can use one endpoint. See [Cross-domain architecture](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture).

### Endpoint path
Enter the request path beginning with `/` and without a trailing slash. It must exactly match the [Endpoint path](https://github.com/nameless-analytics/server-side-client-tag/#endpoint-path) in the Server-side Client Tag and remain the same across all tracked domains.



## Advanced settings
### Respect Google Consent Mode
**Enabled by default.** The tracker uses the current `analytics_storage` state:

- `granted`: events are sent normally;
- `denied`: tags remain pending until consent becomes granted, while the initial acquisition context is temporarily preserved;
- Consent Mode unavailable: events are not sent.

Disable this option only when collection must run independently of Google Consent Mode. Events are then sent regardless of its presence or state. See [Smart Consent Management](https://github.com/nameless-analytics/nameless-analytics/#smart-consent-management).

### Override default acquisition parameters
Change the URL query parameter names used to populate acquisition fields. The defaults are:

| Event parameter | URL query parameter |
|:---|:---|
| `source` | `utm_source` |
| `campaign` | `utm_campaign` |
| `campaign_id` | `utm_id` |
| `campaign_click_id` | `utm_click_id` |
| `campaign_term` | `utm_term` |
| `campaign_content` | `utm_content` |

When the configured click ID is absent, the tracker checks these platform identifiers in order: `gclid`, `dclid`, `gclsrc`, `wbraid`, `gbraid`, `msclkid`, `fbclid`, `ttclid`, `twclid`, `epik`, `li_fat_id`, `scclid`.

### Enable cross-domain tracking
Enable session continuity across the domains listed under **Cross-domain domains**. Enter bare domains without protocol, path or trailing slash.

On a standard left-click to a configured destination, the tracker requests the active identity from the server and decorates the link with `na_id`. The destination accepts a valid value only on the first `page_view` of the page and within five minutes of decoration. Invalid or expired values are ignored.

If a destination is reached without `na_id`, it continues with its local Nameless Analytics cookies when available; otherwise it creates a new user and session. See [Cross-domain architecture](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture) and [Cross-domain troubleshooting](https://github.com/nameless-analytics/nameless-analytics/blob/main/setup-guides/TROUBLESHOOTING-GUIDE.md#cross-domain-decoration).

### Load JavaScript libraries in first-party mode
Load the tracker libraries from your website or CDN instead of their default location. Host both required files in the configured directory and add the domain and path to the template permission list.

![Add library permissions](https://github.com/user-attachments/assets/660b41a8-9f3c-45cb-89c1-264d0f69e889)

#### Custom library domain name
Enter the bare domain that serves the libraries, without protocol, path or trailing slash.

#### Custom library path
Enter the directory containing the library files. The path must begin with `/` and must not end with `/`; do not include an individual filename.

### Add current dataLayer state
Add all `dataLayer` entries up to the current event to the top-level `datalayer` field of every payload.

This can make requests exceed the browser's 64 KiB `keepalive` limit, especially with large ecommerce arrays. Enable it only when the complete state is needed; otherwise send the required fields as event parameters. See [Request never sent](https://github.com/nameless-analytics/nameless-analytics/blob/main/setup-guides/TROUBLESHOOTING-GUIDE.md#request-never-sent).

### Enable logs in JavaScript console
Enable browser-console logs for every event. **Enabled by default.** A Client-side Tracker Tag can disable them for one event without changing the shared setting.

#### Debug mode only
Restrict logs to GTM Preview so normal visitors do not see them. **Enabled by default.** Disable it temporarily only when debugging outside Preview.



## Verifying the setup
Select this Configuration Variable in a `page_view` Client-side Tracker Tag, enable logs, open GTM Preview and reload the page. `page_view` must be the first Nameless Analytics event on every physical page load.

| Check | Expected result |
|:---|:---|
| Configuration | The values under `TRACKER TAG CONFIGURATION` match the variable, including endpoint and enabled options. |
| Parameters | Custom user, session, page and shared event fields appear in the corresponding payload objects. |
| Consent | When Consent Mode is respected, `analytics_storage` is granted before the request is sent. |
| Request | The Network panel shows a `POST` request to the configured domain and path with HTTP `200`. |
| Processing | `claim_request`, `firestore` and `bigquery` are `success`; `custom_endpoint` is `success` or `skipped`. |
| Final status | The console ends with `🟢 Request processed successfully`. |

When an optional feature is enabled, also verify its direct effect: first-party library URLs, `page_status_code`, cross-domain link decoration or the `datalayer` payload field.

If a stage is missing, a status is not successful or the request is not sent, use the [Troubleshooting Guide](https://github.com/nameless-analytics/nameless-analytics/blob/main/setup-guides/TROUBLESHOOTING-GUIDE.md).

#

[Website](https://namelessanalytics.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics_client_side_tracker_configuration_variable_readme) | [Twitter](https://x.com/nmlssanalytics) | [LinkedIn](https://www.linkedin.com/company/nameless-analytics/)
