require 'rubygems'
require 'selenium-webdriver'

Given(/^i am on page$/) do
  @driver = Selenium::WebDriver.for :firefox
  @driver.get 'http://uday.domain4now.com/'
end

And(/^i click sign up link$/) do
  @driver.find_element(:xpath, '/html/body/nav/div[2]/ul/li[2]/a').click
  @driver.manage.timeouts.implicit_wait = 30
end

When(/^i fill the form$/) do
  @driver.find_element(:id, 'user_name').send_keys('automate125')
  @driver.find_element(:id, 'user_email').send_keys('automate125@domain.com')
  @driver.find_element(:id, 'user_password').send_keys('Password123,.')
  @driver.find_element(:id, 'user_password_confirmation').send_keys('Password123,.')
  @driver.find_element(:xpath, '/html/body/div/div/div/div/div[2]/form/div/div[2]/input').click
  @driver.manage.timeouts.implicit_wait = 30
end

Then(/^i display result$/) do
  sleep 5
  @driver.quit
  puts 'new user created'
end
