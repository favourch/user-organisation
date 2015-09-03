
## Setting up the project

The project will require a Ruby version of at least 2.0. We used 2.2.2 while
creating this project.  We like [rbenv][rbenv] and [ruby-build][ruby-build] for
installing Ruby, but you can use whatever installation method works best for
you.

Once you have a working Ruby installation, and have cloned the application, the
following commands will get you running:

```
bundle exec rake db:schema:load db:seed
bundle exec guard
```

Once Guard has launched, press enter to have it run the full suite of tests and
checks against the project.

To start the web application:

```
bundle exec unicorn
```

[rbenv]: https://github.com/sstephenson/rbenv
[ruby-build]: https://github.com/sstephenson/ruby-build

