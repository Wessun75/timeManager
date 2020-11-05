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
      var dispatch, res;
      return regeneratorRuntime.async(function signIn$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              dispatch = _ref.dispatch;
              _context.next = 3;
              return regeneratorRuntime.awrap(_axios["default"].post('http://localhost:4000/api/users/sign_in', user_info));

            case 3:
              res = _context.sent;
              dispatch('attempt', res.data.token);

            case 5:
            case "end":
              return _context.stop();
          }
        }
      });
    },
    //get the token 
    attempt: function attempt(_ref2, token) {
      var commit, state, res;
      return regeneratorRuntime.async(function attempt$(_context2) {
        while (1) {
          switch (_context2.prev = _context2.next) {
            case 0:
              commit = _ref2.commit, state = _ref2.state;

              if (token) {
                commit('SET_TOKEN', token);
              }

              if (state.token) {
                _context2.next = 4;
                break;
              }

              return _context2.abrupt("return");

            case 4:
              _context2.prev = 4;
              _context2.next = 7;
              return regeneratorRuntime.awrap(_axios["default"].get('http://localhost:4000/api/users/sign_in', {
                headers: {
                  'Authorization': 'Bearer' + token
                }
              }));

            case 7:
              res = _context2.sent;
              _context2.next = 14;
              break;

            case 10:
              _context2.prev = 10;
              _context2.t0 = _context2["catch"](4);
              commit('SET_TOKEN', null);
              commit('SET_USER', null);

            case 14:
            case "end":
              return _context2.stop();
          }
        }
      }, null, null, [[4, 10]]);
    }
  }
};
exports["default"] = _default;