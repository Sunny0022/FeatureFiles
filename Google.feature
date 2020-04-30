Feature:
  'When I go to the Google search page, and search for an item,
  I expect to see some reference to that item in the result summary.'

  Scenario:
    Given that I have gone to the Google page
    When I add "Cucumber" to the search box
    Then I close the browser

  Scenario:
    Given that I have gone to the Google page
    When I add "Selenium" to the search box
    Then I close the browser
