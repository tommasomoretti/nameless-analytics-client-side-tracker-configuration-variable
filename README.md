# Nameless Analytics | Client-side Tracker Configuration Variable

The Nameless Analytics Client-side Tracker Configuration Variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side Tracker Tag](https://github.com/nameless-analytics/nameless-analytics-client-side-tracker-tag/). 

For an overview of how Nameless Analytics works [start from here](https://github.com/nameless-analytics/nameless-analytics/#high-level-data-flow).

🚧 **Nameless Analytics is currently in beta and is subject to change.** 🚧




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
    - [Page category](#page-category)
    - [Virtual page title](#virtual-page-title)
    - [Virtual page location](#virtual-page-location)
    - [Virtual page fragment](#virtual-page-fragment)
    - [Virtual page query](#virtual-page-query)
    - [Virtual page extension](#virtual-page-extension)
- [Event data](#event-data)
  - [Event parameters](#event-parameters)
    - [Add shared event level parameters](#add-shared-event-level-parameters)
- [Server-side endpoint settings](#server-side-endpoint-settings)
  - [Endpoint domain name](#endpoint-domain-name)
    - [Endpoint requirements for Cross-domain](#endpoint-requirements-for-cross-domain)
  - [Endpoint path](#endpoint-path)
    - [Endpoint path requirements for Cross-domain](#endpoint-path-requirements-for-cross-domain)
- [Page view settings](#page-view-settings)
  - [Add page status code](#add-page-status-code)
  - [Override default source and campaigns URL query parameters](#override-default-source-and-campaigns-url-query-parameters)
- [Advanced settings](#advanced-settings)
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Enable cross-domain tracking](#enable-cross-domain-tracking)
    - [Cross-domain domains](#cross-domain-domains)
  - [Load JavaScript libraries in first-party mode](#load-javascript-libraries-in-first-party-mode)
    - [Custom library domain name](#custom-library-domain-name)
    - [Custom library path](#custom-library-path)
  - [Add current dataLayer state](#add-current-datalayer-state)
  - [Enable logs in JavaScript console](#enable-logs-in-javascript-console)




## Nameless Analytics Client-side Tracker Configuration Variable UI
This is the UI of the Nameless Analytics Client-side Tracker Configuration Variable. 

This variable will handle settings like setting user and session parameters, page parameters, common event parameters, User ID parameter, set endpoint domain name and path, consent mode usage, cross-domain tracking, page settings, JavaScript libraries settings, add current dataLayer state and logging in JavaScript console.

![Nameless Analytics Client-side Tracker Configuration Variable UI](https://github.com/user-attachments/assets/0baea4b1-6cb2-4518-a742-0cd2c90db17e)




## User data
### User parameters
Add user parameters for all events. The parameters will be added in the user_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 


</br>

#### Add user level parameters
Accepted values: strings, integers, floats, and JSON.

These parameters can be overridden by:
- user parameters added in Nameless Analytics Server-side Client Tag




## Session data
### Session parameters
Add session parameters for all events. The parameters will be added in the session_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 


</br>

#### Add User ID
Accepted values: strings. 

These parameters can be overridden by:
- user id parameter added in Nameless Analytics Server-side Client Tag


</br>

#### Add session level parameters
Accepted values: strings, integers, floats, and JSON.

These parameters can be overridden by:
- session parameters added in Nameless Analytics Server-side Client Tag




## Page data
### Page parameters
Add page parameters for all events. The parameters will be added in the page_data object in the payload.


</br>

#### Page category
Add the `page_category` parameter to the request in `page_data`. This is an optional field to group pages into high-level categories.


</br>

#### Virtual page title
Add the `page_title` parameter to the request in `page_data`. 

If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document title.

If virtual page view is triggered by a GTM history change trigger (pushState or replaceState), the page title will be taken from the `document.title` property.  


</br>

#### Virtual page location
Add the `page_location` parameter to the request in `page_data`. 

If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document location.

If virtual page view is triggered by pushState or replaceState, the page location will be taken from the `document.location` property. 


</br>

#### Virtual page fragment
Add the `page_fragment` parameter to the request in `page_data`. 

If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document fragment.

If virtual page view is triggered by pushState or replaceState, the page fragment will be taken from the `document.location.hash` property. 


</br>

#### Virtual page query
Add the `page_query` parameter to the request in `page_data`. 

If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document query.

If virtual page view is triggered by pushState or replaceState, the page query will be taken from the `document.location.search` property. 


</br>

#### Virtual page extension
Add the `page_extension` parameter to the request in `page_data`. 

If virtual page view is triggered by a custom dataLayer event, use this field to override the default browser document extension.

If virtual page view is triggered by pushState or replaceState, the page extension will be taken from the `document.location.pathname` property. 




## Event data
### Event parameters
Add event parameters for all events. The parameters will be added in the event_data object in the payload.


</br>

#### Add shared event level parameters
Accepted values: strings, integers, floats, and JSON.

These parameters can override:
- dataLayer event parameters added in Nameless Analytics Client-side Tracker Tag
- Default event parameters

These parameters can be overridden by:
- Event parameters added in Nameless Analytics Server-side Client Tag
- Event parameters added in Nameless Analytics Client-side Tracker Tag




## Server-side endpoint settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

</br>

#### Endpoint requirements for Cross-domain
When tracking multiple domains, the Server-side GTM endpoint configuration becomes critical due to how browsers handle the `Set-Cookie` header:

* **Static Endpoint**: If all domains are subdomains of the same root (e.g., `a.site.com` and `b.site.com`), a single static endpoint (e.g., `gtm.site.com`) works.
* **Dynamic Endpoints**: If domains are completely different (e.g., `domain-a.com` and `domain-b.com`), the requests must be sent to a first-party subdomain of the *current* page (e.g., `gtm.domain-a.com` on site A and `gtm.domain-b.com` on site B). This ensures that the `Domain` attribute in the `Set-Cookie` header matches the request origin, allowing the browser to accept the cookie. Otherwise, cookies will be rejected by the browser due to cross-site security policies. See the [Cross-domain domains](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-domains) section for more information.


#

### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

</br>

#### Endpoint path requirements for Cross-domain
The endpoint path must be the same for all domains.




## Page view settings
### Add page status code
Add page status code to the request in the page_data when a page_view happens. If enabled, the Nameless Analytics Client-side Tracker performs a silent HEAD request to the current URL to retrieve the HTTP status code (e.g. 200, 404, 500), allowing you to monitor page errors directly in the reports.

Please note: This setting will be visible in the UI only when the event name is equal to page_view and this will not work for virtual_page_view.


#

### Override default source and campaigns URL query parameters
Override the default URL query parameter names used as source and campaign parameters. By default these values are taken from standard UTM parameters.

Default values: 
- source = utm_source
- campaign = utm_campaign
- campaign_id = utm_id
- campaign_click_id = utm_click_id
- campaign_term = utm_term
- campaign_content = utm_content

#


</br>

#### Channel grouping
The following table describes how the channel is determined based on the source and campaign parameters:

| Source category | Campaign | Channel grouping |
| :--- | :--- | :--- |
| **Internal traffic** | Qualsiasi | `internal_traffic` |
| **Direct** | Qualsiasi | `direct` |
| **GTM Debugger** | Qualsiasi | `gtm_debugger` |
| **Search Engine** | Presente | `paid_search_engine` |
| **Search Engine** | Assente | `organic_search_engine` |
| **Social** | Presente | `paid_social` |
| **Social** | Assente | `organic_social` |
| **Shopping** | Presente | `paid_shopping` |
| **Shopping** | Assente | `organic_shopping` |
| **Video** | Presente | `paid_video` |
| **Video** | Assente | `organic_video` |
| **AI** | Qualsiasi | `ai` |
| **Email** | Qualsiasi | `email` |
| Nessuna di quelle sopra | Assente | `referral` |
| Nessuna di quelle sopra | Presente | `affiliate` |

The channel grouping logic uses the following Source Categories based on the source name:

| Source category | Source name |
| :--- | :--- |
| **Internal traffic** | `null` |
| **Direct** | `direct` |
| **GTM Debugger** | `tagassistant.google.com` |
| **Search Engine** | `360.cn`, `alice`, `aol`, `yahoo`, `ask`, `bing`, `google`, `yandex`, `baidu`, `ecosia`, `duckduckgo`, `sogou`, `naver`, `seznam` |
| **Social** | `facebook`, `twitter`, `instagram`, `pinterest`, `linkedin`, `reddit`, `vk.com`, `tiktok`, `snapchat`, `tumblr`, `wechat`, `whatsapp` |
| **Shopping** | `amazon`, `ebay`, `etsy`, `shopify`, `stripe`, `walmart`, `mercadolibre`, `alibaba`, `naver.shopping` |
| **Video** | `youtube`, `vimeo`, `netflix`, `twitch`, `dailymotion`, `hulu`, `disneyplus`, `wistia`, `youku` |
| **AI** | `chatgpt`, `gemini`, `bard`, `claude`, `alexa`, `siri`, `assistant`, `.ai` |
| **Email** | `email`, `e-mail`, `newsletter`, `mailchimp`, `sendgrid`, `sparkpost` |




## Advanced settings
### Respect Google Consent Mode
When Google Consent Mode is present on website and Respect Google Consent Mode is enabled, the events are sent only if a user consents. When:

- `analytics_storage` is equal to `denied`, the Nameless Analytics Client-side Tracker waits until consent is granted. 
- `analytics_storage` changes from `denied` to `granted`, all pending tags for that page will be fired in execution order.
  
When Google Consent Mode is present on website and Respect Google Consent Mode is disabled, all events are sent regardless of user consents. 

When Google Consent Mode is not present on website and Respect Google Consent Mode is enabled, none of the events are sent. 


#

### Enable cross-domain tracking
Enables the transfer of `client_id` and `session_id` data across two or more websites via a URL GET parameter. This allows Nameless Analytics tags to merge individual sessions into a single session that would otherwise be created when visiting other domains.


</br>

#### Cross-domain domains
For an in-depth explanation of why this is required and how the handshake protocol works, see the [Cross-domain Architecture documentation](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture).

To implement this:
1. Enable cross-domain tracking in the variable.
2. Add the domains to the list (one per row).

    ![Lookup Table for dynamic endpoints](https://github.com/user-attachments/assets/c8ab4d08-5069-4833-8465-5ca4ddea0863)

3. Create a **Regex Lookup Table** variable to dynamically switch the endpoint domain based on the current page hostname:

    ![Lookup Table for dynamic endpoints](https://github.com/user-attachments/assets/a7b54f23-18b5-4e54-ba80-216a06a51f2d)

4. Set this dynamic variable in the **Request endpoint domain** field. 

    This ensures the `Domain` attribute in the `Set-Cookie` header will always match the request origin browser-side.

    ![Dynamic endpoint correct configuration](https://github.com/user-attachments/assets/10db0a72-c743-4504-b3aa-adcb487fb9ad)

    Otherwise the Set-Cookie header will be blocked by the browser.

    ![Dynamic endpoint configuration error](https://github.com/user-attachments/assets/66d39b81-6bf3-4af4-8663-273d00ae9515)

#

### Load JavaScript libraries in first-party mode
Override the default location of the main library. Load 


</br>

#### Custom library domain name


</br>

#### Custom library path


#

### Add current dataLayer state
Add the current state of the dataLayer in dataLayer field in the payload.  


#

### Enable logs in JavaScript console
Enable console log for all events in JavaScript console.


</br>

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [LinkedIn](https://www.linkedin.com/in/tommasomoretti/)