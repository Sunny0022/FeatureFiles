require 'selenium-webdriver'

Given (/^that I have gone to the Google page$/) do
  @driver = Selenium::WebDriver.for :firefox
  @driver.navigate.to 'http://www.google.com'
end

When (/^I add "(.*)" to the search box$/) do |item|
  @driver.find_element(:name, 'q').send_keys(item)
end
Then("I close the browser") do
  puts 'The Google is launched'
  @driver.quit
end
