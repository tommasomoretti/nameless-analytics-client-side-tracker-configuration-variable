___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Nameless Analytics | CS | Config Variable",
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "basic_settings",
    "displayName": "Basic settings",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "TEXT",
        "name": "endpoint_domain_name",
        "displayName": "Endpoint domain name",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "alwaysInSummary": true,
        "valueHint": "(not set)",
        "help": "Endpoint domain for the request, without any protocols.\n\u003cp\u003e\u003c/p\u003e\nE.g.: gtm.domain.com"
      },
      {
        "type": "TEXT",
        "name": "endpoint_path",
        "displayName": "Endpoint path",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "alwaysInSummary": true,
        "valueHint": "(not set)",
        "help": "Custom endpoint for the requests.\u003cp\u003e\u003c/p\u003eE.g.: /collect/na"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "event_data",
    "displayName": "Event data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "add_common_event_params",
        "checkboxText": "Add shared event parameters",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "common_event_params",
            "displayName": "Shared event parameters",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Param name",
                "name": "param_name",
                "type": "TEXT",
                "valueHint": "(not set)",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Param value",
                "name": "param_value",
                "type": "TEXT",
                "valueHint": "(not set)"
              }
            ],
            "alwaysInSummary": true,
            "help": "Add a custom event parameter that will be shared between events.\u003cp\u003e\u003c/p\u003e\nE.g.: parameter name \u003d page_category and parameter value \u003d {{Page category}}",
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "add_common_event_params",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ],
        "displayName": "Event parameters",
        "alwaysInSummary": true,
        "help": "If set to true, adds shared event parameters to the request. If a parameter is already present, it will be overridden.\u003cp\u003e\u003c/p\u003ePage_id and event_id parameters cannot be overwritten.",
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "add_all_data_from_dataLayer",
        "checkboxText": "Add all data from dataLayer",
        "simpleValueType": true,
        "subParams": [],
        "displayName": "",
        "alwaysInSummary": true,
        "help": "If set to true, add the whole dataLayer object value.",
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "add_user_id",
        "checkboxText": "Add User ID event parameter",
        "simpleValueType": true,
        "help": "If set to true, adds User ID to the request at event level.",
        "displayName": "",
        "defaultValue": false,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "user_id",
            "displayName": "User ID",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "add_user_id",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "",
            "valueHint": "(not set)"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "advanced_settings",
    "displayName": "Advanced settings",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "respect_consent_mode",
        "checkboxText": "Respect Google Consent Mode",
        "simpleValueType": true,
        "displayName": "",
        "help": "If set to true, respects consent mode analytics_storage value.",
        "defaultValue": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "RADIO",
            "name": "tracking_anonymization",
            "displayName": "Tracking anonymization:",
            "radioItems": [
              {
                "value": true,
                "displayValue": "Yes"
              },
              {
                "value": false,
                "displayValue": "No"
              }
            ],
            "simpleValueType": true,
            "defaultValue": false,
            "enablingConditions": [
              {
                "paramName": "respect_consent_mode",
                "paramValue": false,
                "type": "EQUALS"
              }
            ],
            "help": "If set to true, anonymizes client_id, user_id and session_id when analytics_storage consent is denied."
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "enable_cross_domain_tracking",
        "checkboxText": "Enable cross domain tracking",
        "simpleValueType": true,
        "help": "If set to true, enables cross-domain tracking.",
        "displayName": "",
        "defaultValue": false,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "cross_domain_domains",
            "displayName": "Cross-domain domains",
            "simpleTableColumns": [
              {
                "defaultValue": "",
                "displayName": "Domain",
                "name": "domain",
                "type": "TEXT",
                "valueHint": "(not set)",
                "isUnique": true,
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ]
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "enable_cross_domain_tracking",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Autorized domains for cross-domain linking. Add the domains without the protocol, one per row.\u003cp\u003e\u003c/p\u003eE.g.:\u003c/br\u003e domain1.com\u003c/br\u003e domain2.com"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "set_custom_utm_parameters_names",
        "checkboxText": "Customize source and campaigns url parameters",
        "simpleValueType": true,
        "help": "If set to true, sets custom source and campaigns url parameters.\u003cp\u003e\u003c/p\u003eThe name of empty fields will be the same of the corresponding UTM parameter.",
        "displayName": "",
        "defaultValue": false,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "custom_source_name",
            "displayName": "Custom source parameter name (default utm_source)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "set_custom_utm_parameters_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "defaultValue": "utm_source",
            "valueHint": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "custom_campaign_name",
            "displayName": "Custom campaign parameter name (default utm_campaign)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "set_custom_utm_parameters_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": "utm_campaign"
          },
          {
            "type": "TEXT",
            "name": "custom_id_name",
            "displayName": "Custom campaign id parameter name (default utm_id)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "set_custom_utm_parameters_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": "utm_id"
          },
          {
            "type": "TEXT",
            "name": "custom_term_name",
            "displayName": "Custom campaign term parameter name (default utm_term)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "set_custom_utm_parameters_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": "utm_term"
          },
          {
            "type": "TEXT",
            "name": "custom_content_name",
            "displayName": "Custom campaign content parameter name (default utm_content_name)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "set_custom_utm_parameters_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": "utm_content_name"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "change_default_page_view_event_names",
        "checkboxText": "Change default JavaScript page view event names",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "page_view_event_name",
            "displayName": "Page view event name (default gtm.js)",
            "simpleValueType": true,
            "help": "JavaScript event name that trigger a page view event.",
            "defaultValue": "gtm.js",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "change_default_page_view_event_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "virtual_page_view_event_name",
            "displayName": "Virtual page view event name (default gtm.historyChange))",
            "simpleValueType": true,
            "help": "JavaScript event name that trigger a virtual page view event.",
            "defaultValue": "gtm.historyChange",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "change_default_page_view_event_names",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)"
          }
        ],
        "displayName": "",
        "help": "If set to true, change default JavaScript event names that generates a new Page ID."
      },
      {
        "type": "CHECKBOX",
        "name": "load_main_library_from_custom_location",
        "checkboxText": "Load main library from custom location",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "custom_library_location",
            "displayName": "Custom library location",
            "simpleValueType": true,
            "help": "Custom library location.\n\u003c/br\u003e\nDefault location: https://cdn.jsdelivr.net/gh/tommasomoretti/nameless-analytics-client-side-tracker-tag@main/nameless_analytics.js",
            "defaultValue": "https://cdn.jsdelivr.net/gh/tommasomoretti/nameless-analytics-client-side-tracker-tag@main/nameless_analytics.js",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "load_main_library_from_custom_location",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)"
          }
        ],
        "displayName": "",
        "help": "If set to true, change default main library from custom location."
      },
      {
        "type": "CHECKBOX",
        "name": "enable_logs",
        "checkboxText": "Enable logs in JavaScript console",
        "simpleValueType": true,
        "displayName": "",
        "help": "If set to true, enables logging on browser console.",
        "defaultValue": false,
        "alwaysInSummary": true
      }
    ],
    "help": "Lorem ipsum"
  },
  {
    "type": "GROUP",
    "name": "credits",
    "displayName": "Variable info",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "nameless_analytics",
        "displayName": "\u003cimg src\u003d\"https://namelessanalytics.com/img/Logo%20black.svg\" width\u003d\"400\"\u003e"
      },
      {
        "type": "LABEL",
        "name": "info",
        "displayName": "Beta version: 1.0. \n\u003c/br\u003e\nRead more about the \u003ca href\u003d\"https://github.com/tommasomoretti/nameless-analytics\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eNameless Analytics project\u003c/a\u003e or the \u003ca href\u003d\"https://github.com/tommasomoretti/nameless-analytics-client-tag\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eClient-side Config Variable\u003c/a\u003e.\n\u003c/br\u003e\nCreated by \u003ca href\u003d\"https://tommasomoretti.com/?utm_source\u003dtagmanager.google.com\u0026utm_medium\u003dreferral\u0026utm_campaign\u003dcs_analytics_config_variable\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eTommaso Moretti\u003c/a\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const Object = require('Object');

Object.delete(data, 'gtmEventId');
return data;


___TESTS___

scenarios: []


___NOTES___

Created on 16/03/2025, 12:47:00


