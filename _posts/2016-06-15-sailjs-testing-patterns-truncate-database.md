---
layout: post
title: "sailsjs testing: how to truncate the database"
date: 2016-06-15
tags: [sailsjs, nodejs, testing, database]
---

SailsJS is a NodeJS MVC framework that we use for the OpenOpps Platform. Sails has some basic testing docs, but it doesn't explain how to set up the framework nicely where the database is dropped in between tests. I find myself always re-figuring out these patterns when I write experimental apps.

## With an in-memory database

This bootstrap.test.js will drop the database between tests:

```javascript
var sails = require('sails');

before(function(done) {
  sails.lift({
    // test config
    environment: 'test',
    port: 9999, // so we can run the app and tests at the same time
    hostName: 'localhost:9999',
    models: {
      connection: 'memory'
    },
  }, function(err, server) {
    if (err) return done(err);
    done(err, sails);
  });
});

after(function(done) {
  sails.lower(done);
});
```

## With PostgreSQL

When I need to use postgres, Waterline doesn't expose SQL truncate which would be much faster, instead this bootstrap.test.js will destroy all the models:

```javascript
var async = require('async');
var sails = require('sails');

before(function(done) {
  sails.lift({
    // test config
    environment: 'test',
    port: 9999, // so we can run the app and tests at the same time
    hostName: 'localhost:9999',
    models: {
      connection: 'postgresql'
    },
  }, function(err, server) {
    if (err) return done(err);
    done(err, sails);
  });
});

afterEach(function(done) {
  destroyFuncs = [];
  for (modelName in sails.models) {
    destroyFuncs.push(function(callback) {
      sails.models[modelName].destroy({})
        .exec(function(err) {
          callback(null, err)
        });
    })
  }
  async.parallel(destroyFuncs, function(err, results) {
    done(err);
  })
});

after(function(done) {
  sails.lower(done);
});
```

**Note:** When the function is executed the last model is used for all models. This is a common JavaScript closure gotcha that I always forget about.