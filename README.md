# Reproducer for ruby-jwt issue 268

This is a simple RSpec test that reproduces [issue 268](https://github.com/jwt/ruby-jwt/issues/268) from the [ruby-jwt](https://github.com/jwt/ruby-jwt) GEM.

To run the spec, simply execute:

```
bundle
bundle exec rspec
```

The spec runs fine using jwt-ruby 2.1.0 (you can check this out by changing the dependency in the `Gemfile` and bundling again) but breaks on current master versions.
