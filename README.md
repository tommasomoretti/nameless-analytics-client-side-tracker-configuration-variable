<img src="https://github.com/user-attachments/assets/93640f49-d8fb-45cf-925e-6b7075f83927#gh-light-mode-only" alt="Light Mode" />
<img src="https://github.com/user-attachments/assets/71380a65-3419-41f4-ba29-2b74c7e6a66b#gh-dark-mode-only" alt="Dark Mode" />

---

# Client-side configuration variable
The Nameless Analytics Client-side configuration variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side tracker tag](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/). 

For an overview of how Nameless Analytics works [start from here](https://github.com/tommasomoretti/nameless-analytics/).

Table of contents:
- [Client-side configuration variable UI](#variable-ui)
- Basic settings
  - [Endpoint domain name](#endpoint-domain-name)
  - [Endpoint path](#endpoint-path)
- User data
  - [User parameters](#user-parameters)
    - [Add User ID](#add-user-id)
    - [Add user level parameters](#add-user-level-parameters)
- Session data
  - [Session parameters](#session-parameters) 
    - [Add session level parameters](#add-session-level-parameters)
- Event data
  - [Event parameters](#event-parameters)
    - [Add shared event parameters](#add-shared-event-parameters)
- Advanced settings
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Enable cross-domain tracking](#enable-cross-domain-tracking)
  - [Customize source and campaigns url parameters](#customize-source-and-campaigns-url-parameters)
  - [Change default JavaScript page view event names](#change-default-JavaScript-page-view-event-names)
  - [Load main library from custom location](#load-main-library-from-custom-location)
  - [Add current dataLayer state](#add-current-dataLayer-state)
  - [Enable logs in JavaScript console](#enable-logs-in-JavaScript-console)



# Variable UI
This is the UI of the Client-side configuration variable. This variable will handle settings like sets user and session parameters, common event parameters, user ID, user consent mode, cross-domain tracking, logging in JavaScript console and more.

![Nameless Analytics - Client-side configuration variable UI](https://github.com/user-attachments/assets/259caf1b-bd89-487c-855a-f10f26902812)



# Basic settings
## Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

Example: gtm.domain.com


## Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

Example: /nameless_analytics/endpoint



# User data
## User parameters
Add user parameters for all events. The parameters will be added in the user_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

Please note: if a parameter has the same name as another, it can override or be overridden depending on where it was set. 

This is the hierarchy of event parameter importance: 

[Server-side user parameters](https://github.com/tommasomoretti/nameless-analytics-server-client-tracker-tag/#user-parameters) overrides [User parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-config-variable/#user-parameters)

### Add User ID
Add User ID parameters in user_id field. 

This parameter can be overridden modifying [the users ID](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#modify-user-id-parameter) in Nameless Analytics Server-Side client tag.

### Add user level parameters
Add user level parameters in user_data object in the payload. Values accepted: strings, integers, float and json.

These parameter can be overridden adding [user parameters](https://github.com/tommasomoretti/nameless-analytics-server-client-tracker-tag/#user-parameters) in Nameless Analytics Server-side client tag.



# Session data
## Session parameters
Add session parameters for all events. The parameters will be added in the session_data object in the payload.

They are:
- written in Google Cloud Firestore every time they change --> latest values 
- read and sent to BigQuery with the current parameter status --> current values 

Please note: if a parameter has the same name as another, it can override or be overridden depending on where it was set. 

This is the hierarchy of event parameter importance: 

[Server-side session parameters](https://github.com/tommasomoretti/nameless-analytics-server-client-tracker-tag/#session-parameters) overrides [Session parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-config-variable/#session-parameters)

### Add session level parameters
Add session level parameters in session_data object in the payload. Values accepted: strings, integers, float and json.

These parameter can be overridden adding [session parameters](https://github.com/tommasomoretti/nameless-analytics-server-client-tracker-tag/#session-parameters) in Nameless Analytics Server-side client tag.



# Event data
## Event parameters
Add event parameters for all events. The parameters will be added in the event_data object in the payload.

Please note: if a parameter has the same name as another, it can override or be overridden depending on where it was set. 

This is the hierarchy of event parameter importance: 

[Server-side event parameters](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#event-parameters) overrides [Specific event parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/#event-parameters) overrides [Shared event parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-config-variable/#add-shared-event-parameters) overrides [dataLayer parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/#add-event-parameters-from-datalayer) overrides [Standard parameters](#standard-request-payload)

### Add shared event parameters
Add shared event parameters in event_data object in the payload. Values accepted: strings, integers, float and json.

These parameters can override:
- default event parameters
- dataLayer event parameters added in Nameless Analytics Client-side tracker tag

These parameters can be overridden by:
- event parameters added in Nameless Analytics Client-side tracker tag
- event parameters added in Nameless Analytics Server-side client tag



# Advanced settings
## Respect Google Consent Mode
When Google Consent Mode is present on website and respect_consent_mode is enabled, the events are sent only if a user consents.
- When analytics_storage is equal to denied, the tag waits until consent is granted. 
- When analytics_storage changes from denied to granted, all pending tags for that page will be fired in execution order.
- When analytics_storage is equal to granted, the tag sends the hits to the server-side Google Tag Manager endpoint without temp_client_id and temp_session_id.
  
When Google Consent Mode is not present on website or Google Consent Mode is present on website and respect_consent_mode is disabled, all events are sent regardless user consents. 


## Enable cross-domain tracking
Enables the transfer of client_id and session_id data across two or more websites via URL GET parameter. This allows Nameless Analytics tags to merge into a single session the individual sessions that would otherwise be created when visiting another domains.

Please note: the server-side GTM container must olso be configured correctly to make cross-domain tracking works. Read the relative [documentation](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#cross-domain).

Enable cross domain tracking and add the domains one for row.

<img width="1265" alt="Screenshot 2025-07-03 alle 18 39 25" src="https://github.com/user-attachments/assets/274c4dce-719e-4d79-bfbe-88e6c31d5f5c" />

### If the domains do not share the same Nameless Analytics Server-side client tag
With this configuration the endpoint domain can be static as [described here](#endpoint-domain-name).

### If multiple domains share the same Nameless Analytics Server-side client tag 
With this configuration the endpoint domain must be dynamic.

This is necessary because when the Nameless Analytics Server-side client tag claims a request, it responds with a Set-Cookie header that includes the Domain attribute. 
To correctly set the Nameless Analytics cookies, the Domain attribute must match the domain or be a subdomain of the webpage’s domain that has sent the request.

Therefore:
- Requests originating from domain_1.com must be sent to gtm.domain_1.com
- Requests originating from domain_2.com must be sent to gtm.domain_2.com

Otherwise the Set-Cookie header will not work:

<img width="1265" alt="Screenshot 2025-07-03 alle 18 55 52" src="https://github.com/user-attachments/assets/62d45b14-a326-427c-9eb1-ad583610204b" />

To save cookie correctly, create a regex lookup table to send requests to different domains endpoint. With this configuration the Domain attribute in the Set-Cookie header will match the request origin. 

<img width="1265" alt="Screenshot 2025-06-11 alle 11 22 04" src="https://github.com/user-attachments/assets/a7b54f23-18b5-4e54-ba80-216a06a51f2d">

### How cross-domain tracking works
Cross-domain functionality depends of [how Respect Google Consent Mode is set](#respect-google-consent-mode).

If enable_cross_domain_tracking option is enabled, the Nameless Analytics Client-side tracker tag will set a JavaScript event listener on every link click.

When a user clicks on a cross-domain link, the event listener sends a get_user_data request to the Nameless Analytics Server-Side client tag to retrieve cookies value since they are not accessible from the browser ([they are HttpOnly](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#cookies)). The Nameless Analytics Server-Side client tag responds with the cookie values and the JavaScript event listener decorates the URL with a parameter named na_id with the current session_id.

After that, the user is redirected to the destination website. 

When the user lands on the destination website and a page_view event is triggered, the Nameless Analytics Client-Side tracker tag checks if there is a na_id parameter in the URL. If it is present, the hit will contain a cross_domain_id parameter.

The Nameless Analytics Server-Side client tag will add it to the request and set back the cookies with those values. 

If enable_cross_domain_tracking option is disabled or respect_consent_mode is true and analytics_storage is denied, the Nameless Analytics Client-side tracker tag will not set any listener or will not send any hit if the consent was change from granted to denied.


## Customize source and campaigns url parameters
Override the default URL query parameter names used as source and campaign parameters. By default, these values are taken from standard UTM parameters.


## Change default JavaScript page view event names
Override the default JavaScript event names for page_view and virtual_page_view. Update these values if the Nameless Analytics Client-side Tracker Tag is triggered by a JavaScript event name that differs from gtm.js (for page views) or gtm.historyChange (for virtual page views).

Please note: When an event is fired, the Nameless Analytics Client-side tracker tag checks if the JavaScript event that triggered the tag is gtm.js or gtm.historyChange. If it is, the tag generates a new page_id value. For this reason, the page_view event must be the first event on a page. Any event sent on a page prior to the first page_view event will be ignored because it lacks a page_id.


## Load main library from custom location
Override the default location of the main library. 


## Add current dataLayer state
Add the current state of the dataLayer in dataLayer field in the payload.  


## Enable logs in JavaScript console
Enable console log for all events in JavaScript console.

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [Linkedin](https://www.linkedin.com/in/tommasomoretti/)
