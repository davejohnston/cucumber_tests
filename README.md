# Cucumber Tests

This is a simple Cucumber test designed to test the service end-2-end.
On OSX the test will launch a browser and execute the test.
On any other platform it will run in headless mode.

The test using Capybara with Selenium.  It's configured to use the firefox browser with the geckodriver.

## Prerequisites
+ Install Firefox (tested with 55.03) https://www.mozilla.org/en-US/firefox/new/
+ Install geckodriver https://github.com/mozilla/geckodriver/releases

## macOS Install
Checkout the project, and install the dependancies.

    git clone git@github.com:davejohnston/cucumber_tests.git
    cd cucumber_tests
    gem install bundler
    bundle install

## CentOS 7 Install

    sudo yum install ruby \
    ruby-devel libffi-devel \
    gcc \
    make \
    zlib-devel \
    xorg-x11-server-Xvfb.x86_64 \
    which \
    nss

    gem install bundler
    bundle install

## Running Tests
The tests are defined as 'features'.  As part of the tests it requires an SSH key.  Copy the SSH key for the fakehosts to the cucumber_tests directory before running.

    cp ~/.ssh/id_rsa-acceptance .
    cucumber features/
