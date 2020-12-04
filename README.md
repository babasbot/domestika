# README

### Getting Started

Install [Ruby 2.7.2](https://www.ruby-lang.org/es/news/2020/10/02/ruby-2-7-2-released/) and then install the project dependencies with:

```sh
$ bundle install
```

Then, install the javascript dependencies with:

```sh
$ yarn
```

Then, create the project database and run migration scripts with:

```sh
$ bundle exec rails db:create db:migrate
```

Finally, start the application with:

```sh
$ rails server
```

### Run the test suite

```
$ bundle exec rspec
```
