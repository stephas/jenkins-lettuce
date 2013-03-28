jenkins-lettuce
===============

Simple project skeleton with test integration included to base a python2 project on

Goals
-----

Provide out-of-box experience for nosetests, lettuce, pep8 and pylint with jenkins integration.

Easy setup of commit hooks for developers to run smaller test suite before pushes upstream, which trigger jenkins run as above.

Use as base for other python projects.

Maintain Vagrantfile to bootstrap jenkins environment on localhost:18080 for Ubuntu 12.

Get started
-----------

see JENKINS_HOWTO for the manual jenkins install and configuration

a basic jenkins install is available in the given Vagrantfile.

if you have virtualbox and the vagrant gem, you can get a virtualmachine using:

```
  $ vagrant up
  ...
```

1. set the name for your application like so (no spaces atm):

```
  $ echo myapp > APPNAME
```

