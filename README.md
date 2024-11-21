![Na logo beta](https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7d4ded5e-4b79-46a2-b089-03997724fd10)

# Client-side configuration variable
The Nameless Analytics Client-side configuration variable is the core of [Nameless Analytics Server-side client tag](https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-tag). 

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
The domain name of the server-side GTM instance. The tag assumes the protocol is HTTPS. Example: gtm.domain.com.

### Endpoint path
The endpoint path where the Nameless Analytics Server-side Client Tag listens. For example: /nameless_analytics.


## Event data
### Event parameters
#### Add shared event parameters
Add shared event parameters across all events. The parameters will be added to the `event_data` object in the payload.

#### Add user ID event parameter
Add user ID parameters across all events (if it persist across page_views). The parameters will be added to the `user_id` key in the payload.



## Advanced settings
### Respect Google Consent Mode
Set if respect user consents on ```analytics_storage``` or track all events.

If the ```respect_consent_mode``` option is enabled, the events are tracked only if a user consents but the tracking accuracy for acquisitions parameters can be adjusted as needed: 
  - Standard: the tag dosn't save any temporary cookie at all. The referrer of an event will be the real referrer of the page.
  - Medium: the tag save a temporary cookie with the first referrer of the session. When the consent is granted The referrer of an event will be the value of `temp_source_campaign` cookie. 
  - High: the tag save and update a temporary cookie with all referrer changes during the session (the cookie will be not update if the referrer is internal traffic).

    
If ```analytics_storage``` is equal to denied, the tag waits until consent is granted. If consent is granted (in the context of the same page), all pending tags will be fired.
  
<img width="1265" alt="Nameless Analytics client-side logs" src="https://github.com/user-attachments/assets/5ecaea7e-6940-45aa-a740-5f301d321a8f">

If ```analytics_storage``` is equal to granted, the tag sends the hit to the server-side Google Tag Manager endpoint, with the event name and event parameters configured in the tag.
  
<img width="1263" alt="Nameless Analytics client-side logs" src="https://github.com/user-attachments/assets/171b6f19-7805-4063-8472-e8f6a679e515">
      
If the ```respect_consent_mode``` option is disabled, the tag fires regardless of the user's consent.
If `tracking_anonimization` is enabled, the client_id, user_id and session_id will be redacted when analytics_storage consent is denied.
If `tracking_anonimization` is disable, no limitation will be applied. 


### Enable cross domain tracking (alfa feature)
If ```enable_cross_domain_tracking``` option is enabled, the client-side tag will set a javascript event listener on every link click. 
  - When a user clicks on a link with a authorized domain for cross-domain, a javascript event listener sends a ```get_user_data``` request to the server. The server responds with the two cookie values and the javascript event listener decorates the URL with a parameter named ```na_id```. After that, the user is redirected to the destination website.
  - When the user lands on the destination website, the first tag that fires checks if there is a ```na_id``` parameter in the URL. If it is present, the hit will contain a ```cross_domain_id``` parameter, the server-side Client Tag will add it to the request and set back the cookies with those values.

    When ```enable_cross_domain_tracking``` option is enabled, ```analytics_storage``` is granted and a user clicks on an authorized link:
    
    <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/7f966853-9e95-4638-b831-03f6c9506267">
  
    When ```enable_cross_domain_tracking``` option is enabled, ```analytics_storage``` is granted and a user clicks on not autorized link:
    
    <img width="1263" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/207ce2cf-5a09-4e5f-a0c0-1450e4065631">
    
    When ```enable_cross_domain_tracking``` option is enabled, ```analytics_storage``` is granted and a user clicks on internal link:
 
    <img width="1262" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/e5152e8f-c757-4718-8e94-5dd28df19564">
    
    When ```enable_cross_domain_tracking``` option is enabled, ```analytics_storage``` is not granted and a user clicks on any link, no link decoration happens but the logs are still present in the console like above. 
    
    <img width="1263" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/1ee8a621-cf00-47b9-9c3a-dff38ac77e2a">
    <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/2d59516f-c8dc-4c20-8e41-8f2fc505b0e7">
    <img width="1264" alt="Nameless Analytics client-side cross domain" src="https://github.com/tommasomoretti/nameless-analytics/assets/29273232/e32d530a-bdb5-479c-9da9-7ec669a03cf5">

If ```enable_cross_domain_tracking``` option is disabled, the client-side tag will not set any listener.


### Customize source and campaigns url parameters


### Change default JavaScript page view event names


### Enable logs in JavaScript console

---

Reach me at: [Email](mailto:hello@tommasomoretti.com) | [Website](https://tommasomoretti.com/?utm_source=github.com&utm_medium=referral&utm_campaign=nameless_analytics) | [Twitter](https://twitter.com/tommoretti88) | [Linkedin](https://www.linkedin.com/in/tommasomoretti/)
