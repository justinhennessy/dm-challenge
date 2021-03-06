# DMChallenge
[![Build Status](https://travis-ci.org/justinhennessy/dm-challenge.png)](https://travis-ci.org/justinhennessy/dm-challenge)
![](https://coveralls.io/repos/justinhennessy/dm-challenge/badge.png?branch=master)
![](https://codeclimate.com/github/justinhennessy/dm-challenge.png)

![Build Status](https://semaphoreapp.com/api/v1/projects/85cf7fbc-e3a3-449a-95b9-bd6ad09cc8cb/159915/shields_badge.png)

DMChallenge is for passionate cyclists that are after a tool to help their team
to achieve a common goal that each member commits to.

## TODO

- Implement login with Facebook (done)
- Implement security for user views
- Implement login with Strava
- Implement downloading of users activities

## Required Environment

* Ruby 2.0.0

## Required Global Gems

* bundler ~> 1.3.5
* rails ~> 4.0.0.rc1

## Minimum Setup

Start application server.

    rails s

## Configuration

None

## Development

The main, stable branch is `master`. All work should be contained in
isolated feature branches and will be merged into `master` when peer
reviewed on GitHub.

## Mail

Currently none.

## Testing

Run the entire test suite.

    rspec -f d

Run an individual test file

    rspec -f d path/to/file.rb
