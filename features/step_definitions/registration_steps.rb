Then(/^I should see sign up error message$/) do
  expect(page).to have_content("Email can't be blank")
end

Then(/^I should see sign in message$/) do
  expect(page).to have_content("You have signed up successfully.")
end
