# Welcome to Loomio! [![build status](https://secure.travis-ci.org/enspiral/loomio.png?branch=master)](https://secure.travis-ci.org/enspiral/loomio) [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/enspiral/loomio)

Loomio is a free and open-source web application that helps groups make better decisions together.

## Installation

### Install ImageMagick

You can install [ImageMagick](http://www.imagemagick.org/script/binary-releases.php)  with the following commands for Mac or Linux.

#### Mac

```
  $ sudo port install ImageMagick
```

#### Linux

```
  $ sudo apt-get install imagemagick libmagick9-dev
```
#### Ubuntu 12.04

```
  $ sudo apt-get install libmagickwand-dev
```

### Set up the database

```
  $ cd /dir/to/loomio/
  $ bundle install
  $ cp config/database.example.yml config/database.yml
  $ bundle exec rake db:create
  $ bundle exec rake db:schema:load
  $ bundle exec rake db:schema:load RAILS_ENV=test
  $ bundle exec rake db:seed
```

### Start the server

First start your postgres server (if it's not already running). Consult
postgres documentation if you're not sure how to do this.

Then start the Rails server:

```
  $ cd /dir/to/loomio/
  $ rails server
```

You can now see Loomio on your computer at `http:localhost:3000`

### Create a user

You'll need to create a Loomio user account on your machine that you can
use to interact with the site. Right now, the only way to do this is
through the Rails console:

```
  $ cd /dir/to/loomio/
  $ rails console
```

Once inside the console, run the following command to generate a user:

```
  > User.create(name: "Furry", email: "furry@example.com", password: "password")
```

Now you should be able to visit http://localhost:3000 and login as the user
above and start playing with the site.

You'll probably want to create several different users so that you can
test the site out properly. (Try using separate browsers if you want to
login with two users at the same time)

## Contribute

Loomio is being developed by a team of dedicated volunteers. We operate with a “flat” structure, meaning at the end of the day there’s no single person calling the shots. We all work together and decide collectively what the best decisions are, and we make these decisions using Loomio itself.

If you'd like to contribute to the project, check out [Contributing to Loomio](https://github.com/enspiral/loomio/wiki/Contributing-to-Loomio).

## License

GNU Affero General Public License (AGPL). Copyright (c) 2012 Loomio Limited

