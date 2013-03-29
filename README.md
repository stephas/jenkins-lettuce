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

1.  set the name for your application like so (no spaces atm):

    ```
      $ echo myapp > APPNAME
    ```

2.  see [manual jenkins install and configuration](vagrant/JENKINS_HOWTO)

    OR

    use the basic jenkins install available in the given Vagrantfile (see step 3.)

3.  if you have virtualbox and the vagrant gem, you can get a virtualmachine using:

    ```
      $ vagrant up
      ...
    ```

