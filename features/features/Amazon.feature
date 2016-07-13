Feature: Search for strings on Amazon

@demo @amazon
Scenario: Search using a fixed string
  When I open amazon
  And I search amazon for "Mobile Fun"
  Then I should be on the amazon search results for "Mobile Fun"
  And I should see results for "I HATE BEING SEXY BUT SOMEBODY GOTTA DO IT"
