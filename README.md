# Nameless Analytics | Client-side Tracker Configuration Variable

The Nameless Analytics Client-side Tracker Configuration Variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side Tracker Tag](https://github.com/nameless-analytics/client-side-tracker-tag/). 

For an overview of how Nameless Analytics works [start from here](https://github.com/nameless-analytics/nameless-analytics/#high-level-data-flow).

🚧 **Nameless Analytics is currently in beta and is subject to change.** 🚧



## Table of Contents
- [Nameless Analytics Client-side Tracker Configuration Variable UI](#client-side-tracker-configuration-variable-ui)
- [User data](#user-data)
  - [User parameters](#user-parameters)
    - [Add user level parameters](#add-user-level-parameters)
- [Session data](#session-data)
  - [Session parameters](#session-parameters)
    - [Add User ID](#add-user-id)
    - [Add session level parameters](#add-session-level-parameters)
- [Page data](#page-data)
  - [Page parameters](#page-parameters)
    - [Add page status code](#add-page-status-code)
    - [Override default page parameters](#override-default-page-parameters)
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
The Nameless Analytics Client-side Tracker Configuration Variable acts as the central intelligence hub for your entire tracking setup. 

It unifies global settings like user identity, cross-domain logic, and consent management, ensuring consistent data governance across all your tags.

This is the UI of the Nameless Analytics Client-side Tracker Configuration Variable.

![Nameless Analytics Client-side Tracker Configuration Variable UI](https://github.com/user-attachments/assets/0baea4b1-6cb2-4518-a742-0cd2c90db17e)



## User data
### User parameters
Add user parameters in the user_data object. See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.

They will be:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

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
- user_language  
- user_city
- user_country
- user_first_session_timestamp
- user_last_session_timestamp

#### Add user level parameters
Accepted values: strings, integers, floats, and JSON.

These parameters can be overridden by:
- user parameters added in Nameless Analytics Server-side Client Tag



## Session data
### Session parameters
Add session parameters in the session_data object. See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.

They will be:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

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
- session_landing_page_location 
- session_landing_page_title 
- session_exit_page_category 
- session_exit_page_location 
- session_exit_page_title 
- session_start_timestamp 
- session_end_timestamp
- total_events
- total_page_views

#### Add User ID
Add User ID parameter at session level. Accepted values: strings, integers, floats, and JSON. 

These parameters can be overridden by:
- user id parameter added in Nameless Analytics Server-side Client Tag

#### Add session level parameters
Add session level parameters. Accepted values: strings, integers, floats, and JSON.

These parameters can be overridden by:
- session parameters added in Nameless Analytics Server-side Client Tag



## Page data
### Page parameters
Add page parameters in the page_data object. Read how to track [page views](https://github.com/nameless-analytics/nameless-analytics/tree/main/setup-guides/SETUP-GUIDES.md#page-view) for more information.

#### Add page status code
Add page status code to the request in the page_data when a page_view happens. 

If enabled, the Nameless Analytics Client-side Tracker performs a silent HEAD request to the current URL to retrieve the HTTP status code (e.g. 200, 404, etc.), allowing you to monitor page errors directly in the reports.

#### Override default page parameters
If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document parameters.

- Page category: Add the `page_category` parameter to the request in `page_data`. This is an optional field to group pages into high-level categories.

- Page title: Add the `page_title` parameter to the request in `page_data`.

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document title.

  If virtual page view is triggered by a GTM history change trigger (pushState or replaceState), the page title will be taken from the `document.title` property.  

- Page location: Add the `page_location` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document location.

  If virtual page view is triggered by pushState or replaceState, the page location will be taken from the `document.location` property. 

- Page fragment: Add the `page_fragment` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document fragment.

  If virtual page view is triggered by pushState or replaceState, the page fragment will be taken from the `document.location.hash` property. 

- Page query: Add the `page_query` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document query.

  If virtual page view is triggered by pushState or replaceState, the page query will be taken from the `document.location.search` property. 

- Page extension: Add the `page_extension` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document extension.

  If virtual page view is triggered by pushState or replaceState, the page extension will be taken from the `document.location.pathname` property. 

- Page query: Add the `page_query` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document query.

  If virtual page view is triggered by pushState or replaceState, the page query will be taken from the `document.location.search` property. 

- Page extension: Add the `page_extension` parameter to the request in `page_data`. 

  If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document extension.

  If virtual page view is triggered by pushState or replaceState, the page extension will be taken from the `document.location.pathname` property. 



## Event data
### Shared event parameters
Add shared event parameters in the event_data object. See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.

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

#### Add shared event level parameters
Add shared event parameters for every event. Accepted values: strings, integers, floats, and JSON.

These parameters can override:
- dataLayer event parameters added in Nameless Analytics Client-side Tracker Tag
- Default event parameters

These parameters can be overridden by:
- Event parameters added in Nameless Analytics Server-side Client Tag
- Event parameters added in Nameless Analytics Client-side Tracker Tag



## Server-side endpoint settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

#### Endpoint requirements for Cross-domain
When tracking multiple domains, the Server-side GTM endpoint configuration becomes critical due to how browsers handle the `Set-Cookie` header:

* **Static Endpoint**: If all domains are subdomains of the same root (e.g., `a.site.com` and `b.site.com`), a single static endpoint (e.g., `gtm.site.com`) works.
* **Dynamic Endpoints**: If domains are completely different (e.g., `domain-a.com` and `domain-b.com`), the requests must be sent to a first-party subdomain of the *current* page (e.g., `gtm.domain-a.com` on site A and `gtm.domain-b.com` on site B). This ensures that the `Domain` attribute in the `Set-Cookie` header matches the request origin, allowing the browser to accept the cookie. Otherwise, cookies will be rejected by the browser due to cross-site security policies. See the [Cross-domain domains](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-domains) section for more information.


### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

#### Endpoint path requirements for Cross-domain
The endpoint path must be the same for all domains.



## Advanced settings
### Respect Google Consent Mode
When Google Consent Mode is present on website and Respect Google Consent Mode is enabled, the events are sent only if a user consents. When:

- `analytics_storage` is equal to `denied`, the Nameless Analytics Client-side Tracker waits until consent is granted
- `analytics_storage` changes from `denied` to `granted`, all pending tags for that page will be fired in execution order

When Google Consent Mode is not present on website and Respect Google Consent Mode is enabled, none of the events are sent.
  
When Google Consent Mode is present on website and Respect Google Consent Mode is disabled, all events are sent regardless of user consents.


### Override default acquisition parameters
Override the default URL query parameter names used as acquisition parameters. By default these values are taken from standard UTM parameters.

Default values: 
- source = utm_source
- campaign = utm_campaign
- campaign_id = utm_id
- campaign_click_id = utm_click_id
- campaign_term = utm_term
- campaign_content = utm_content

If `utm_click_id` is missing, the Nameless Analytics Client-side Tracker tag attempts to populate `campaign_click_id` using the following URL query parameters in order of priority. If none of these parameters are present, `campaign_click_id` will be null:
- For Google Ads: gclid or dclid or gclsrc or wbraid or gbraid
- For Bing: msclkid
- For Facebook: fbclid
- For TikTok: ttclid
- For X: twclid
- For Pinterest: epik
- For Linkedin: li_fat_id
- For SnapChat: scclid

<details><summary>See channel grouping rules</summary>

</br>

The following table describes how the channel is determined based on the source and campaign parameters. 

| Source category | Campaign | Channel grouping |
| :--- | :--- | :--- |
| **Internal traffic** | Yes | `internal_traffic` |
| **Direct** | Yes | `direct` |
| **GTM Debugger** | Yes | `gtm_debugger` |
| **Search Engine** | Yes | `paid_search_engine` |
| **Search Engine** | No | `organic_search_engine` |
| **Social** | Yes | `paid_social` |
| **Social** | No | `organic_social` |
| **Shopping** | Yes | `paid_shopping` |
| **Shopping** | No | `organic_shopping` |
| **Video** | Yes | `paid_video` |
| **Video** | No | `organic_video` |
| **AI** | Yes | `ai` |
| **Email** | Yes | `email` |
| None of the above | No | `referral` |
| None of the above | Yes | `affiliate` |

The channel grouping logic uses the following Source Categories based on the source name:

| Source category | Source |
| :--- | :--- |
| **Internal traffic** | `null` |
| **Direct** | `direct` |
| **GTM Debugger** | `tagassistant.google.com` |
| **Search Engine** | `360.cn`, `alice`, `aol`, `yahoo`, `ask`, `bing`, `google`, `yandex`, `baidu`, `ecosia`, `duckduckgo`, `sogou`, `naver`, `seznam` |
| **Social** | `facebook`, `twitter`, `instagram`, `pinterest`, `linkedin`, `reddit`, `vk.com`, `tiktok`, `snapchat`, `tumblr`, `wechat`, `whatsapp` |
| **Shopping** | `amazon`, `ebay`, `etsy`, `shopify`, `stripe`, `walmart`, `mercadolibre`, `alibaba`, `naver.shopping` |
| **Video** | `youtube`, `vimeo`, `netflix`, `twitch`, `dailymotion`, `hulu`, `disneyplus`, `wistia`, `youku` |
| **AI** | `chatgpt`, `gemini`, `bard`, `claude`, `alexa`, `siri`, `assistant`, `ai` |
| **Email** | `email`, `e-mail`, `newsletter`, `mailchimp`, `sendgrid`, `sparkpost` |

</details>


### Enable cross-domain tracking
Enables the transfer of `client_id` and `session_id` data across two or more websites via a URL GET parameter. This allows Nameless Analytics tags to merge individual sessions into a single session that would otherwise be created when visiting other domains.

For an in-depth explanation of why this is required and how the handshake protocol works, see the [Cross-domain Architecture documentation](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture).


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

---

Reach me at: [Email](mailto:hello@namelessanalytics.com) | [Website](https://namelessanalytics.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics_client_side_tracker_configuration_variable_readme) | [Twitter](https://x.com/nmlssanalytics) | [LinkedIn](https://www.linkedin.com/company/nameless-analytics/)
