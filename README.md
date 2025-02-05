![Na logo beta](https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7d4ded5e-4b79-46a2-b089-03997724fd10)

---

# Client-side configuration variable
The Nameless Analytics Client-side configuration variable is a highly customizable GTM custom template designed to configure the settings of [Nameless Analytics Client-side tracker tag](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag). 

For an overview of how Nameless Analytics works [start from here](https://github.com/tommasomoretti/nameless-analytics).

Start from here:
- [Client-side configuration variable UI](#variable-ui)
- Basic settings
  - [Endpoint domain name](#endpoint-domain-name)
  - [Endpoint path](#endpoint-path)
- Event data
  - [Event parameters](#event-parameters)
    - [Add shared event parameters](#add-shared-event-parameters)
    - [Add user ID event parameter](#add-user-id-event-parameter)
- Advanced settings
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Push Client ID and Session ID values into dataLayer]
  - [Enable logs in JavaScript console](#enable-logs-in-JavaScript-console)
  - [Customize source and campaigns url parameters](#customize-source-and-campaigns-url-parameters)
  - [Enable cross domain tracking (alfa feature)](#enable-cross-domain-tracking-alfa-feature)
  - [Change default JavaScript page view event names](#change-default-JavaScript-page-view-event-names)



## Variable UI
This is the UI of the Client-side configuration variable. This variable will handle settings like endpoint domain name and path, common event parameters, user ID, user consent mode, cross-domain, traffic source parameters and logging in JavaScript console.

<img width="1265" alt="Screenshot 2025-02-05 alle 13 34 49" src="https://github.com/user-attachments/assets/5f25eda5-a6c2-4484-83f8-2611bcc514ed" />


## Basic settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

Example: gtm.domain.com

### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

Example: /collect/nameless_analytics


## Event data
### Event parameters
Add user ID parameter and event parameters manually for all events event. The user ID parameter will be added in the `user_id` field in the payload and the shared event parameters will be added in the `event_data` object in the payload.

If a parameter has the same name as another, it can override or be overridden depending on where it was set. 

This is the hierarchy of event parameter importance:

[Request parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#addoverride-event-parameters) > [Specific event parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#addoverride-event-parameters) > [Shared parameters](#add-shared-event-parameters) > [dataLayer parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/blob/main/README.md#add-event-parameters-from-datalayer) > [Default parameters](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag/edit/main/README.md#default-payload)

#### Add shared event parameters
Add shared event parameters across all events. Values accepted: strings, integers, float and json.

These parameters can override:
- default parameters
- parameters taken from dataLayer added in Nameless Analytics Client-side tracker tag

These parameters can be overridden by:
- parameter added for a specific event in Nameless Analytics Client-side tracker tag
- parameter added for a specific request in Nameless Analytics Server-side client tag

#### Add user ID event parameter
Add user ID parameter at event level across all events (if the user_id persists in the dataLayer across pages). 

This parameter can be overridden by:
- [modifying the users ID](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/blob/main/README.md#modify-user-id-parameter) in Nameless Analytics Server-side client tag



## Advanced settings
### Respect Google Consent Mode
#### Respect Consent Mode: On
If ```respect_consent_mode``` is enabled, the events are tracked only if a user consents.

When ```analytics_storage``` is equal to denied, the tag generates two temporary parameters for client_id (temp_client_id) and session id (temp_session_id) and waits until consent is granted. 

<img width="1258" alt="Screenshot 2025-02-05 alle 13 37 46" src="https://github.com/user-attachments/assets/7c5441a8-6c5b-437d-bd78-103997b8321d" />

When ```analytics_storage``` changes from denied to granted, all pending tags in that page will be fired with the same temp_client_id and temp_session_id.

<img width="1214" alt="Screenshot 2025-02-05 alle 13 49 26" src="https://github.com/user-attachments/assets/19c71c72-ff3f-4217-8505-e3a1d93511da" />

<img width="1258" alt="Screenshot 2025-02-05 alle 13 40 05" src="https://github.com/user-attachments/assets/313aae94-b015-4e22-8445-e3562b565a3c" />

If client and session cookies are missing in the request, The Nameless Analytics Server-side Client Tag deletes temp_client_id and temp_session_id from the payload and uses them to create a client and session cookie.

<img width="1214" alt="Screenshot 2025-01-19 alle 11 40 07" src="https://github.com/user-attachments/assets/18f286fd-f1ab-49e7-a704-8cf1aecd7fdb" />

<img width="1214" alt="Screenshot 2025-01-19 alle 11 41 30" src="https://github.com/user-attachments/assets/63aae237-3f7d-421b-86e4-b8d560738273" />

If client cookie is present but session cookie is not, the Nameless Analytics Server-side Client Tag ignores temp_client_id value and recreates a client cookie with the same value and a session cookie with the value of temp_session_id. **[IMMAGINI DA AGGIORNARE]**

<img width="1214" alt="Screenshot 2025-01-19 alle 11 40 07" src="https://github.com/user-attachments/assets/18f286fd-f1ab-49e7-a704-8cf1aecd7fdb" />

<img width="1214" alt="Screenshot 2025-01-19 alle 11 41 30" src="https://github.com/user-attachments/assets/63aae237-3f7d-421b-86e4-b8d560738273" />

If the client and session cookies already exist, the Nameless Analytics Server-side Client Tag ignores that values and recreates the two cookies with the same values

<img width="1215" alt="Screenshot 2025-01-19 alle 11 48 14" src="https://github.com/user-attachments/assets/6e4361b3-5249-4b1d-aa09-3a3967ee9dd8" />

and uses the existing cookie values instead.

<img width="1215" alt="Screenshot 2025-01-19 alle 11 48 28" src="https://github.com/user-attachments/assets/9bc5e697-855e-4473-b7a3-67713dfde826" />

<img width="1215" alt="Screenshot 2025-01-19 alle 11 48 36" src="https://github.com/user-attachments/assets/76601d19-2b54-481f-bb13-0d67ad822d97" />

When ```analytics_storage``` is equal to granted, the tag sends the hits to the server-side Google Tag Manager endpoint without temp_client_id and temp_session_id.

<img width="1215" alt="Screenshot 2025-01-19 alle 11 53 10" src="https://github.com/user-attachments/assets/b28bfb56-dbc7-4e75-b0c9-2232eb0ecc2d" />

<img width="1215" alt="Screenshot 2025-01-19 alle 11 52 38" src="https://github.com/user-attachments/assets/ca6d9d7f-4b28-42ca-921c-44200b335895" />

<img width="1215" alt="Screenshot 2025-01-19 alle 11 52 49" src="https://github.com/user-attachments/assets/eb0f6da3-f74a-4b1b-9440-f1390d10067c" />
  
<img width="1215" alt="Screenshot 2025-01-19 alle 11 52 58" src="https://github.com/user-attachments/assets/eba09d94-33ad-4ffe-b38f-51aa9ae46cb2" />

#### Respect Consent Mode: Off
If ```respect_consent_mode``` is disabled, all events are tracked regardless user consents.

However the user_id (if present), client_id and session_id can be anonimize when analytics_consent id denied or not expressed (GA4 BigQuery export style when consent is denied)

The tracking anonimization can be adjusted as needed:

<img width="818" alt="Screenshot 2025-01-16 alle 14 04 15" src="https://github.com/user-attachments/assets/8a2d5bf2-4f80-4001-9d35-e9a37932d0a3" />

- On: the Nameless Analytics Server-side client tag anonimizes client ID, sessions ID and user ID (if configured). In Google BigQuery they will be stored a string with a value of "Redacted_Redacted" for session ID and "Redacted" for client_id and user_id.
- Off: No anonimization will be applied.


### Push Client ID and Session ID values into dataLayer
TBD


### Enable logs in JavaScript console
Enable console log for all events in JavaScript console.


### Customize source and campaigns url parameters
Override the default URL query parameter names used to track source and campaign parameters. By default, these values are taken from UTM parameters.

<img width="818" alt="Screenshot 2025-01-16 alle 15 59 45" src="https://github.com/user-attachments/assets/2389e9a3-d8ba-48ad-8a0b-1a2dfb8f7378" />


### Enable cross-domain tracking (alfa feature)
Enable the transfer of client_id and session_id data across two or more websites. This allows Nameless Analytics tags to merge into a single session the individual sessions that would otherwise be created when visiting another domains.

Please note that:
  - <ins>This is an Alpha feature: enabling it will cause all links that are meant to open in a new tab to instead open in the same tab.</ins>

  - <ins>The server-side GTM container and the Nameless Analytics Server-side client tag must be configured correctly to make cross-domain tracking works. Read the relative</ins> [documentation](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#cross-domain).

#### Cross-domain tracking enabled
Enable cross-domain tracking. Add the domains one for row.

<img width="818" alt="Screenshot 2025-01-16 alle 14 33 32" src="https://github.com/user-attachments/assets/0ed6a515-8fd3-4834-8a7b-f1f19491a63f" />

If ```enable_cross_domain_tracking``` option is enabled, the Nameless Analytics Client-side tracker tag will set a JavaScript event listener on every link click.  When a user clicks on a link with a valid for cross-domain domain, the event listener sends a ```get_user_data``` request to the server. 

- When ```analytics_storage``` is granted and a user clicks on an authorized link:
    
  <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7f966853-9e95-4638-b831-03f6c9506267">
  
- When ```analytics_storage``` is granted and a user clicks on not autorized link:
    
  <img width="1263" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/207ce2cf-5a09-4e5f-a0c0-1450e4065631">
    
- When ```analytics_storage``` is granted and a user clicks on internal link:
 
  <img width="1262" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/e5152e8f-c757-4718-8e94-5dd28df19564">
    
- When ```analytics_storage``` is not granted and a user clicks on any link, no link decoration happens but the logs are still present in the console like above. 
    
  <img width="1263" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/1ee8a621-cf00-47b9-9c3a-dff38ac77e2a">
  <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/2d59516f-c8dc-4c20-8e41-8f2fc505b0e7">
  <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/e32d530a-bdb5-479c-9da9-7ec669a03cf5">

The server responds with the two cookie values and the JavaScript event listener decorates the URL with a parameter named ```na_id```. After that, the user is redirected to the destination website. 

<img width="1265" alt="Screenshot 2024-11-24 alle 18 06 18" src="https://github.com/user-attachments/assets/da266282-cf32-4a45-a7b6-1dc7832f9d4a">

When the user lands on the destination website, the first tag that fires checks if there is a ```na_id``` parameter in the URL. If it is present, the hit will contain a ```cross_domain_id``` parameter, the server-side Client Tag will add it to the request and set back the cookies with those values.

<img width="1265" alt="Screenshot 2024-11-24 alle 18 06 52" src="https://github.com/user-attachments/assets/c59e4eed-13af-4b3e-b0bd-a4d660e77c1a">

#### Cross-domain tracking disabled
If ```enable_cross_domain_tracking``` option is disabled, the Nameless Analytics Client-side tracker tag will not set any listener.


### Change default JavaScript page view event names
Override the default JavaScript event names for page_view and virtual_page_view. Update these values if the Nameless Analytics Client-side Tracker Tag is triggered by a JavaScript event name that differs from gtm.js (for page views) or gtm.historyChange (for virtual page views).

When an event is fired, the Nameless Analytics Client-side Tracker Tag checks if the JavaScript event that triggered the tag is gtm.js or gtm.historyChange. If it is, the tag generates a new page_id value. For this reason, the page_view event must be the first event on a page. Any event sent on a page prior to the first page_view event will be ignored because it lacks a page_id.

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [Linkedin](https://www.linkedin.com/in/tommasomoretti/)
