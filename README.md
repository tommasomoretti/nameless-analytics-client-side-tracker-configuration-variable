![Na logo beta](https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7d4ded5e-4b79-46a2-b089-03997724fd10)

---

# Client-side configuration variable
The Nameless Analytics Client-side configuration variable is a highly customizable GTM custom variable template designed to configure the settings of [Nameless Analytics Client-side tracker tag](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag). 

For an overview of how Nameless Analytics works [start from here](https://github.com/tommasomoretti/nameless-analytics).

Start from here:
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
    - [Add current dataLayer state](#add–current-dataLayer-state)
    - [Add page status code](#add-page-status-code)
- Advanced settings
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Enable cross domain tracking](#enable-cross-domain-tracking)
  - [Customize source and campaigns url parameters](#customize-source-and-campaigns-url-parameters)
  - [Change default JavaScript page view event names](#change-default-JavaScript-page-view-event-names)
  - [Load main library from custom location](#load-main-library-from-custom-location)
  - [Enable logs in JavaScript console](#enable-logs-in-JavaScript-console)



## Variable UI
This is the UI of the Client-side configuration variable. This variable will handle settings like sets user and session parameters, common event parameters, user ID, user consent mode, cross-domain tracking, logging in JavaScript console and more.

<img width="1265" alt="Screenshot 2025-06-03 alle 15 43 28" src="https://github.com/user-attachments/assets/e79fbc8e-41b5-45b1-b068-2a0cf8ef6e7e" />



## Basic settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

Example: gtm.domain.com

If two website share the same container and [cross-domain tracking](#enable-cross-domain-tracking) is enabled, the endpoint domain must be dynamic. Create a regex lookup table to handle this behaviour, for main domains and sub domains.

<img width="1265" alt="Screenshot 2025-06-11 alle 11 22 04" src="https://github.com/user-attachments/assets/a7b54f23-18b5-4e54-ba80-216a06a51f2d" />


### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

Example: /collect/nameless_analytics



## User data
### User parameters
Add session level parameters for all event. 

They are:
- write in Google Cloud Firestore every time they change --> last update 
- read and sent to BigQuery with the current parameter status --> every update 

#### Add User ID
Add User ID parameters in user_id field. 

This parameter can be overridden by [modifying the users ID](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/blob/main/README.md#modify-user-id-parameter) in Nameless Analytics Server-side client tag


#### Add user level parameters
Add user level parameters in user_data object in the payload. Values accepted: strings, integers, float and json.

These parameter can not be overridden.



## Session data
### Session parameters
Add session level parameters for all event. 

They are:
- write in Google Cloud Firestore every time they change --> last update 
- read and sent to BigQuery with the current parameter status --> every update

#### Add session level parameters
Add session level parameters in session_data object in the payload. Values accepted: strings, integers, float and json.

These parameter can not be overridden.



## Event data
### Event parameters
Add event parameters for all events. 

Please note: if a parameter has the same name as another, it can override or be overridden depending on where it was set. 

This is the hierarchy of event parameter importance: 
[Server side parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#addoverride-event-parameters) > [Specific event parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#addoverride-event-parameters) > [Shared parameters](#add-shared-event-parameters) > [dataLayer parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#add-event-parameters-from-datalayer) > [Standard parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/edit/main/README.md#standard-payload)

#### Add shared event parameters
Add shared event parameters in event_data object in the payload. Values accepted: strings, integers, float and json.

These parameters can override:
- default parameters
- parameters taken from dataLayer added in Nameless Analytics Client-side tracker tag

These parameters can be overridden by:
- parameter added for a specific event in Nameless Analytics Client-side tracker tag
- parameter added for a specific request in Nameless Analytics Server-side client tag

#### Add current dataLayer state
Add the current state of the dataLayer in dataLayer field in the payload.  

#### Add page status code
Call the get_status_code() utility function and add page status code in event_data.page_status_code field in the payload.



## Advanced settings
### Respect Google Consent Mode
If respect_consent_mode is enabled, the events are tracked only if a user consents.
- When analytics_storage is equal to denied, the tag waits until consent is granted. 
- When analytics_storage changes from denied to granted, all pending tags for that page will be fired in execution order.
- When analytics_storage is equal to granted, the tag sends the hits to the server-side Google Tag Manager endpoint without temp_client_id and temp_session_id.
  
If respect_consent_mode is disabled, all events are tracked regardless user consents.


### Enable cross-domain tracking
Enables the transfer of client_id and session_id data across two or more websites via URL GET parameter. This allows Nameless Analytics tags to merge into a single session the individual sessions that would otherwise be created when visiting another domains.

Set up the [Endpoint domain name regex lookup table](#endpoint_domain_name) first and add the domains one for row.

<img width="1265" alt="Screenshot 2025-01-16 alle 14 33 32" src="https://github.com/user-attachments/assets/0ed6a515-8fd3-4834-8a7b-f1f19491a63f" />

Please note that also the server-side GTM container must be configured correctly to make cross-domain tracking works. Read the relative [documentation](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#cross-domain).

If enable_cross_domain_tracking option is enabled and respect_consent_mode is false or respect_consent_mode is true and analytics_storage is granted, the Nameless Analytics Client-side tracker tag will set a JavaScript event listener on every link click.  When a user clicks on a cross-domain link, the event listener sends a get_user_data request to the Nameless Analytics Server-Side client tag. 

The Nameless Analytics Server-Side client tag responds with the two cookie values and the JavaScript event listener decorates the URL with a parameter named na_id. After that, the user is redirected to the destination website. 

When the user lands on the destination website and a page_view event is trigger, the Nameless Analytics Client-Side tracker tag checks if there is a na_id parameter in the URL. If it is present, the hit will contain a cross_domain_id parameter.

The Nameless Analytics Server-Side client tag will add it to the request and set back the cookies with those values.

If `enable_cross_domain_tracking option is disabled or respect_consent_mode is true and analytics_storage is denied, the Nameless Analytics Client-side tracker tag will not set any listener or will not send any hit if the consent was change from granted to denied.


### Customize source and campaigns url parameters
Override the default URL query parameter names used to track source and campaign parameters. By default, these values are taken from standard UTM parameters.


### Change default JavaScript page view event names
Override the default JavaScript event names for page_view and virtual_page_view. Update these values if the Nameless Analytics Client-side Tracker Tag is triggered by a JavaScript event name that differs from gtm.js (for page views) or gtm.historyChange (for virtual page views).

When an event is fired, the Nameless Analytics Client-side tracker tag checks if the JavaScript event that triggered the tag is gtm.js or gtm.historyChange. If it is, the tag generates a new page_id value. For this reason, the page_view event must be the first event on a page. Any event sent on a page prior to the first page_view event will be ignored because it lacks a page_id.


### Load main library from custom location
Override the default location from main library. 


### Enable logs in JavaScript console
Enable console log for all events in JavaScript console.

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [Linkedin](https://www.linkedin.com/in/tommasomoretti/)
