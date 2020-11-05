"use strict";

var _vue = _interopRequireDefault(require("vue"));

var _App = _interopRequireDefault(require("./App.vue"));

var _index = _interopRequireDefault(require("./libs/router/index"));

var _store = _interopRequireDefault(require("@/store"));

var _vuetify = _interopRequireDefault(require("@/plugins/vuetify"));

var _lib = _interopRequireDefault(require("vuetify/lib"));

var _vuelidate = _interopRequireDefault(require("vuelidate"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

_vue["default"].config.productionTip = false;

_vue["default"].use(_lib["default"]);

_vue["default"].use(_vuelidate["default"]);

new _vue["default"]({
  router: _index["default"],
  store: _store["default"],
  vuetify: _vuetify["default"],
  render: function render(h) {
    return h(_App["default"]);
  }
}).$mount('#app');