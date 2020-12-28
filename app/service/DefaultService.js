'use strict';


/**
 *
 * user User 
 * returns user
 **/
exports.createUsersPOST = function(user) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "address" : {
    "zip" : "zip",
    "country" : "country",
    "city" : "city",
    "street" : "street",
    "id" : 6,
    "state" : "state"
  },
  "name" : "name",
  "id" : 0,
  "birthDate" : "birthDate",
  "email" : "email"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 *
 * userId Integer 
 * no response value expected for this operation
 **/
exports.deleteUsersByIdUserIdDELETE = function(userId) {
  return new Promise(function(resolve, reject) {
    resolve();
  });
}


/**
 * Get one user
 *
 * userId Integer 
 * returns user
 **/
exports.getusersByIdUserIdGET = function(userId) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "address" : {
    "zip" : "zip",
    "country" : "country",
    "city" : "city",
    "street" : "street",
    "id" : 6,
    "state" : "state"
  },
  "name" : "name",
  "id" : 0,
  "birthDate" : "birthDate",
  "email" : "email"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 * Get all users
 *
 * returns List
 **/
exports.getusersGET = function() {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = [ {
  "address" : {
    "zip" : "zip",
    "country" : "country",
    "city" : "city",
    "street" : "street",
    "id" : 6,
    "state" : "state"
  },
  "name" : "name",
  "id" : 0,
  "birthDate" : "birthDate",
  "email" : "email"
}, {
  "address" : {
    "zip" : "zip",
    "country" : "country",
    "city" : "city",
    "street" : "street",
    "id" : 6,
    "state" : "state"
  },
  "name" : "name",
  "id" : 0,
  "birthDate" : "birthDate",
  "email" : "email"
} ];
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}


/**
 *
 * userId Integer 
 * user User 
 * returns user
 **/
exports.updateUsersByIdUserIdPUT = function(userId,user) {
  return new Promise(function(resolve, reject) {
    var examples = {};
    examples['application/json'] = {
  "address" : {
    "zip" : "zip",
    "country" : "country",
    "city" : "city",
    "street" : "street",
    "id" : 6,
    "state" : "state"
  },
  "name" : "name",
  "id" : 0,
  "birthDate" : "birthDate",
  "email" : "email"
};
    if (Object.keys(examples).length > 0) {
      resolve(examples[Object.keys(examples)[0]]);
    } else {
      resolve();
    }
  });
}

