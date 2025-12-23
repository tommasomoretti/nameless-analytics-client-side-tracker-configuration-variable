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
  "displayName": "Nameless Analytics | CS | Tracker configuration variable",
  "description": "A highly customizable GTM custom variable template designed to configure the settings of Nameless Analytics Client-side tracker tag.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "event_data_title",
    "displayName": "\u003cb\u003eData\u003c/b\u003e"
  },
  {
    "type": "GROUP",
    "name": "user_data",
    "displayName": "User data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "add_user_params",
        "checkboxText": "Add user level parameters",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "user_params",
            "displayName": "User parameters",
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
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_date$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_date parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_channel_grouping$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_channel_grouping parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_source$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_source parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_tld_source$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_tld_source parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_campaign$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_campaign parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_campaign_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_campaign_id parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_campaign_content$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_campaign_content parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_campaign_term$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_campaign_term parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_device_type$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_device_type parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_country$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_country parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_language$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_language parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_first_session_timestamp$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_first_session_timestamp parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_last_session_timestamp$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_last_session_timestamp parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_id parameter. Add the user ID in the field below."
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
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "add_user_params",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ],
        "displayName": "User parameters",
        "alwaysInSummary": true,
        "help": "Add user parameters to the request in user_data. If a parameter has the same name, it will be overridden.\n\u003c/br\u003e\u003c/br\u003e\nReserved user parameters: \u003c/br\u003e  \n• user_date \u003c/br\u003e  \n• user_id \u003c/br\u003e  \n• user_channel_grouping \u003c/br\u003e  \n• user_source \u003c/br\u003e  \n• user_tld_source \u003c/br\u003e  \n• user_campaign \u003c/br\u003e  \n• user_campaign_id \u003c/br\u003e  \n• user_campaign_content \u003c/br\u003e  \n• user_campaign_term \u003c/br\u003e  \n• user_device_type \u003c/br\u003e  \n• user_country \u003c/br\u003e  \n• user_language \u003c/br\u003e  \n• user_first_session_timestamp \u003c/br\u003e\n• user_last_session_timestamp \u003c/br\u003e",
        "defaultValue": false
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "session_data",
    "displayName": "Session data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "add_user_id",
        "checkboxText": "Add User ID",
        "simpleValueType": true,
        "help": "Add User ID to the request in session_data.user_id.\u003c/br\u003e\u003c/br\u003eUser ID is set at session level.",
        "displayName": "Session parameters",
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
            "valueHint": "(not set)"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "add_session_params",
        "checkboxText": "Add session level parameters",
        "simpleValueType": true,
        "subParams": [
          {
            "type": "SIMPLE_TABLE",
            "name": "session_params",
            "displayName": "Session parameters",
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
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_date$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_date parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_number$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_number parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!cross_domain_session$).*"
                    ],
                    "errorMessage": "Can\u0027t add cross_domain_session parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_channel_grouping$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_channel_grouping parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_source$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_source parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_tld_source$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_tld_source parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_campaign$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_campaign parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_campaign_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_campaign_id parameter.",
                    "enablingConditions": []
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_campaign_content$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_campaign_content parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_campaign_term$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_campaign_term parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_device_type$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_device_type parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_country$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_country parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_language$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_language parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_hostname$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_hostname parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_browser_name$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_browser_name parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_landing_page_category$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_landing_page_category parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_landing_page_location$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_landing_page_location parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_landing_page_title$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_landing_page_title parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_exit_page_category$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_exit_page_category parameter.",
                    "enablingConditions": []
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_exit_page_location$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_exit_page_location parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_exit_page_title$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_exit_page_title parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_start_timestamp$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_start_timestamp parameter."
                  },
                  {
                    "type": "REGEX",
                    "errorMessage": "Can\u0027t add session_end_timestamp parameter.",
                    "args": [
                      "^(?!session_end_timestamp$).*"
                    ]
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!session_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add session_id parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_id parameter. Add the user ID in the field above."
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
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "enablingConditions": [
              {
                "paramName": "add_session_params",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ],
        "displayName": "",
        "alwaysInSummary": true,
        "help": "Add session parameters to the request in session_data. If a parameter has the same name, it will be overridden.\n\u003c/br\u003e\u003c/br\u003e\nReserved session parameters: \u003c/br\u003e\n• session_date \u003c/br\u003e \n• session_id \u003c/br\u003e\n• session_number \u003c/br\u003e \n• cross_domain_session \u003c/br\u003e \n• session_channel_grouping \u003c/br\u003e \n• session_source \u003c/br\u003e \n• session_tld_source \u003c/br\u003e \n• session_campaign \u003c/br\u003e \n• session_campaign_id \u003c/br\u003e \n• session_campaign_content \u003c/br\u003e \n• session_campaign_term \u003c/br\u003e \n• session_device_type \u003c/br\u003e \n• session_country \u003c/br\u003e \n• session_language \u003c/br\u003e \n• session_hostname \u003c/br\u003e \n• session_browser_name \u003c/br\u003e \n• session_landing_page_category \u003c/br\u003e \n• session_landing_page_location \u003c/br\u003e \n• session_landing_page_title \u003c/br\u003e \n• session_exit_page_category \u003c/br\u003e \n• session_exit_page_location \u003c/br\u003e \n• session_exit_page_title \u003c/br\u003e \n• session_start_timestamp \u003c/br\u003e \n• session_end_timestamp \u003c/br\u003e",
        "defaultValue": false
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "page_data",
    "displayName": "Page data",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "GROUP",
        "name": "page_data_fields",
        "displayName": "",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "page_category",
            "displayName": "Page category (Optional)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueHint": "(not set)",
            "help": "Add page_category parameter to the request in event_data."
          },
          {
            "type": "TEXT",
            "name": "page_title",
            "displayName": "Page title",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Add page_title parameter to the request in event_data."
          },
          {
            "type": "TEXT",
            "name": "page_location",
            "displayName": "Page location",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ],
            "valueHint": "(not set)",
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Add page_location parameter to the request in event_data."
          },
          {
            "type": "TEXT",
            "name": "page_fragment",
            "displayName": "Page fragment (Optional)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueHint": "(not set)",
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Add page_fragment parameter to the request in event_data."
          },
          {
            "type": "TEXT",
            "name": "page_query",
            "displayName": "Page query (Optional)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueHint": "(not set)",
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Add page_query parameter to the request in event_data."
          },
          {
            "type": "TEXT",
            "name": "page_extension",
            "displayName": "Page extension (Optional)",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "valueHint": "(not set)",
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "help": "Add page_extension parameter to the request in event_data."
          }
        ]
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
        "checkboxText": "Add shared event level parameters",
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
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!event_type$).*"
                    ],
                    "errorMessage": "Can\u0027t add event_type parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!channel_grouping$).*"
                    ],
                    "errorMessage": "Can\u0027t add channel_grouping parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!source$).*"
                    ],
                    "errorMessage": "Can\u0027t add source parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!campaign$).*"
                    ],
                    "errorMessage": "Can\u0027t add campaign parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!campaign_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add campaign_id parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!campaign_term$).*"
                    ],
                    "errorMessage": "Can\u0027t add campaign_term parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!campaign_content$).*"
                    ],
                    "errorMessage": "Can\u0027t add campaign_content parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_id parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_title$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_title parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_hostname_protocol$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_hostname_protocol parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_location$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_location parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_fragment$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_fragment parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_query$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_query parameter."
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_extension$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_query parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_referrer$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_referrer parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_language$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_language parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!page_status_code$).*"
                    ],
                    "errorMessage": "Can\u0027t add page_status_code parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!cs_container_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add cs_container_id parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!user_agent$).*"
                    ],
                    "errorMessage": "Can\u0027t add user_agent parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!browser_name$).*"
                    ],
                    "errorMessage": "Can\u0027t add browser_name parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!browser_language$).*"
                    ],
                    "errorMessage": "Can\u0027t add browser_language parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!browser_version$).*"
                    ],
                    "errorMessage": "Can\u0027t add browser_version parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!device_type$).*"
                    ],
                    "errorMessage": "Can\u0027t add device_type parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!device_vendor$).*"
                    ],
                    "errorMessage": "Can\u0027t add device_vendor parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!device_model$).*"
                    ],
                    "errorMessage": "Can\u0027t add device_model parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!os_name$).*"
                    ],
                    "errorMessage": "Can\u0027t add os_name parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!os_version$).*"
                    ],
                    "errorMessage": "Can\u0027t add os_version parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!screen_size$).*"
                    ],
                    "errorMessage": "Can\u0027t add screen_size parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!viewport_size$).*"
                    ],
                    "errorMessage": "Can\u0027t add viewport_size parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!country$).*"
                    ],
                    "errorMessage": "Can\u0027t add country parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!city$).*"
                    ],
                    "errorMessage": "Can\u0027t add city parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!ss_hostname$).*"
                    ],
                    "errorMessage": "Can\u0027t add ss_hostname parameterpage_extension"
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^(?!ss_container_id$).*"
                    ],
                    "errorMessage": "Can\u0027t add ss_container_id parameterpage_extension"
                  }
                ]
              },
              {
                "defaultValue": "",
                "displayName": "Param value",
                "name": "param_value",
                "type": "TEXT",
                "valueValidators": [
                  {
                    "type": "NON_EMPTY"
                  }
                ],
                "valueHint": "(not set)"
              }
            ],
            "alwaysInSummary": true,
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
        "help": "Add event parameters to the request in event_data. If a parameter has the same name, it will be overridden.\n\u003c/br\u003e\u003c/br\u003e\nReserved event parameters: \u003c/br\u003e \n• event_type \u003c/br\u003e \n• channel_grouping \u003c/br\u003e \n• source \u003c/br\u003e \n• campaign \u003c/br\u003e \n• campaign_id \u003c/br\u003e \n• campaign_term \u003c/br\u003e \n• campaign_content \u003c/br\u003e \n• page_id \u003c/br\u003e \n• page_title \u003c/br\u003e \n• page_hostname_protocol \u003c/br\u003e \n• page_hostname \u003c/br\u003e \n• page_location \u003c/br\u003e \n• page_fragment \u003c/br\u003e \n• page_query \u003c/br\u003e \n• page_extension \u003c/br\u003e \n• page_referrer \u003c/br\u003e \n• page_language \u003c/br\u003e \n• page_status_code \u003c/br\u003e \n• cs_container_id \u003c/br\u003e \n• user_agent \u003c/br\u003e \n• browser_name \u003c/br\u003e \n• browser_language \u003c/br\u003e \n• browser_version \u003c/br\u003e \n• device_type \u003c/br\u003e \n• device_vendor \u003c/br\u003e \n• device_model \u003c/br\u003e \n• os_name \u003c/br\u003e \n• os_version \u003c/br\u003e \n• screen_size \u003c/br\u003e \n• viewport_size \u003c/br\u003e \n• country \u003c/br\u003e \n• city \u003c/br\u003e \n• ss_hostname \u003c/br\u003e \n• ss_container_id \u003c/br\u003e",
        "defaultValue": false
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "settings_title",
    "displayName": "\u003c/br\u003e\u003cb\u003eSettings\u003c/b\u003e"
  },
  {
    "type": "GROUP",
    "name": "server_side_endpoint_settings",
    "displayName": "Server-side endpoint settings",
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
          },
          {
            "type": "REGEX",
            "args": [
              "^([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$"
            ],
            "errorMessage": "The URL must not start with http:// or https://, must not end with /, and must contain a valid domain."
          }
        ],
        "alwaysInSummary": true,
        "valueHint": "(not set)",
        "help": "Endpoint domain of the Server-Side GTM running Nameless Analytics Server-Side client tag.\n\u003c/br\u003e\u003c/br\u003e\nThe URL must not start with http:// or https://, must not end with / and must contain a valid domain."
      },
      {
        "type": "TEXT",
        "name": "endpoint_path",
        "displayName": "Endpoint path",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          },
          {
            "type": "REGEX",
            "errorMessage": "The path must start with / and must not end with /.",
            "args": [
              "^/.*(?\u003c!/)$"
            ]
          }
        ],
        "alwaysInSummary": true,
        "valueHint": "(not set)",
        "help": "Endpoint request path of Nameless Analytics Server-Side client tag.\n\u003c/br\u003e\u003c/br\u003e\nThe endpoint path must start with / and must not end with /."
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "page_view_settings",
    "displayName": "Page view settings",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "add_page_status_code",
        "checkboxText": "Add page status code",
        "simpleValueType": true,
        "help": "Add page status code when event_type equals page_view. \u003c/br\u003e\u003c/br\u003e \u003cb\u003eThis setting will make HEAD requests to the website server every time a page is loaded.\u003c/b\u003e",
        "defaultValue": false,
        "alwaysInSummary": true
      },
      {
        "type": "CHECKBOX",
        "name": "set_custom_utm_parameters_names",
        "checkboxText": "Override default source and campaigns url query parameters",
        "simpleValueType": true,
        "help": "Override default url query parameters used for source and campaigns event parameters.\n\u003c/br\u003e\u003c/br\u003e\nDefault parameters:\u003c/br\u003e \n• source \u003d utm_source \u003c/br\u003e \n• campaign_name \u003d utm_campaign \u003c/br\u003e \n• campaign_id \u003d utm_campaign_id \u003c/br\u003e \n• campaign_term \u003d utm_term \u003c/br\u003e \n• campaign_content \u003d utm_content \u003c/br\u003e",
        "displayName": "",
        "defaultValue": false,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "custom_source_name",
            "displayName": "Query parameter name for source",
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
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!utm_source$).*"
                ],
                "errorMessage": "Query parameter name can\u0027t be equal to utm_source."
              }
            ],
            "defaultValue": "",
            "valueHint": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "custom_campaign_name",
            "displayName": "Query parameter name for campaign name",
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
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!utm_campaign$).*"
                ],
                "errorMessage": "Query parameter name can\u0027t be equal to utm_campaign."
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": ""
          },
          {
            "type": "TEXT",
            "name": "custom_id_name",
            "displayName": "Query parameter name for campaign id",
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
                "type": "REGEX",
                "args": [
                  "^(?!utm_id$).*"
                ],
                "errorMessage": "Query parameter name can\u0027t be equal to utm_id."
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": ""
          },
          {
            "type": "TEXT",
            "name": "custom_term_name",
            "displayName": "Query parameter name for campaign term",
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
                "type": "REGEX",
                "args": [
                  "^(?!utm_term$).*"
                ],
                "errorMessage": "Query parameter name can\u0027t be equal to utm_term."
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": ""
          },
          {
            "type": "TEXT",
            "name": "custom_content_name",
            "displayName": "Query parameter name for campaign content",
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
                "type": "REGEX",
                "args": [
                  "^(?!utm_content$).*"
                ],
                "errorMessage": "Query parameter name can\u0027t be equal to utm_content."
              }
            ],
            "valueHint": "(not set)",
            "defaultValue": ""
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "change_default_page_view_event_name",
        "checkboxText": "Override default JavaScript page view event names *",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "page_view_event_name",
            "displayName": "Page view event name",
            "simpleValueType": true,
            "defaultValue": "",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "change_default_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!gtm.js$).*"
                ],
                "errorMessage": "Event name can\u0027t be equal to gtm.js."
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!gtm.historyChange$).*"
                ],
                "errorMessage": "Event name can\u0027t be equal to gtm.historyChange."
              }
            ],
            "valueHint": "(not set)"
          }
        ],
        "displayName": "",
        "help": "Override default JavaScript event names that generates a new Page ID for page views. \n\u003c/br\u003e\u003c/br\u003e\nIf page_view events are not triggered on \"All Pages\" events, update this value accordingly to match the corresponding JavaScript event name."
      },
      {
        "type": "CHECKBOX",
        "name": "change_default_virtual_page_view_event_name",
        "checkboxText": "Override default JavaScript virtual page view event names **",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "virtual_page_view_event_name",
            "displayName": "Virtual page view event name",
            "simpleValueType": true,
            "defaultValue": "",
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "change_default_virtual_page_view_event_name",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!gtm.js$).*"
                ],
                "errorMessage": "Event name can\u0027t be equal to gtm.js."
              },
              {
                "type": "REGEX",
                "args": [
                  "^(?!gtm.historyChange$).*"
                ],
                "errorMessage": "Event name can\u0027t be equal to gtm.historyChange."
              }
            ],
            "valueHint": "(not set)"
          }
        ],
        "displayName": "",
        "help": "Override default JavaScript event names that generates a new Page ID for virtual page views. \n\u003c/br\u003e\u003c/br\u003e\nIf virtual page views events are not triggered on history.replaceState() or history.pushState() events, update this value accordingly to match the corresponding JavaScript event name."
      },
      {
        "type": "LABEL",
        "name": "warning_change_pv_event_name_off",
        "displayName": "* Page views will be fired on All Pages (gtm.js) event.",
        "enablingConditions": [
          {
            "paramName": "change_default_page_view_event_name",
            "paramValue": false,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "LABEL",
        "name": "warning_change_pv_event_name_on",
        "displayName": "* Page views will be fired on custom event.",
        "enablingConditions": [
          {
            "paramName": "change_default_page_view_event_name",
            "paramValue": true,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "LABEL",
        "name": "warning_change_vpv_event_name_off",
        "displayName": "** Virtual page views will be fired through the JavaScript APIs history.pushState() or history.replaceState().\u003c/br\u003e\u003c/br\u003e",
        "enablingConditions": [
          {
            "paramName": "change_default_virtual_page_view_event_name",
            "paramValue": false,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "LABEL",
        "name": "warning_change_vpv_event_name_on",
        "displayName": "** Virtual page views will be fired on custom event.\u003c/br\u003e\u003c/br\u003e",
        "enablingConditions": [
          {
            "paramName": "change_default_virtual_page_view_event_name",
            "paramValue": true,
            "type": "EQUALS"
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
        "help": "Respects Google Consent Mode analytics_storage consent value.\n\u003c/br\u003e\u003c/br\u003e\nWhen Respect Google Consent Mode is enabled:\u003c/br\u003e\n- Consent granted (analytics_storage\u003dgranted): tags fire normally\u003c/br\u003e\n- Consent denied (analytics_storage\u003ddenied): tags do not fire and remain pending until consent is updated to granted\u003c/br\u003e\n\u003c/br\u003e\u003c/br\u003e\nWhen Respect Google Consent Mode is disabled:\u003c/br\u003e\n- Tags fire on every event without consent-based restrictions.",
        "defaultValue": true,
        "alwaysInSummary": true,
        "subParams": []
      },
      {
        "type": "CHECKBOX",
        "name": "enable_cross_domain_tracking",
        "checkboxText": "Enable cross domain tracking",
        "simpleValueType": true,
        "help": "Enable cross-domain tracking across domains.\n\u003c/br\u003e\u003c/br\u003e\nThe URL must not start with http:// or https://, must not end with / and must contain a valid domain.",
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
                  },
                  {
                    "type": "REGEX",
                    "args": [
                      "^([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$"
                    ],
                    "errorMessage": "The URL must not start with http:// or https://, must not end with /, and must contain a valid domain."
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
            ]
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "load_libraries_from_custom_location",
        "checkboxText": "Load JavaScript libraries in first-party mode",
        "simpleValueType": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "TEXT",
            "name": "custom_libraries_domain",
            "displayName": "Custom library domain name",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "load_libraries_from_custom_location",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}$"
                ],
                "errorMessage": "The URL must not start with http:// or https://, must not end with /, and must contain a valid domain."
              }
            ],
            "valueHint": "(not set)"
          },
          {
            "type": "TEXT",
            "name": "custom_libraries_path",
            "displayName": "Custom library path",
            "simpleValueType": true,
            "alwaysInSummary": true,
            "enablingConditions": [
              {
                "paramName": "load_libraries_from_custom_location",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^/.*(?\u003c!/)$"
                ],
                "errorMessage": "The path must start with / and must not end with /."
              }
            ],
            "valueHint": "(not set)"
          }
        ],
        "displayName": "",
        "help": "Load the main library and its dependencies from a first-party location. Host nameless-analytics.js and ua-parser.js on the website server so that the library will be loaded from the current domain.\n\u003c/br\u003e\u003c/br\u003e\nThe path must not start with / and must end with /."
      },
      {
        "type": "CHECKBOX",
        "name": "add_current_datalayer_state",
        "checkboxText": "Add current dataLayer state",
        "simpleValueType": true,
        "subParams": [],
        "displayName": "",
        "alwaysInSummary": true,
        "help": "Add the last value of the dataLayer object for every event.",
        "defaultValue": false
      },
      {
        "type": "CHECKBOX",
        "name": "enable_logs",
        "checkboxText": "Enable logs in JavaScript console",
        "simpleValueType": true,
        "displayName": "",
        "help": "Enables logging on browser console for all events.",
        "defaultValue": true,
        "alwaysInSummary": true,
        "subParams": [
          {
            "type": "CHECKBOX",
            "name": "enable_logs_debug_mode_only",
            "checkboxText": "Debug mode only",
            "simpleValueType": true,
            "help": "Enables logging on browser console for all events only when GTM in debug mode.",
            "defaultValue": true,
            "enablingConditions": [
              {
                "paramName": "enable_logs",
                "paramValue": true,
                "type": "EQUALS"
              }
            ]
          }
        ]
      }
    ],
    "help": "Lorem ipsum"
  },
  {
    "type": "GROUP",
    "name": "credits",
    "displayName": "Info",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "LABEL",
        "name": "info",
        "displayName": "\u003cb\u003eNameless Analytics Client-Side tracker configuration variable\u003c/b\u003e\u003c/br\u003e\nBeta version: 1.0.\n\u003c/br\u003e\nRead more about the \u003ca href\u003d\"https://github.com/tommasomoretti/nameless-analytics\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eNameless Analytics project\u003c/a\u003e or the \u003ca href\u003d\"https://github.com/tommasomoretti/nameless-analytics-client-side-tracker-configuration-variable\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eClient-side Config Variable\u003c/a\u003e.\n\u003c/br\u003e\nCreated by \u003ca href\u003d\"https://tommasomoretti.com/?utm_source\u003dtagmanager.google.com\u0026utm_medium\u003dreferral\u0026utm_campaign\u003dcs_analytics_config_variable\" target\u003d\u0027_blank\u0027 rel\u003d\"noopener\"\u003eTommaso Moretti\u003c/a\u003e\n\u003c/br\u003e\u003c/br\u003e"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const Object = require('Object');

data.is_na_config_variable = true;

Object.delete(data, 'gtmEventId');
return data;


___TESTS___

scenarios: []


___NOTES___

Created on 23/12/2025, 18:08:14


