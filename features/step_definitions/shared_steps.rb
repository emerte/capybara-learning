Given(/^I am signed in$/) do
  visit('/users/sign_in')
  fill_in('Email', with: 'jill@example.com')
  fill_in('Password', with: 'Password')
  find_button('Sign in').click
end
