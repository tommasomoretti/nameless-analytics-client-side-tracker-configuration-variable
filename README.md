![Na logo beta](https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7d4ded5e-4b79-46a2-b089-03997724fd10)

# Client-side configuration variable
The Nameless Analytics Client-side configuration variable is a highly customizable GTM custom template designed to configure the settings of [Nameless Analytics Client-side tracker tag](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag). 

Start from here:
- [Client-side configuration variable UI](#variable-ui)
- [Basic settings](#basic-settings)
  - [Endpoint domain name](#endpoint-domain-name)
  - [Endpoint path](#endpoint-path)
- [Event data](#event-data)
  - [Event parameters](#event-parameters)
    - [Add shared event parameters](#add-shared-event-parameters)
    - [Add user ID event parameter](#add-user-id-event-parameter)
- [Advanced settings](#advanced-settings)
  - [Respect Google Consent Mode](#respect-google-consent-mode)
  - [Enable cross domain tracking (alfa feature)](#enable-cross-domain-tracking-alfa-feature)
  - [Customize source and campaigns url parameters](#customize-source-and-campaigns-url-parameters)
  - [Change default JavaScript page view event names](#change-default-javascript-page-view-event-names)
  - [Enable logs in JavaScript console](#enable-logs-in-javascript-console)



## Variable UI
This is the UI of the Client-side configuration variable. This variable will handle settings like endpoint domain name and path, common event parameters, user ID, user consent mode, cross-domain, traffic source parameters and logging in JavaScript console.

<img width="1265" alt="client-side-configuration-variable" src="https://github.com/user-attachments/assets/640330fc-c60d-4633-ae0b-5250d0780c40">



## Basic settings
### Endpoint domain name
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. 

Example: gtm.domain.com

### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. 

Example: /collect/nameless_analytics


## Event data
### Event parameters
#### Add shared event parameters
Add shared event parameters across all events. The parameters will be added to the `event_data` object in the payload.

#### Add user ID event parameter
Add user ID parameter at event level across all events (if the `user_id persists` in the dataLayer across pages). The parameters will be added to the `user_id` key in the payload.



## Advanced settings
### Respect Google Consent Mode
Choose whether to track all events or only track events when the user consents. The tracking modes affect the tag's behavior as follows:

#### Respect consent mode
If ```respect_consent_mode``` is enabled, the events are tracked only if a user consents.

- when ```analytics_storage``` is equal to denied, the tag waits until consent is granted. If consent is granted (in the context of the same page), all pending tags will be fired.
  
    <img width="1265" alt="Nameless Analytics client-side logs" src="https://github.com/user-attachments/assets/5ecaea7e-6940-45aa-a740-5f301d321a8f">

- when ```analytics_storage``` is equal to granted, the tag sends the hit to the server-side Google Tag Manager endpoint, with the event name and event parameters configured in the tag.
  
    <img width="1263" alt="Nameless Analytics client-side logs" src="https://github.com/user-attachments/assets/171b6f19-7805-4063-8472-e8f6a679e515">

The tracking accuracy for acquisitions parameters can be adjusted as needed: 

<img width="818" alt="Screenshot 2025-01-16 alle 14 05 04" src="https://github.com/user-attachments/assets/38b03793-384a-485a-b946-12185db86f6c" />

- Standard: the tracker will use the current document.referrer values and campaign parameters of the page as source and campaign parameters.

  Example: If a user gives consent on the second page viewed (current document.referrer = ""), the source and campaign parameter values will be "".

- Enhanced: the tracker will save and update a temporary JavaScript cookie, storing the latest, not "" document.referrer values, source and campaign parameters. 

  Example If a user gives consent on the second page viewed (current document.referrer = ""), the source and campaign parameter values will be taken from the cookie saved on the first page.

#### Do not respect consent mode
If ```respect_consent_mode``` is disabled, all events are tracked.

The tracking anonimization can be adjusted as needed:

<img width="818" alt="Screenshot 2025-01-16 alle 14 04 15" src="https://github.com/user-attachments/assets/8a2d5bf2-4f80-4001-9d35-e9a37932d0a3" />

- On: the server side client tag anonimize user_id (if present), client_id and sessions_id. In big query they will be stored a string with a value of "Redacted".
- Off: No anonimization will be applied.


### Enable cross-domain tracking (alfa feature)
Enable the transfer of client_id and session_id data across two or more websites. This allows you to merge into a single session the individual sessions that would otherwise be created when visiting another domains.

**This is an Alpha feature:** enabling it will cause all links that are meant to open in a new tab to instead open in the same tab.

The server-side GTM container and the Nameless Analytics Server-side client tag must be configured correctly to make cross-domain tracking works. Read the relative [documentation](https://github.com/tommasomoretti/nameless-analytics-server-side-client-tag/#cross-domain).

#### Enable cross-domain tracking
Enable cross-domain tracking. Add the domains one for row.
<img width="818" alt="Screenshot 2025-01-16 alle 14 33 32" src="https://github.com/user-attachments/assets/0ed6a515-8fd3-4834-8a7b-f1f19491a63f" />

If ```enable_cross_domain_tracking``` option is enabled, the client-side tag will set a javascript event listener on every link click.  When a user clicks on a link with a authorized domain for cross-domain, a javascript event listener sends a ```get_user_data``` request to the server. 

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

The server responds with the two cookie values and the javascript event listener decorates the URL with a parameter named ```na_id```. After that, the user is redirected to the destination website. 

<img width="1265" alt="Screenshot 2024-11-24 alle 18 06 18" src="https://github.com/user-attachments/assets/da266282-cf32-4a45-a7b6-1dc7832f9d4a">

When the user lands on the destination website, the first tag that fires checks if there is a ```na_id``` parameter in the URL. If it is present, the hit will contain a ```cross_domain_id``` parameter, the server-side Client Tag will add it to the request and set back the cookies with those values.

<img width="1265" alt="Screenshot 2024-11-24 alle 18 06 52" src="https://github.com/user-attachments/assets/c59e4eed-13af-4b3e-b0bd-a4d660e77c1a">

#### Disable cross-domain tracking
If ```enable_cross_domain_tracking``` option is disabled, the client-side tag will not set any listener.


### Customize source and campaigns url parameters
Override the default URL query parameter names used to track source and campaign parameters. If this setting is enabled but no values are added in the fields, the following default parameter names will be used:

- source = utm_source
- campaign_name = utm_campaign
- campaign_id = utm_id
- campaign_term = utm_term
- campaign_content = utm_content_name

<img width="818" alt="Screenshot 2025-01-16 alle 15 59 45" src="https://github.com/user-attachments/assets/2389e9a3-d8ba-48ad-8a0b-1a2dfb8f7378" />


### Change default JavaScript page view event names
Lorem ipsum


### Enable logs in JavaScript console
Lorem ipsum

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [Linkedin](https://www.linkedin.com/in/tommasomoretti/)
