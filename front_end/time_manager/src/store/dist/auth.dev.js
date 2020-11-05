"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports["default"] = void 0;

var _axios = _interopRequireDefault(require("axios"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var _default = {
  namespaced: true,
  state: {
    token: '',
    user: {}
  },
  getters: {
    /*
    authenticated(state){
    
    return state.token && state.user
    },
    user(){
    return state.user
    }*/
  },
  mutations: {
    SET_TOKEN: function SET_TOKEN(state, token) {
      state.token = token;
    },
    SET_USER: function SET_USER(state, data) {
      state.user = data;
    }
  },
  actions: {
    signIn: function signIn(_ref, user_info) {
      var commit, res;
      return regeneratorRuntime.async(function signIn$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              commit = _ref.commit;
              _context.next = 3;
              return regeneratorRuntime.awrap(_axios["default"].post('http://localhost:4000/api/users/sign_in', user_info));

            case 3:
              res = _context.sent;
              commit('SET_TOKEN', res.data);
              console.log(res.data.token);
              commit('SET_USER', user_info);

            case 7:
            case "end":
              return _context.stop();
          }
        }
      });
    },
    signUp: function signUp(_ref2, user_info) {
      var commit, res;
      return regeneratorRuntime.async(function signUp$(_context2) {
        while (1) {
          switch (_context2.prev = _context2.next) {
            case 0:
              commit = _ref2.commit;
              _context2.next = 3;
              return regeneratorRuntime.awrap(_axios["default"].post('http://localhost:4000/api/users/sign_up', user_info));

            case 3:
              res = _context2.sent;
              commit('SET_TOKEN', res.data);
              commit('SET_USER', user_info);

            case 6:
            case "end":
              return _context2.stop();
          }
        }
      });
    }
  }
};
exports["default"] = _default;