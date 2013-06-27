fkapi - Fake API
================

Why?
====

Allows for mocking API responses using yaml or json files

About
=====

Install
=======
- Clone
  git clone git@github.com:bmoises/fkapi.git
- Bundle
  bundle install --path bundler


Usage
=====

**Server Mode**

- Run
  ./bin/fkapi --input samples/test_endpoints.yaml

- Test

  curl "http://localhost:4567/test?one=1&two=2"
  curl "http://localhost:4567/test_not_strict?one=1&two=3"

