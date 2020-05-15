require 'rubygems'
require 'selenium-webdriver'

Given(/^i go to page$/) do
  @driver = Selenium::WebDriver.for :firefox
  @driver.get 'http://uday.domain4now.com/login'
end

When(/^i enter the credentials$/) do
  @driver.find_element(:id, 'email').send_keys('automate125@domain.com')
  @driver.find_element(:id, 'password').send_keys('Password123,.')
  @driver.find_element(:id, 'remember').click
  @driver.find_element(:xpath, '/html/body/div/div/div/div/div[2]/form/div/div[2]/input').click
  @driver.manage.timeouts.implicit_wait = 30
end

Then(/^user is signed in$/) do
  sleep 2
  @driver.find_element(:xpath, '/html/body/nav/div[2]/ul/li/a').click
  @driver.manage.timeouts.implicit_wait = 30
  sleep 5
  @driver.quit
  puts 'user successfully logged in and out'
end
