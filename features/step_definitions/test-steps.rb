Given(/^I am on a page$/) do
  visit "/"
end

When(/^I click a mix$/) do
  find(".mix").click
end

When(/^I click skip$/) do
  find(".skip").click
end

Then(/^the player displays "([^"]*)"$/) do |track|
  expect(find(".current")).to have_text(track)
end
