
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

## Submitting changes

AAF works using [GitHub Flow][flow]. Before you start making any changes, you'll
want to create your own branch. For this project (and all projects in AAF should
you be offered a position), you will not need to fork the repository to your own
account.

We'll be reading your commit log, so if each commit is fairly atomic and has a
[quality commit message][commit-message], it will be easier for us to understand
your work.

Please submit your work by pushing **your branch** to the original repository,
and creating one or more pull requests. The pull requests should be formatted in
a way that you would feel comfortable submitting to an open source project.

[flow]: https://guides.github.com/introduction/flow/
[commit-message]: https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
