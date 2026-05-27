// --------------------------------------------------------------------------------------------------------------
// NAMELESS ANALYTICS | CLIENT SIDE | TRACKER CONFIGURATION VARIABLE
// This variable is used to store configuration data for the Nameless Analytics Client-Side Tracker Tag.
// --------------------------------------------------------------------------------------------------------------

const Object = require('Object');

data.is_na_config_variable = true;

Object.delete(data, 'gtmEventId');
return data;
