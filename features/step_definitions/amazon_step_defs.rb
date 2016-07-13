When(/^I open amazon$/) do
  @amazon.load
end

When(/^I search amazon for "([^"]*)"$/) do |term|
  @amazon.search term
end

Then(/^I should be on the amazon search results for "([^"]*)"$/) do |text|
  expect(@amazonResults).to have_search_results minimum: 10
  expect(@amazon).to have_text "results for \"text\""
end

Then(/^I should see results for "([^"]*)"$/) do |text|
  expect(@amazonResults).to have_text text
end
