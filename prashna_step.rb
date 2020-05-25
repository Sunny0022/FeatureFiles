require 'rubygems'
require 'selenium-webdriver'
require 'test/unit'

Given(/^I visit the Site$/) do
  @driver = Selenium::WebDriver.for :firefox
  @driver.get 'http://uday.domain4now.com/'
end

When(/^I click Signup form$/) do
  @driver.find_element(:xpath, '/html/body/nav/div[2]/ul/li[3]/a').click
  sleep 5
end

And(/^I enter (.*) in name field$/) do |name|
  if name == ''
    print 'Name Error'
  else
    @driver.find_element(:id, 'user_name').send_keys(name)
  end
end

And(/^I enter (.*) in email field$/) do |mail|
  @driver.find_element(:id, 'user_email').send_keys(mail)
end

And(/^I enter (.*) in password field$/) do |pass|
  @driver.find_element(:id, 'user_password').send_keys(pass)
end

And(/^I enter (.*) in confirm\-password field$/) do |confirm_pass|
  @driver.find_element(:id, 'user_password_confirmation').send_keys(confirm_pass)
  @driver.find_element(:xpath, '/html/body/div/div/div[1]/div/div/div[2]/form/div/div[2]/input').click
end

Then(/^user should be created with verification$/) do
  assert(@driver.find_element(:css, 'div.container:nth-child(1)').text.include?('Check you email for confirmation mail'), 'Assertion failed')
  puts 'Successfully completed the user registration and validates the Success'
  @driver.quit
end

Then(/^user should not be created$/) do
  puts 'user cant be created due to some errors' if @driver.find_element(:xpath, '/html/body/div/div/div[1]/div[1]/button').displayed?
  @driver.quit
end