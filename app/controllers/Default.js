'use strict';

var utils = require('../utils/writer.js');
var Default = require('../service/DefaultService');

module.exports.createUsersPOST = function createUsersPOST (req, res, next) {
  var user = req.swagger.params['user'].value;
  Default.createUsersPOST(user)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.deleteUsersByIdUserIdDELETE = function deleteUsersByIdUserIdDELETE (req, res, next) {
  var userId = req.swagger.params['userId'].value;
  Default.deleteUsersByIdUserIdDELETE(userId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.getusersByIdUserIdGET = function getusersByIdUserIdGET (req, res, next) {
  var userId = req.swagger.params['userId'].value;
  Default.getusersByIdUserIdGET(userId)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.getusersGET = function getusersGET (req, res, next) {
  Default.getusersGET()
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};

module.exports.updateUsersByIdUserIdPUT = function updateUsersByIdUserIdPUT (req, res, next) {
  var userId = req.swagger.params['userId'].value;
  var user = req.swagger.params['user'].value;
  Default.updateUsersByIdUserIdPUT(userId,user)
    .then(function (response) {
      utils.writeJson(res, response);
    })
    .catch(function (response) {
      utils.writeJson(res, response);
    });
};
