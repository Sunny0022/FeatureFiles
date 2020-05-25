Feature: Sign up Form with parameters

  Scenario Outline: Testing the Sign up form
    Given I visit the Site
    When I click Signup form
    And I enter <name> in name field
    And I enter <mail> in email field
    And I enter <pass> in password field
    And I enter <confirm-pass> in confirm-password field
    Then user should be created with verification
    Examples:
      | name   | mail             | pass    | confirm-pass   |
      | rohan  | rohan1@domain.com| Rohan1, | Rohan1,        |
      | test2  | test7@domain.com | Test2,  | Test2,         |
      | bob    | bob17@domain.com | Bob123, | Bob123,        |
      | Olive  | olive5@domain.com| Olive1, | Olive1,        |
      | Newuser| new124@domain.com| New12,  | New12,         |
    Scenario Outline: Testing the Sign up form with invalid data
      Given I visit the Site
      When I click Signup form
      And I enter <name> in name field
      And I enter <mail> in email field
      And I enter <pass> in password field
      And I enter <confirm-pass> in confirm-password field
      Then user should not be created
      Examples:
        | name | mail             | pass   | confirm-pass |
        |      |                  |        |              |
        | Rolly|                  |pP123,  | pP123,       |
        | Vicky|'vicky'@domain.com|Vic12,  |              |

        |      |test@domain.com   |Test1/  | Test1/       |
        | Lilly|lilly_1@domain.com|Lil1,.  |              |
        | Sunny|sunny-2@domain.com|        | Sun12,       |
