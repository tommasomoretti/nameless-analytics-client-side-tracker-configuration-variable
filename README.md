# Nameless Analytics | Client-side Tracker Configuration Variable

The Nameless Analytics Client-side Tracker Configuration Variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side Tracker Tag](https://github.com/nameless-analytics/nameless-analytics-client-side-tracker-tag/). 

For an overview of how Nameless Analytics works [start from here](https://github.com/nameless-analytics/nameless-analytics/).

Variable:
* [Nameless Analytics Client-side Tracker Configuration Variable UI](#nameless-analytics-client-side-tracker-configuration-variable-ui)

Data:
* User data
  * [User parameters](#user-parameters)
    * [Add user level parameters](#add-user-level-parameters)
* Session data
  * [Session parameters](#session-parameters) 
    * [Add User ID](#add-user-id)
    * [Add session level parameters](#add-session-level-parameters)
* Page data
  * [Page parameters](#page-parameters)
    * [Page category](#page-category)
    * [Page title](#page-title)
    * [Page location](#page-location)
    * [Page fragment](#page-fragment)
    * [Page query](#page-query)
    * [Page extension](#page-extension)
* Event data
  * [Event parameters](#event-parameters)
    * [Add shared event parameters](#add-shared-event-parameters)

Settings:
* Server-side endpoint settings
  * [Endpoint domain name](#endpoint-domain-name)
  * [Endpoint path](#endpoint-path)
* Page view settings
  * [Add page status code](#add-page-status-code) 
  * [Override default source and campaigns URL query parameters](#override-default-source-and-campaigns-url-query-parameters)
  * [Override default JavaScript page view event names](#override-default-javascript-page-view-event-names)
  * [Override default JavaScript virtual page view event names](#override-default-javascript-virtual-page-view-event-names)
* Advanced settings
  * [Respect Google Consent Mode](#respect-google-consent-mode)
  * [Enable cross-domain tracking](#enable-cross-domain-tracking)
  * [Load JavaScript libraries in first-party mode](#load-javascript-libraries-in-first-party-mode)
  * [Add current dataLayer state](#add-current-datalayer-state)
  * [Enable logs in JavaScript console](#enable-logs-in-javascript-console)

</br></br>



## Nameless Analytics Client-side Tracker Configuration Variable UI
This is the UI of the Nameless Analytics Client-side Tracker Configuration Variable. This variable will handle settings like setting user and session parameters, common event parameters, User ID parameter, user consent mode, cross-domain tracking, logging in JavaScript console and more.

<img src="https://github.com/user-attachments/assets/16bd7112-e605-40cb-ba18-797bdb3e3d08" alt="Nameless Analytics Client-side Tracker Configuration Variable UI" />

</br></br>



## User data
### User parameters

Add user parameters for all events. The parameters will be added in the user_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

This is the hierarchy of parameter importance: 

See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.


#### Add user level parameters

Add user level parameters to the `user_data` object in the payload. Accepted values: strings, integers, floats, and JSON.

The User ID parameter is optional and set at session level.

These parameters can be overridden by adding [user parameters](https://github.com/nameless-analytics/nameless-analytics-server-side-client-tag/#user-parameters) in the Nameless Analytics Server-side Client Tag.

</br></br>



## Session data
### Session parameters

Add session parameters for all events. The parameters will be added in the session_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

This is the hierarchy of parameter importance: 

See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.

#### Add User ID

Add User ID parameter in the session_data object in the payload. 

This parameter can be overridden modifying the [User ID parameter](https://github.com/nameless-analytics/nameless-analytics-server-side-client-tag/#addoverride-user-id-parameter) in Nameless Analytics Server-side Client Tag.

#### Add session level parameters

Add session level parameters in the session_data object in the payload. Accepted values: strings, integers, floats, and JSON.

These parameters can be overridden by adding [session parameters](https://github.com/nameless-analytics/nameless-analytics-server-side-client-tag/#session-parameters) in the Nameless Analytics Server-side Client Tag.

</br></br>



## Page data
### Page parameters

#### Page category
Add the `page_category` parameter to the request in `page_data`. This is an optional field to group pages into high-level categories.

#### Page title
Add the `page_title` parameter to the request in `page_data`. This field is often used for virtual page views or to override the default browser document title.

#### Page location
Add the `page_location` parameter to the request in `page_data`. Usually contains the full URL or specific path of the page being tracked.

#### Page fragment
Add the `page_fragment` parameter to the request in `page_data`. Useful for tracking specific sections in Single Page Applications (SPAs) that use hash fragments.

#### Page query
Add the `page_query` parameter to the request in `page_data`. Contains the query string parts of the URL (parameters after the `?`).

#### Page extension
Add the `page_extension` parameter to the request in `page_data`. Typically used to identify the file format of the page (e.g., `.html`, `.php`).

</br></br>



## Event data
### Event parameters

Add event parameters for all events. The parameters will be added in the event_data object in the payload.

This is the hierarchy of parameter importance: 

See [Parameter Hierarchy & Overriding](https://github.com/nameless-analytics/nameless-analytics/#parameter-hierarchy--overriding) in the main project documentation.

#### Add shared event parameters

Add shared event parameters to the `event_data` object in the payload. Accepted values: strings, integers, floats, and JSON.

These parameters can override:
- default event parameters
- dataLayer event parameters added in Nameless Analytics Client-side Tracker Tag

These parameters can be overridden by:
- event parameters added in Nameless Analytics Client-side Tracker Tag
- event parameters added in Nameless Analytics Server-side Client Tag

</br></br>



## Server-side endpoint settings
### Endpoint domain name

The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

#### Endpoint requirements for Cross-domain
When tracking multiple domains, the Server-side GTM endpoint configuration becomes critical due to how browsers handle the `Set-Cookie` header:

*   **Static Endpoint**: If all domains are subdomains of the same root (e.g., `a.site.com` and `b.site.com`), a single static endpoint (e.g., `gtm.site.com`) works.
*   **Dynamic Endpoints**: If domains are completely different (e.g., `domain-a.com` and `domain-b.com`), the requests **must** be sent to a first-party subdomain of the *current* page (e.g., `gtm.domain-a.com` on site A and `gtm.domain-b.com` on site B). This ensures that the `Domain` attribute in the `Set-Cookie` header matches the request origin, allowing the browser to accept the cookie.

Failure to use dynamic endpoints in a multi-domain setup will result in cookies being rejected by the browser due to cross-site security policies.


### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

#### Endpoint path requirements for Cross-domain
The endpoint path must be the same for all domains.

</br></br>



## Page view settings
### Add page status code

Add page status code to the request in the event_data when a page_view happens. If enabled, the tracker performs a silent HEAD request to the current URL to retrieve the HTTP status code (e.g. 200, 404, 500), allowing you to monitor page errors directly in the reports.

Please note: This setting will be visible in the UI only when the event name is equal to page_view and this will not work for virtual_page_view.


### Override default source and campaigns URL query parameters

Override the default URL query parameter names used as source and campaign parameters. By default, these values are taken from standard UTM parameters.


### Override default JavaScript page view event names

Override the default JavaScript event name for page views. Update this value if the Nameless Analytics Client-side Tracker Tag is triggered by a JavaScript event name that differs from `gtm.js`.

Please note: When an event is fired, the Nameless Analytics Client-side Tracker Tag checks if the JavaScript event that triggered the tag is the one specified in this setting. If it is, the tag generates a new `page_id` value. For this reason, the `page_view` event must be the first event on a page. Any event sent on a page prior to the first `page_view` event will be ignored because it lacks a `page_id`.

### Override default JavaScript virtual page view event names

Override the default JavaScript event name for virtual page views. Update this value if the Nameless Analytics Client-side Tracker Tag is triggered by a JavaScript event name that differs from `gtm.historyChange`.

Please note: Similar to standard page views, if the JavaScript event matches this setting, the tag generates a new `page_id`. 

</br></br>



## Advanced settings
### Respect Google Consent Mode

When Google Consent Mode is present on website and `respect_consent_mode` is enabled, the events are sent only if a user consents:
- When  `analytics_storage` is equal to `denied`, the tag waits until consent is granted. 
- When `analytics_storage` changes from `denied` to `granted`, all pending tags for that page will be fired in execution order.
  
When Google Consent Mode is present on website and `respect_consent_mode` is disabled, all events are sent regardless of user consents. 

When Google Consent Mode is not present on website and `respect_consent_mode` is enabled, none of the events are sent. 

### Enable cross-domain tracking

Enables the transfer of `client_id` and `session_id` data across two or more websites via a URL GET parameter. This allows Nameless Analytics tags to merge individual sessions into a single session that would otherwise be created when visiting other domains.

#### Cross-domain domains
Since domains are completely different (e.g., `domain-a.com` and `domain-b.com`), the requests must be sent to a first-party subdomain for each site. For an in-depth explanation of why this is required and how the handshake protocol works, see the [Cross-domain Architecture documentation](https://github.com/nameless-analytics/nameless-analytics/#cross-domain-architecture).

To implement this:
1. Enable cross-domain tracking in the variable.
2. Add the domains to the list (one per row).
3. If necessary, create a **Regex Lookup Table** in GTM to dynamically switch the endpoint domain based on the current page hostname:

<img src="https://github.com/user-attachments/assets/a7b54f23-18b5-4e54-ba80-216a06a51f2d" alt="Lookup Table for dynamic endpoints" />

4. Set this dynamic variable in the **Request endpoint domain** field. This ensures the `Domain` attribute in the `Set-Cookie` header will always match the request origin browser-side.

<img src="https://github.com/user-attachments/assets/62d45b14-a326-427c-9eb1-ad583610204b" alt="Dynamic endpoint configuration" />


### Load JavaScript libraries in first-party mode

Override the default location of the main library. 


### Add current dataLayer state

Add the current state of the dataLayer in dataLayer field in the payload.  


### Enable logs in JavaScript console

Enable console log for all events in JavaScript console.

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [LinkedIn](https://www.linkedin.com/in/tommasomoretti/)
