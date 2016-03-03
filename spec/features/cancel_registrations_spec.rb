require 'rails_helper'

RSpec.feature "Cancel Registration", type: :feature do
  let!(:user) { User.create(email: email, password: password, password_confirmation: password) }
  let(:email) { 'jill@example.com' }
  let(:password) { 'password' }

  before do
    # Sign in
    visit('/users/sign_in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    find_button('Sign in').click
    visit('/users/edit')
    find_link('Cancel my account').click
    # Cancel registration
    # NOTE: Poltergeist ignore js alert/confirm dialogs
  end

  it "displays a goodbye message" do
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.
")
  end
  # Try to sign in again
  it "does not allow the user to sign in again" do
    visit('/users/sign_in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    find_button('Sign in').click
    expect(page).to have_content("Invalid email or password.
")
  end
end
