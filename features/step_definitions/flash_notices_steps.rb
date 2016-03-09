Given(/^I go to user profile page$/) do
  visit('/users/edit')
end

Given(/^I see "(.*?)"$/) do |arg1|
  expect(page).to have_content('You need to sign in or sign up before continuing.
')
end

When(/^I click x on flash message$/) do
  find('a.close').click
end

Then(/^it should disappear$/) do
  expect(page).not_to have_content('You need to sign in or sign up before continuing.
')
end
