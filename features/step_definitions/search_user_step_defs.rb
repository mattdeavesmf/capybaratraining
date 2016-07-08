Given(/^the user "([^\"]*)" exists$/) do |user_alias|
  user = User.new
  @test_world.add_user(user_alias, user)
end

When(/^I search for user "([^"]*)"$/) do |user_alias|
  user = @test_world.get_user user_alias
  @home.search user.name
end

Then(/^I should be on the search results for user "([^"]*)"$/) do |user_alias|
  name = @test_world.get_user(user_alias).name
  expect(@results.current_url).to include name.tr(' ', '+')
end