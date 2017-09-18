require 'capybara/cucumber'
require 'capybara/rspec'
require "selenium-webdriver"
require 'headless'
require 'os'


Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

unless OS.mac?
    @headless = Headless.new
    @headless.start
end

Capybara.register_driver :selenium do |app|
  Selenium::WebDriver.logger.level = :warn
  capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
  Capybara.default_max_wait_time = 300
  Capybara::Selenium::Driver.new(app, :browser => :firefox, desired_capabilities: capabilities)
end
