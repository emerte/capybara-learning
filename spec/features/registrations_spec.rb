require 'rails_helper'

RSpec.feature "User Registration", type: :feature do
  before do
    visit root_path
    within('.navbar') { click_link('Sign up') }
  end

  context "failure" do
    before do
      #fill_in("Email", with: "")
      fill_in("Password", with: "password")
      fill_in("Password confirmation", with: "password")
      find_button("Sign up").click
      # try to sign up without an email
    end

    it "displays an error message" do
      expect(page).to have_content("Invalid email or password.
")
    end

    # should still see 'Sign in' and 'Sign up'
    # should not see 'Profile' or 'Sign out'
    it "shows the correct navigation links" do
      expect(page).to have_submit_button("Sign in")
      expect(page).to have_submit_button("Sign up")
      expect(page).not_to have_submit_button("Profile")
      expect(page).not_to have_submit_button("Sign out")
    end
  end

  context "success" do
    before do
      fill_in("Email", with: "mwernecki@gmail.com")
      fill_in("Password", with: "password")
      find_button("Sign up").click
      # sign up successfully
    end

    it "displays a welcome message" do
      expect(page).to have_content("Signed in successfully.
")
    end

    # should not see 'Sign in' and 'Sign up'
    # should see 'Profile' or 'Sign out'
    it "shows the correct navigation links" do
      expect(page).not_to have_submit_button("Sign in")
      expect(page).not_to have_submit_button("Sign up")
      expect(page).to have_submit_button("Profile")
      expect(page).to have_submit_button("Sign out")
    end
  end
end
