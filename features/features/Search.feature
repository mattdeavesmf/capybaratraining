Feature: Search for strings on Google

@demo @fixedString
Scenario: Search using a fixed string
  When I open the homepage
  And I search for "Mobile Fun"
  Then I should be on the search results for "Mobile Fun"
  And I should see search results for "Mobile Fun"
  And I should see a link to "http://www.mobilefun.co.uk/"

@demo @randomPersonSearch
Scenario: Search for a randomised and saved query
  Given the user "Person A" exists
  When I open the homepage
  And I search for user "Person A"
  Then I should be on the search results for user "Person A"

@amazon
  Scenario: Search for a product on amazon
  Given the product "Product A" exists
  When I open amazon
  And I search for product "Product A"
  Then I should be on the search results for product "Product A"