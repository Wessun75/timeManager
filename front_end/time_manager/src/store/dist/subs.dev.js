"use strict";

var _store = _interopRequireDefault(require("@/store"));

var _axios = _interopRequireDefault(require("axios"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

_store["default"].subs(function (mutation) {
  //setting axios headers and localStorage
  switch (mutation.type) {
    case 'auth/SET_TOKEN':
      if (mutation.payload) {
        //set the axios header to token if there was no error
        _axios["default"].defaults.headers.common['Authorization'] = "Bearer ".concat(mutation.payload);
      } else {
        //set the axios header to null because there was an error recieving
        //the token from the api
        _axios["default"].defaults.headers.common['Authorization'] = 'null';
      }

      break;
  }
});