Given(/^I am signed in$/) do
  visit('/users/sign_up')
  fill_in('Email', with: 'jill@example.com')
  fill_in('user_password', with: 'Password')
  fill_in('user_password_confirmation', with: 'Password')
  find_button('Sign up').click
end
