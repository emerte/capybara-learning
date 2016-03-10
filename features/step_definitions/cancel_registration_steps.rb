When(/^I click link "(.*?)"$/) do |arg1|
  visit('/users/sign_in')
  fill_in('Email', with: 'jill@example.com')
  fill_in('Password', with: 'Password')
  find_button('Sign in').click
  visit('/users/edit')
  #binding.pry
  find_button(arg1).click
end

Then(/^I should see goodbye message$/) do
  expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.
")
end

Then(/^I shouldn't be able to log in again$/) do
  visit('/users/sign_in')
  fill_in('Email', with: 'jill@example.com')
  fill_in('Password', with: 'Password')
  find_button('Sign in').click
  expect(page).to have_content("Invalid email or password.
")
end
