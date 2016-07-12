Given(/^the product "([^\"]*)" exists$/) do |product_alias|
  product = Product.new
  @test_world.add_product(product_alias, product)
end

When(/^I open amazon$/) do
    @amazon.load
end

When(/^I search for product "([^"]*)"$/) do |product_alias|
  product = @test_world.get_product product_alias
  @amazon.search product.name
end

Then(/^I should be on the search results for product "([^"]*)"$/) do |product_alias|
  name = @test_world.get_product(product_alias).name
  expect(@amazonresults.current_url).to include name.tr(' ', '+')
end