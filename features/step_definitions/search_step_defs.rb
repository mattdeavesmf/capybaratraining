When(/^I search for "([^\"]*)"/) do |text|
  @home.search text
end

Then(/^I should be on the search results for "([^\"]*)"$/) do |search_text|
  expect(@results.current_url).to include CGI::escape(search_text)
end

Then(/^I should see search results for "([^\"]*)"$/) do |text|
  expect(@results).to have_search_results minimum: 10
  expect(@results.search_results[0]).to have_text text
end

Then(/^I should see a link to "([^"]*)"$/) do |url|
  expect(@results.search_result_links).to include(url)
end
